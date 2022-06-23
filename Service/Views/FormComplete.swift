import SwiftUI
import CoreData

struct FormComplete: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var phone: String = ""
    @State private var issue: String = ""

    @State private var isSurnameValid : Bool   = true
    @State private var isNameValid : Bool   = true
    @State private var isPhoneValid : Bool   = true

    @State private var pass : Bool   = false

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Klients.phone, ascending: true)],
        animation: .default)
    private var klients: FetchedResults<Klients>

    var body: some View {
        NavigationView {
            VStack {
                Group{
                    Text("Zgłoszenie problemu")
                 TextField("imię:", text: $name, onEditingChanged: { (isChanged) in
                     if !isChanged {
                         if self.textFieldValidatorName(self.name) {
                             self.isNameValid = true
                             self.pass = true
                         } else {
                             self.isNameValid = false
                             self.pass = false
                             self.name = ""
                         }
                     }
                 })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.blue.opacity(0.5))
                        .font(.headline)
                        .padding(.top, 15)
                    if !self.isNameValid {
                                Text("Imie wpisano nie prawidlowo")
                                    .font(.callout)
                                    .foregroundColor(Color.red)
                            }
                 TextField("Nazwisko:", text: $surname, onEditingChanged: { (isChanged) in
                     if !isChanged {
                         if self.textFieldValidatorSurname(self.surname) {
                             self.isSurnameValid = true
                             self.pass = true
                         } else {
                             self.isSurnameValid = false
                             self.pass = false
                             self.surname = ""
                         }
                     }
                 })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.blue.opacity(0.5))
                        .font(.headline)
                        .padding(.top, 5)
                    if !self.isSurnameValid {
                                Text("Nazwisko wpisano nie prawidlowo")
                                    .font(.callout)
                                    .foregroundColor(Color.red)
                            }
                 TextField("Numer telefonu:", text: $phone, onEditingChanged: { (isChanged) in
                     if !isChanged {
                         if self.textFieldValidatorPhone(self.phone) {
                             self.isPhoneValid = true
                             self.pass = true
                         } else {
                             self.isPhoneValid = false
                             self.pass = false
                             self.phone = ""
                         }
                     }
                 })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.blue.opacity(0.5))
                        .font(.headline)
                        .padding(.top, 5)
                    if !self.isPhoneValid {
                                Text("Numer telefonu wpisany nie prawidlowo")
                                    .font(.callout)
                                    .foregroundColor(Color.red)
                            }
                 TextField("Podaj problem:", text: $issue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.blue.opacity(0.5))
                        .font(.headline)
                        .padding(.top, 5)
                        .padding(.bottom, 15)
                    



            Section {
                 Button{
                         self.addKlient()
                 }label: {
                     Text("Send")
                         .frame(width: 250, height: 40)
                         .background(Color.blue.opacity(0.5))
                         .cornerRadius(20)
                         .foregroundColor(.white)
                         .font(.headline)
                 }
            }
            .disabled( !pass || issue.isEmpty || name.isEmpty || surname.isEmpty || issue.isEmpty)
                }
            }.padding(.top, -260)
        }.navigationBarItems(trailing: NavigationLink(destination: AllForms()){
            Text("Pokaz")
        })
    }
    
    func textFieldValidatorName(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let nameFormat = #"^[A-Z][-a-zA-Z]+$"#
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameFormat)
        return namePredicate.evaluate(with: string)
    }
    
    func textFieldValidatorSurname(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let surnameFormat = #"^[A-Z][-a-zA-Z]+$"#
        let surnamePredicate = NSPredicate(format:"SELF MATCHES %@", surnameFormat)
        return surnamePredicate.evaluate(with: string)
    }
    
    func textFieldValidatorPhone(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let phoneFormat = #"^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$"#
        let phonePredicate = NSPredicate(format:"SELF MATCHES %@", phoneFormat)
        return phonePredicate.evaluate(with: string)
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
    
}

struct FormComplete_Previews: PreviewProvider {
    static var previews: some View {
        FormComplete().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
