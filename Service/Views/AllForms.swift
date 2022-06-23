import SwiftUI
import CoreData

struct AllForms: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Klients.phone, ascending: true)],
        animation: .default)
    private var klients: FetchedResults<Klients>
    var body: some View {
        VStack {
            
            List {
                ForEach(klients, id: \.self) { klient in
                    Text("Name: \(klient.name!) \nSurname: \(klient.surname!) \nNumer telefonu: \(klient.phone!) \nProblem: \(klient.issue!)")
            }
            .onDelete(perform: deleteKlient)
                
            }
            
        }
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




struct AllForms_Previews: PreviewProvider {
    static var previews: some View {
        AllForms()
    }
}
