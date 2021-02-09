
import SwiftUI
import RemoteImage
//tu potrzebuje z bd, foto, nazwy, kategorii



struct GridCellView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    let title: String
    let url: URL
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
            } .padding([.horizontal])
            RemoteImage(type: .url(url), errorView: { error in
                       Text(error.localizedDescription)
                   }, imageView: { image in
                       image
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                   }, loadingView: {
                       Text("Loading ...")
                   })
            
            
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .frame(width: 180, height: 260)
        .background(Color(.white))
//        .foregroundColor(Color(.label))
        .shadow(radius: 5)
        .cornerRadius(18)
    }
}
//
//struct GridCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridCellView(title: "Kaktus", url: URL("https://www.google.pl"!))
//    }
//}
