import SwiftUI

struct StartPage: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
            NavigationView{
                VStack {
                    Text("Techno World")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.bottom,20)
                    Group{
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                            .animation(.easeInOut)
                            .scaleEffect(scale)
                            .gesture(
                                TapGesture()
                                    .onEnded() {_ in
                                      if (scale < 0.6){
                                          scale = 1.0
                                      }
                                        if (scale > 0.6){
                                            scale = 1.0
                                        }
                                    }
                            )
                            .gesture(MagnificationGesture()
                                .onChanged { value in
                                self.scale = value.magnitude
                            })
                            NavigationLink(destination: MainPage())
                            {
                            Text("Sign in")
                                .fontWeight(.semibold)
                                .padding(.vertical,10.0)
                                .padding(.horizontal,45.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(lineWidth: 2.0)
                                        .shadow(color: .blue, radius: 10.0)
                                )
                            }
                }.frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom,50)
            }
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
