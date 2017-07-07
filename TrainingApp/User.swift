import APIKit
import Himotoki
import Foundation

struct User: Decodable {
    let id: Int
    let token: String
    
    static func decode(_ e: Extractor) throws -> User {
        return try User(id: e.value("user_id"), token: e.value("request_token"))
    }

}
