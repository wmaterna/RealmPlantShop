

import Foundation
import RealmSwift

class BasketModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var cena = 0.0
    @objc dynamic var tytul = ""
    
    override static func primaryKey() -> String? {
        "id"
    }
    
}
