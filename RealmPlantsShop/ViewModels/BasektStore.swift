

import Foundation
import RealmSwift

final class BasketStore: ObservableObject {
    var realm: Realm
    private var basketResult: Results<BasketModel>
    
    init(realm: Realm) {
        self.realm = realm
        basketResult = realm.objects(BasketModel.self)
    }
    var all: [Basket] {
        basketResult.map(Basket.init)
    }
}

extension BasketStore{
    func addToCardRealm(product: ProduktModel) -> Void {
        let basketElement = BasketModel()
        basketElement.id = UUID().hashValue
        basketElement.cena = product.cena
        basketElement.tytul = product.tytul
        try! realm.write {
            realm.add(basketElement)
    }
    }
    func deleteFromCardRealm(product: ProduktModel) -> Void {
        try! realm.write {
                realm.delete(product)
    }
    }
    func getBasketElements() -> [BasketModel] {
        let arrayToReturn = Array(realm.objects(BasketModel.self))
        return arrayToReturn
    }
    func getById(id: Int) -> BasketModel {
        return realm.objects(BasketModel.self).filter("id=="+String(id))[0]
    }
    func countTotal() -> Double {
        let arrayToReturn = Array(realm.objects(BasketModel.self))
        var total = 0.0
        for i in arrayToReturn{
            total = i.cena + total
        }
        return total
    }

}
