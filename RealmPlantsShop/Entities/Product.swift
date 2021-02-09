
import Foundation

struct ProductJSON: Decodable {
    public var tytul: String
    public var opis: String
    public var cena: Double
    public var kategoria: String
    public var url: String
}

struct Product: Identifiable {
    let id: Int
    let tytul: String
    let opis: String
    let cena: Double
    let kategoria: String
    let url: String
}

extension Product {
    init(product: ProduktModel) {
        id = product.id
        tytul = product.tytul
        opis = product.opis
        cena = product.cena
        kategoria = product.kategoria
        url = product.url
        
    }
}
