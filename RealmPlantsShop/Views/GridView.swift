

import SwiftUI
import RealmSwift

struct GridView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore

    
    let realm = try! Realm()
    let layout: [GridItem]
    var body: some View{
        LazyVGrid(columns: layout, spacing: 32){
            ForEach(kategoriaStore.wszystkie) {
                kategoria in
                NavigationLink(
                    destination: GridViewProduct(kategoriaStore: _kategoriaStore,category: kategoria.tytul, layout: layout),
                label: {
                        GridCellView(kategoriaStore: _kategoriaStore, title: kategoria.tytul, url: URL(string: kategoria.url)!)
                    })
            }
        }
    }
}

