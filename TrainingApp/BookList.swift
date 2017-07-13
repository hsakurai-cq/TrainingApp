import Foundation
import APIKit
import Himotoki

struct BookListRequest: APIRequest {
    typealias Response = GetBookResponse
    let page: String
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/books"
    }
    
    var headerFields: [String : String] {
        return [
            "Content-Type": "application/json",
            "Authorization": UserDefaults.standard.string(forKey: "request_token")!
        ]
    }
    
    var parameters: Any? {
        return [
            "page": self.page,
            "user_id": UserDefaults.standard.integer(forKey: "user_id")
        ]
    }
}
