
import Foundation
import RealmSwift

final class KategoriaStore: ObservableObject {
    
    var realm: Realm
    private var kategoriaResult: Results<KategoriaModel>
    
    init(realm: Realm) {
        self.realm = realm
        kategoriaResult = realm.objects(KategoriaModel.self)
    }
    
    var wszystkie: [Kategoria] {
        kategoriaResult.map(Kategoria.init)
    }
    
}

extension KategoriaStore {

    func getById(id: Int) -> KategoriaModel {
        return realm.objects(KategoriaModel.self).filter("id=="+String(id))[0]
    }
    func getByKategory(kategoria: String) -> [ProduktModel] {
        let objects = Array(realm.objects(ProduktModel.self).filter("kategoria == %@", kategoria))
        return objects
}
    func getByName(title: String) -> ProduktModel {
        let object = realm.objects(ProduktModel.self).filter("tytul == %@", title)[0]
        print(object)
        return object
        
}
    
}
