import SwiftUI

struct MainPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView{
            VStack(){
                Image("main")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .animation(.easeInOut)
                    .padding(.top, -145)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)


                    Text("Bazując na wieloletnim doświadczeniu i nowoczesnych technologiach jesteśmy w stanie naprawić każdy komputer osobisty. Każda naprawa poprzedza jest darmowa diagnozą i wycena naprawy.")
                    .padding(.bottom, 30)
                    .multilineTextAlignment(.center)
                Group{
                    NavigationLink(destination: FormComplete()){
                        Text("Zgłoś problem")
                            .fontWeight(.semibold)
                            .padding(.vertical,20.0)
                            .padding(.horizontal,79.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                            )
                    }.padding(.vertical,5)
                    NavigationLink(destination: About()){
                        Text("O nas")
                            .fontWeight(.semibold)
                            .padding(.vertical,20.0)
                            .padding(.horizontal,115.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                            )
                    }.padding(.vertical,5)
                }
             }        }.navigationBarHidden(true)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
/*
 
 .navigationViewStyle(.stack)
 .navigationBarBackButtonHidden(true)
 .navigationBarItems(leading: Text("Contacts"), trailing: NavigationLink(destination: FormComplete()){
     Text("Add contact")
 })
 */
