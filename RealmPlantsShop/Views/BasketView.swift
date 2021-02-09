
import SwiftUI
import RealmSwift

struct BasketView: View {
    
    @EnvironmentObject var basketStore: BasketStore
    var body: some View {
    
        VStack{
            HeaderView(label:"Your Basekt")
                .padding([.leading,.bottom])
            ForEach(basketStore.all){
                item in
                VStack{
                    HStack{
                        Text(basketStore.getById(id: item.id).tytul)
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(String(basketStore.getById(id: item.id).cena) + "$")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                } .padding()
                }
            HStack{
                HeaderView(label: "Total")
                    .padding([.leading])
                Text(String(basketStore.countTotal()) + "$" )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.trailing])
            } .frame(maxWidth: .infinity, alignment: .bottom)
            

        }
        }
    
    }

