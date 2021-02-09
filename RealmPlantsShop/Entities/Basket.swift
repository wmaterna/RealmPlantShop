

import Foundation
struct Basket: Identifiable {
    let id: Int
}

extension Basket {
    init(basket: BasketModel) {
        id = basket.id
    }
}
