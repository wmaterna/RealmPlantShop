

import Foundation
import RealmSwift

class ProduktModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tytul = ""
    @objc dynamic var opis = ""
    @objc dynamic var cena = 0.0
    @objc dynamic var kategoria = ""
    @objc dynamic var url = ""
    
    override static func primaryKey() -> String? {
        "id"
    }
    
}
