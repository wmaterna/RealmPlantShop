
import SwiftUI

struct HeaderView: View {
    let label: String
    var body: some View {
        Text(label)
            .font(.custom("Helvetica Neue", size: 35))
            .font(.largeTitle)
            .fontWeight(.heavy)
            .frame(maxWidth: .infinity, alignment: .leading)

            .foregroundColor(.myColor)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(label: "PlantyPlants")
    }
}
