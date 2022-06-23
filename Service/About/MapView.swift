import SwiftUI
import MapKit
struct MapView: View {
    @State var myAnnotation = MyAnnotation(title: "Techno world",
                                           coordinate: CLLocationCoordinate2D(latitude:52.208522138623096, longitude: 21.19281878990961))
    @State var newSpan: Double = 0.2
    var body: some View {
        VStack{
            MapedView(myAnnotation: $myAnnotation, span: $newSpan)
                .onTapGesture { self.changeZoom() }

        }
    }

    private func changeZoom(){
        self.newSpan -= 0.03
        if(self.newSpan < 0.02){
            self.newSpan = 0.2
        }
        }
    }
    class MyAnnotation: NSObject, MKAnnotation {
        let title: String?
        let coordinate: CLLocationCoordinate2D
        init(title: String?,
             coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.coordinate = coordinate
        }
    }
    struct MapedView: UIViewRepresentable{
        @Binding var myAnnotation : MyAnnotation
        @Binding var span : Double
        func makeUIView(context: Context) -> MKMapView {
            let myMap = MKMapView(frame: .zero)
            return myMap
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span1 = MKCoordinateSpan(latitudeDelta: span,
                                     longitudeDelta: span)
        let region = MKCoordinateRegion(center:
                                            myAnnotation.coordinate, span: span1)
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation((myAnnotation))
        }
        }
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
