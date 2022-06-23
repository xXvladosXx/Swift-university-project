import SwiftUI
import MapKit
struct About: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Techno World")
                    .font(.title)

                HStack {
                    Text("aleja Dzieci Polskich 20, 04-730")
                    Spacer()
                    Text("Warszawa")
                }
                .font(.subheadline)
                HStack {
                    Text("tel: 8 800 555 35 35")

                }
                .font(.subheadline)
                Divider()

                Text("Godziny pracy")
                    .font(.title2)
                Text("Pn-Pt:     8:00 - 19:00").font(.subheadline)
                Text("Sob-Nd:  8:00 - 15:00").font(.subheadline)
            }
            .padding()

            Spacer()
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
