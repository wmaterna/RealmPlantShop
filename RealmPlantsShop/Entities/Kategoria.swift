
import Foundation

struct KategoriaJSON: Decodable {
    public var tytul: String
    public var url: String
}

struct Kategoria: Identifiable {
    let id: Int
    let tytul: String
    let url: String
}

extension Kategoria {
    init(kategoria: KategoriaModel) {
        id = kategoria.id
        tytul = kategoria.tytul
        url = kategoria.url
    }
}
