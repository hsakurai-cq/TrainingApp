import APIKit
import Himotoki

protocol API: Request { }

extension API {
    var baseURL: URL {
        return URL(string: "http://54.238.252.116")!
    }
}

extension API where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}
