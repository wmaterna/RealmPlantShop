

import SwiftUI
import RealmSwift

struct GridViewProduct: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    let category: String
    let layout: [GridItem]
    
    var body: some View{
        HeaderView(label:category)
            .padding([.leading])
        ScrollView{
        LazyVGrid(columns: layout, spacing: 32){
            ForEach(kategoriaStore.getByKategory(kategoria: category), id: \.self) {
                product in
                NavigationLink(destination: DetailView(kategoriaStore: _kategoriaStore, title: String(product.tytul), category: product.kategoria, price: product.cena, description: product.opis, url: URL(string: product.url)!, id: product.id),
                    label: {
                        GridCellViewProduct(title: product.tytul, url: URL(string: product.url)!, price: product.cena, subtitle: product.kategoria)
                    })
            }
        }}
}

}

