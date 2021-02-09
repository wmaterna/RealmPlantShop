
import SwiftUI

struct CategoriesView: View {
    let layout = [GridItem(.adaptive(minimum: 180))]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, content: {
                    HeaderView(label:"Planty Plants")
                        .padding([.leading])
                    
                    Text("Categories")
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding( [.leading, .bottom])
                        
                })
                GridView(layout: layout)
            }
            }
        }
    }

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
