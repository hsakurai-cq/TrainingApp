import Foundation
import APIKit
import Himotoki

struct RegisteredBookResponse: Decodable {
    var bookId: Int
    
    static func decode(_ e: Extractor) throws -> RegisteredBookResponse {
        return try RegisteredBookResponse(bookId: e.value("book_id"))
    }
}
    
