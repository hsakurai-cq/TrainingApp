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
        
        guard email.characters.count >= 8 else {
            return (false, R.string.localizable.errorCounts(R.string.localizable.email()))
        }
        
        guard password.characters.count >= 3 else {
            return (false, R.string.localizable.errorCounts(R.string.localizable.password()))
        }
        
        return (true, "")
    }
    
    static func saveBook(name: String, price: Int?, purchaseDate: String, imageData: String) -> (result: Bool, error: String) {
        
        guard !name.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.name()))
        }
        
        guard price != nil else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.price()))
        }
        
        guard !purchaseDate.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.purchaseDate()))
        }
        
        guard !imageData.isEmpty else {
            return (false, R.string.localizable.errorEmpty(R.string.localizable.purchaseDate()))
        }
        
        return (true, "")
    }
}
