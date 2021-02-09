
import SwiftUI
import RemoteImage




struct GridCellViewProduct: View {
    
    let title: String
    let url: URL
    let price: Double
    let subtitle: String
    
    
    
    var body: some View {
        VStack{
            RemoteImage(type: .url(url), errorView: { error in
                       Text(error.localizedDescription)
                   }, imageView: { image in
                       image
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                   }, loadingView: {
                       Text("Loading ...")
                   })
            VStack{
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment:  .leading)
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding([.top, .trailing, .leading])
            
                
                
           
            HStack{
                Text("$" + String(price))
                    .font(.body)
                    .bold()
                    .padding()
                    .foregroundColor(.myColor)
                Spacer()
                Image(systemName: "plus.app.fill")
                    .foregroundColor(.myColor)
                    .padding()
                    .frame(width: 50, height: 50, alignment: .bottomTrailing)
                
            }
        }
        .frame(width: 180, height: 260)
        .background(Color(.white))
        .foregroundColor(Color(.label))
        .shadow(radius: 10)
        .cornerRadius(18)
        }
}
//
//struct GridCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridCellView(title: "Kaktus", url: URL("https://www.google.pl"!))
//    }
//}


