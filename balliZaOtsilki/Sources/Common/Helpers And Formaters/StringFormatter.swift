//
//  StringFormatChecker.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 15.10.2020.
//

import Foundation

class StringFormatter {
    
    class func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func isPhoneNumber(_ phone: String) -> Bool {
        let phoneREGEX = "^((\\+)|[0-9])[0-9]{6,12}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneREGEX)
        let result = phonePredicate.evaluate(with: phone)
        return result
    }
    
    class func isSMSCodeFormat(_ code: String) -> Bool {
        let codeREGEX = "^[0-9A-Za-z]{4}$"
        let codePredicate = NSPredicate(format: "SELF MATCHES %@", codeREGEX)
        return codePredicate.evaluate(with: code)
    }
    
    class func isUkrainianFullPhoneNumber(_ phone: String) -> Bool {
        if isPhoneNumber(phone) {
            if phone.count == 12 && phone.starts(with: "380") {
                return true
            }
            else { return false }
        }
        return false
    }
    
    class func removeCharactersFromPhoneNumber(_ phoneNumber: String) -> String {
        var number = phoneNumber
        if number.hasPrefix("+") {
            number.removeFirst()
        }
        return number
    }
    
    /// mask example: `+XXX (XX) XX-XXXX` +38(068)123-56-67
    class func formatPhoneNumber(with mask: String = "+XX(XXX)XXX-XX-XX", phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
}
