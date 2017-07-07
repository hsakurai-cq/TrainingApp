import Foundation
import UIKit

class Validate {
    static func login(email: String, password: String) -> (result: Bool, error: String) {
       
        guard !email.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.email()))
        }
        
        guard !password.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.password()))
        }
        
        return (true, "")
    }
}
