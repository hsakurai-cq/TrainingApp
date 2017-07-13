import APIKit
import Himotoki

protocol APIRequest: Request { }

extension APIRequest {
    var baseURL: URL {
        return URL(string: "http://54.238.252.116")!
    }
}

extension APIRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}
