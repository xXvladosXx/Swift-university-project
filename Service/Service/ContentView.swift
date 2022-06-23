import SwiftUI

struct ContentView: View {
    @State var myText: String = ""
    var body: some View {
        NavigationView{
            StartPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
