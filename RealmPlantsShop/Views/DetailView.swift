
import SwiftUI
import RemoteImage

struct DetailView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    let title: String
    let category: String
    let price: Double
    let description: String
    let url: URL
    let id: Int
    
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HeaderView(label: title)
                        .padding(.leading, 20)
                    Text(category)
                } .padding()
                RemoteImage(type: .url(url), errorView: { error in
                           Text(error.localizedDescription)
                       }, imageView: { image in
                           image
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                            .padding()
                            .cornerRadius(18)
                       }, loadingView: {
                           Text("Loading ...")
                       })

                
            }
            Text("About: ")
                .fontWeight(.bold)
                .foregroundColor(.myColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom, .leading,.top])

            Text(description)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment:  .leading)
                .padding([.leading])
            Spacer()
            HStack{
                    Text("$" + String(price))
                        .font(.system(size: 30))
                        .foregroundColor(.myColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
               
                
                Button(action: {
                    let basket = BasketStore(realm: kategoriaStore.realm)
                    let element = kategoriaStore.getByName(title: title)
                    basket.addToCardRealm(product: element)
                  
                }, label: {
                    HStack{
                        Text("Add to card")
                        Image(systemName: "plus.app.fill")
                                .foregroundColor(.myColor)
                            .frame(width: 50, height: 50)
                    }
                
             
            })
            } .padding(.bottom,15)
            .padding(.leading,15)
            .padding(.trailing,15)
            
            
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
