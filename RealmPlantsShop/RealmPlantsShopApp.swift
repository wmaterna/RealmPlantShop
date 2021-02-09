import SwiftUI
import RealmSwift

@main
struct SklepRealmApp: SwiftUI.App {
    
    let jsonKategoriaFixtures = ["kategorie"]
    let jsonProductsFixtures = ["AnimalFriendly", "EasyToCare","AirCleaning","Collectible"]
    
    init() {
        loadFixtures()
    }
    
    var body: some Scene {
        WindowGroup {
            let realm = RealmPersistence.initializer()
            MainView().environmentObject(KategoriaStore(realm: realm))
                .environmentObject(BasketStore(realm: realm))

            
        }
    }
}

extension SklepRealmApp {
    
    func loadFixtureFile(fixtureFile: String) -> String {
        let path = Bundle.main.path(forResource: fixtureFile, ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        return String(data: jsonData, encoding: String.Encoding.utf8)!
    }
    
    func saveKategoria(realm: Realm, jsonString: String) -> Void {
        let decoder = JSONDecoder()
        let kategoriaJSON = try! decoder.decode([KategoriaJSON].self, from: (jsonString.data(using: .utf8))!)
        if realm.objects(KategoriaModel.self).isEmpty{
        try! realm.write {
            for jsonKat in kategoriaJSON {
                let kategoria = KategoriaModel()
                kategoria.id = UUID().hashValue
                kategoria.tytul = jsonKat.tytul
                kategoria.url = jsonKat.url
                realm.add(kategoria)
            }
        }
    }
        
    }
    
    
    func loadFixtures() {
        let realm = RealmPersistence.initializer()
        print("Realm is located at:", realm.configuration.fileURL!)
        for fixtureFile in jsonKategoriaFixtures {
            do {
                var jsonString = loadFixtureFile(fixtureFile: fixtureFile)
                saveKategoria(realm: realm, jsonString: jsonString)
                addProducts(realm: realm)
                pairProductWithCategory(realm: realm)
            } catch let err {
                print(err)
            }
        }
//        cleanRealm(realm: realm)
    }

    func addProducts(realm: Realm){
        if realm.objects(ProduktModel.self).isEmpty{
        for fixtureFile in jsonProductsFixtures{
            let jsonString = loadFixtureFile(fixtureFile: fixtureFile)
            let decoder = JSONDecoder()
            let productJSON = try! decoder.decode([ProductJSON].self, from: (jsonString.data(using: .utf8))!)
            
            try! realm.write {
                for jsonProd in productJSON {
                    let product = ProduktModel()
                    product.id = UUID().hashValue
                    product.tytul = jsonProd.tytul
                    product.opis = jsonProd.opis
                    product.cena = jsonProd.cena
                    product.kategoria = jsonProd.kategoria
                    product.url = jsonProd.url
                    realm.add(product)
                    print("Dodałem produkt: " + jsonProd.tytul)
                }
        }
        
    }
        }
    
    
}
    func pairProductWithCategory(realm: Realm){
        let categories = realm.objects(KategoriaModel.self)
        for item in categories{
            let products = realm.objects(ProduktModel.self).filter("kategoria == %@", item["tytul"])
            for prod in products{
                try! realm.write {
                    item.products.append(prod)
                }
            }
        }
    }
    
    
    func cleanRealm(realm: Realm){
        try! realm.write {
            let data = realm.objects(ProduktModel.self)
            for items in data{
                realm.delete(items)
            }
            let dawta = realm.objects(KategoriaModel.self)
            for items in dawta{
                realm.delete(items)
            }
            let basket = realm.objects(BasketModel.self)
            for items in basket{
                realm.delete(items)
            }
        }
    }
}

