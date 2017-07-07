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
    
    static func signUp(email: String, password: String, passwordCheck: String) -> (result: Bool, error: String) {
        
        guard !email.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.email()))
        }
        
        guard !password.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.password()))
        }
        
        guard !passwordCheck.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.passwordCheck()))
        }
        
        guard password == passwordCheck else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.passwordMismatch()))
        }
        
        return (true, "")
    }
}
