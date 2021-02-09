

import Foundation
import RealmSwift

final class ProductStore: ObservableObject {
    
    var realm: Realm
    private var productResult: Results<ProduktModel>
    
    init(realm: Realm) {
        self.realm = realm
        productResult = realm.objects(ProduktModel.self)
    }
    
    var wszystkie: [Product] {
        productResult.map(Product.init)
    }
    
}

extension ProductStore {
    func getById(id: Int) -> ProduktModel {
            return realm.objects(ProduktModel.self).filter("id=="+String(id))[0]
}


}

