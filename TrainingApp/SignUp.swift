import APIKit
import Himotoki

struct SingUpRequest: APIRequest {
    typealias Response = User
    let email: String
    let password: String
    
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return "/signup"
    }
    
    var headerFields: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: ["email": self.email, "password": self.password])
    }
    
}
