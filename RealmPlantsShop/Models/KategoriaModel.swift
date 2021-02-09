
import Foundation
import RealmSwift

class KategoriaModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tytul = ""
    @objc dynamic var url = ""
    let products = List<ProduktModel>()
    
    override static func primaryKey() -> String? {
        "id"
    }
    
}
