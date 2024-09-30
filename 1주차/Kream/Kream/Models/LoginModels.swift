import Foundation

struct LoginModel {
    var id: String = ""
    var pwd: String = ""
    
    init(id: String, pwd: String) {
        self.id = id
        self.pwd = pwd
    }
}
