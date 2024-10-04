
import UIKit

class LoginView: UIView {

    // 상단 로고 이미지
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo") // 로고 이미지 설정
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 아이디 입력 필드
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 비밀번호 입력 필드
    private lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var kakaologin: UITextField = {
        let textField = UITextField()
        textField.placeholder = "카카오 로그인"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    private lazy var googlelogin : UITextField = {
       let textField = UITextField()
        textField.placeholder = "구글 로그인"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // UI 요소들을 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UI 요소 추가
    private func setupViews() {
        self.addSubview(logoImageView)
        self.addSubview(idTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(googlelogin)
        self.addSubview(kakaologin)
    }
    
    // 오토레이아웃 설정
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 로고 이미지
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // 아이디 텍스트 필드
            idTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            idTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            idTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // 비밀번호 텍스트 필드
            pwdTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            pwdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            pwdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            pwdTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // 로그인 버튼
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

