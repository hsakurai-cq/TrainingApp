import Foundation
import APIKit
import Himotoki

struct GetBookResponse: Decodable {
    let result: [Book]
    static func decode(_ e: Extractor) throws -> GetBookResponse {
        return try GetBookResponse(result: e.array("result"))
    }
}

struct Book: Decodable {
    var id: Int
    var imageData: String
    var name: String
    var price: Int
    var purchaseDate: String
    
    static func decode(_ e: Extractor) throws -> Book {
        return try Book(
            id: e.value("id"),
            imageData: e.value("image_url"),
            name: e.value("name"),
            price: e.value("price"),
            purchaseDate: e.value("purchase_date")
        )
    }
}

struct RegisteredBookResponse: Decodable {
    var bookId: Int
    
    static func decode(_ e: Extractor) throws -> RegisteredBookResponse {
        return try RegisteredBookResponse(bookId: e.value("book_id"))
    }
}
    
