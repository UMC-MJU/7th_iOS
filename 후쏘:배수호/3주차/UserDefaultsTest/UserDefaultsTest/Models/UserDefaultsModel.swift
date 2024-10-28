
import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    /// 유저가 입력한 텍스트 값을 UserDefaults에 저장
    /// - Parameter text: 유저가 입력한 텍스트 값
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
    
}
