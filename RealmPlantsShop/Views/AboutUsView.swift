
import SwiftUI
import MapKit

struct AboutUs: View {
    
    var body: some View {
        VStack{
            HeaderView(label: "Planty Plants Shop")
                .padding([.leading])
             Text("About Us")
                .foregroundColor(.gray)
                .font(.title)
                .padding( [.bottom])
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.")
                .padding()
            MapView()
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
      
        
    }
}

//struct AboutUs_Previews: PreviewProvider {
//    static var previews: some View {
//        AboutUs()
//    }
//}
