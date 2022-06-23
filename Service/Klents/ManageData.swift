import SwiftUI
import CoreData

struct ManageData: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var phone: String = ""
    @State private var issue: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Klients.phone, ascending: true)],
        animation: .default)
    private var klients: FetchedResults<Klients>

    var body: some View {
        NavigationView {
            VStack {
                    Text("Danne klienta")
                 TextField("imię:", text: $name)
                 TextField("Nazwisko:", text: $surname)
                 TextField("Numer telefonu:", text: $phone)
                 TextField("Podaj problem:", text: $issue)
                 Button("Dodaj"){
                    self.addKlient()
                 }

                
                List {
                    ForEach(klients) { klient in
                        Text("Name: \(klient.name!) \nSurname: \(klient.surname!) \nNumer telefonu: \(klient.phone!) \nProblem: \(klient.issue!)")
                    }
                    .onDelete(perform: deleteKlient)
                    }
                }
        }
    }
    
    private func addKlient(){
        let newKlient = Klients(context: viewContext)
        newKlient.name = name
        newKlient.surname = surname
        newKlient.phone = phone
        newKlient.issue = issue
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
        }
        name = ""
        surname = ""
        phone = ""
        issue = ""
    }
    private func deleteKlient(offsets: IndexSet) {withAnimation {
        offsets.map { klients[$0] }.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
        }
        }
    }
}

struct ManageData_Previews: PreviewProvider {
    static var previews: some View {
        ManageData().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
