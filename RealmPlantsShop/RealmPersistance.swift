
import Foundation
import RealmSwift

class RealmPersistence {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            print(err)
            fatalError("Realm not working")
        }
    }
}
