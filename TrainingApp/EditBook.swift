import Foundation
import APIKit
import Himotoki

struct EditBookRequest: APIRequest {
    typealias Response = RegisteredBookResponse
    let bookId: Int
    let name: String
    let price: Int
    let purchaseDate: String
    let imageData: String
    
    var method: HTTPMethod {
        return .patch
    }
    
    var path: String {
        return "/books/\(self.bookId)"
    }
    
    var headerFields: [String : String] {
        return [
            "Content-Type": "application/json",
            "Authorization": UserDefaults.standard.string(forKey: "request_token")!
        ]
    }
    
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "name": self.name,
            "price": self.price,
            "purchase_date": self.purchaseDate,
            "image_data": self.imageData
        ])
    }
}
