

import UIKit

class LoginVC: UIViewController, LoginViewDelegate {
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        loginView.delegate = self // Set the delegate
    }
}

// MARK: - LoginViewDelegate
extension LoginVC {
    func didTapLoginButton() {
        
        
        // - 공백 입력 체크
        guard
            let id = loginView.idTextField.text,
            let pwd = loginView.pwdTextField.text,
            !id.isEmpty,
            !pwd.isEmpty
        else{
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        
        if let storedUserInfo = UserInfoModel.loadUserDefaults() {
            /// 저장된 UserInfo가 있는 경우
            /// 로그인 정보가 맞는지 체크
            if id == storedUserInfo.id && storedUserInfo.pwd == pwd{
                print("로그인 성공!!!")
                changeView()
            }
            else {
                print("로그인 실패, 아이디/비밀번호 불일치")
            }
        }
        else {
            /// 저장된 UserInfo가 없는 경우
            /// 새 로그인 정보 생성
            let newUserInfo = UserInfoModel(id: id, pwd: pwd)
            newUserInfo.saveUserDefaults()
            print("아이디, 비밀번호 저장됨")
            changeView()
        }
                
    }
    
    func changeView(){
        
        let viewController = TabBarController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

