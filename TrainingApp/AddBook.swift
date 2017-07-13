import Foundation
import APIKit
import Himotoki

struct AddBookRequest: APIRequest {
    typealias Response = RegisteredBookResponse
    let name: String
    let price: Int
    let purchaseDate: String
    let imageData: String
    
    var method: HTTPMethod {
        return .post
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
    
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "name": self.name,
            "price": self.price,
            "purchase_date": self.purchaseDate,
            "image_data": self.imageData,
            "user_id": UserDefaults.standard.integer(forKey: "user_id")
        ])
    }
}
