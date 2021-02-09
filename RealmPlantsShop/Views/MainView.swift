import SwiftUI
import MapKit


struct MainView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    @EnvironmentObject var basketStore: BasketStore
    var body: some View {
        TabView{
            CategoriesView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
                BasketView()
                .tabItem {
                    Image(systemName: "bag")
                }.tag(1)
            AboutUs()
                .tabItem {
                    Image(systemName: "heart")
                }.tag(2)
        } .accentColor(.myColor)
    }
}

