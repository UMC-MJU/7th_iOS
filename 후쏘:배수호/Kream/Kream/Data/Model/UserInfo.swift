import Foundation

struct UserInfo {
    var id: String
    var pwd: String
    
    public func saveUserDefaults(){
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
    }
    
    static func loadUserDefaults() -> UserInfo? {
        guard
            let id = UserDefaults.standard.string(forKey: "userId"),
            let pwd = UserDefaults.standard.string(forKey: "userPwd")
        else{
            return nil
        }
        return UserInfo(id: id, pwd: pwd)
    }
}
