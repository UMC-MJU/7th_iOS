

import UIKit

class EditProfileView: UIView {

    lazy var emailStatus:Status = .change
    lazy var pwdStatus:Status = .change
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var profileInfoText: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var emailText: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "example@naver.com"
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.masksToBounds = true
        
        setPaddingLeftRight(textField: textField)
        
        // 변경 버튼 클릭 후 수정 가능
        textField.isEnabled = false
        return textField
    }()
    
    lazy var changeEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var pwdText: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.text = "test1234"
        textField.isSecureTextEntry = true
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.masksToBounds = true
        
        setPaddingLeftRight(textField: textField)
        
        // 변경 버튼 클릭 후 수정 가능
        textField.isEnabled = false
        return textField
    }()
    
    lazy var changePwdButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        return button
    }()
    

    lazy var emailTextFieldButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, changeEmailButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        return stackView
    }()
    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailText, emailTextFieldButtonStackView])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var pwdTextFieldButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdTextField, changePwdButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        return stackView
    }()
    
    lazy var pwdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdText, pwdTextFieldButtonStackView])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileInfoText, emailStackView, pwdStackView])
        stackView.axis = .vertical
        stackView.spacing = 23
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        addSubview(userImage)
        addSubview(userInfoStackView)
        
        userImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
        }
        userInfoStackView.snp.makeConstraints{
            $0.top.equalTo(userImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
        }
        
        // 이메일 입력창 제약조건 설정 (너비 303, 높이 34)
        emailTextField.snp.makeConstraints { make in
              make.width.equalTo(282)
              make.height.equalTo(32)
          }
        // 비밀번호 입력창 제약조건 설정 (너비 303, 높이 34)
        pwdTextField.snp.makeConstraints { make in
              make.width.equalTo(282)
              make.height.equalTo(32)
          }
    }
    
    // Padding 설정 메서드
    private func setPaddingLeftRight(textField: UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y:0, width: 11, height: frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    
    private func addActions(){
        changeEmailButton.addTarget(self, action: #selector(changeEmailButtonTapped), for: .touchUpInside)
        changePwdButton.addTarget(self, action: #selector(changePwdButtonTapped), for: .touchUpInside)
    
    }
    
    
    //MARK: 변경 버튼 클릭 시 이벤트
    @objc
    private func changeEmailButtonTapped() {
        switch emailStatus {
        case .change:
            emailTextField.text = ""
            emailTextField.isEnabled = true
            emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
            emailStatus = .confirm
            changeEmailButton.setTitle("확인", for: .normal)
            
        case .confirm:
            emailTextField.isEnabled = false
            emailStatus = .change
            changeEmailButton.setTitle("변경", for: .normal)
        }
     }
    
    @objc
    private func changePwdButtonTapped() {
        switch pwdStatus {
        case .change:
            pwdTextField.text = ""
            pwdTextField.isEnabled = true
            pwdTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
            pwdStatus = .confirm
            changePwdButton.setTitle("확인", for: .normal)
            
        case .confirm:
            pwdTextField.isEnabled = false
            pwdStatus = .change
            changePwdButton.setTitle("변경", for: .normal)
        }
     }
}

enum Status {
    case change
    case confirm
}
