import UIKit

class EditProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = editProfileView
        setNavigationBar()
    }
    
    lazy var editProfileView: EditProfileView = {
        let view = EditProfileView()
    
        // UserDefaults 값으로 변경
        if let userInfo = UserInfoModel.loadUserDefaults() {
            view.emailTextField.text = userInfo.id
            view.pwdTextField.text = userInfo.pwd
            view.changeEmailButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
            view.changePwdButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
            print("UserDefaults 로드 성공")
        }
        else {
            print("UserDefaults 로드 실패")
        }
        
        return view
    }()
    
    private func setNavigationBar(){
        // 타이틀 설정
        self.title = "프로필 관리"
        // back 버튼 이미지 설정
        let backButtonImage = UIImage(named: "Back_icon")
        // 커스텀 back 버튼 생성
        let backButton = UIBarButtonItem(image: backButtonImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        // tintColor를 검정으로 설정
        backButton.tintColor = .black
        // leftBarButtonItem으로 설정
        navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // - Parmeter sender: 클릭된 버튼
    @objc func clickedBtn(_ sender: UIButton){
        let config = getButtonConfig(button: sender)
        guard
            let textField = config.textField,
            let userDefaultsKey = config.UserDefaultsKey
        else{
            return
        }
        
        if sender.titleLabel?.text == "변경"{
            sender.setTitle("확인", for: .normal)
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
            print("변경 버튼 클릭")
        }
        else if sender.titleLabel?.text == "확인" {
            if let text = textField.text, !text.isEmpty {
                UserDefaults.standard.set(text, forKey: userDefaultsKey)
                sender.setTitle("변경", for: .normal)
                textField.isUserInteractionEnabled = false
                textField.becomeFirstResponder()
                print("변경 완료 데스")
            }
            else {
                print("텍스트 필드를 입력하세요.")
            }
        }
        
    }
    
    private func getButtonConfig(button: UIButton) -> (textField:UITextField?, UserDefaultsKey: String?){
        if button == editProfileView.changeEmailButton {
            return (editProfileView.emailTextField, "userId")
        }
        
        else if button == editProfileView.changePwdButton {
            return (editProfileView.pwdTextField, "userPwd")
            }
        return (nil,nil)
    }
}
