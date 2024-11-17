//
//  LoginViewController.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    
    let userInfo: UserInfo = UserInfo(id: "MINA", pwd: "0206")
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self,action: #selector(loginFunction), for : .touchUpInside)
        return view
    }()
    // ID, 비번 모두 일치할 때 로그인 가능하게 하는 함수
    // 프론트에서 담아둘 필요없이 서버에 보내고 그냥 http로 받는 형식도 있지 않을까? userdefault쓰는 이유 잘 몰겟
    @objc private func loginFunction(){
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwdTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else{
            print("아이디와 비번 입력")
            return
        }
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pwd == inputPwd{
                print("기존 사용자랑 일치하니까 로그인 성공")
                changeRootView()
            }
            else{
                print("NOT SAME, TYPE IF AGAIN")
            }
        }
        else {
            let newUserInfo = UserInfo(id: inputId, pwd: inputPwd)
            newUserInfo.saveUserDefaults()
            print("갱신 ㄱㄴ")
            changeRootView()
        }
    }
    private func changeRootView(){
        let rootVC = BaseViewController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

