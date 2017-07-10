import APIKit
import Himotoki
import Foundation

struct User: Decodable {
    var id: Int
    var token: String
    
    static func decode(_ e: Extractor) throws -> User {
        return try User(id: e.value("user_id"), token: e.value("request_token"))
    }
}
