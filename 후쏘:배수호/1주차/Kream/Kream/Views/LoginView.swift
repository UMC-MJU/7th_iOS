import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 크림 상단 로고 이미지
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // "이메일 주소" 텍스트 레이블
    lazy var idText: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // "비밀번호" 텍스트 레이블
    lazy var pwdText: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 왼쪽 오른쪽 16px padding
    func setPaddingLeftRight(textField: UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y:0, width: 16, height: frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    
    // id 텍스트 필드
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.clipsToBounds = true
        
        // 이메일 주소 텍스트 필드 힌트 설정
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "PlaceholderColor") ?? .gray,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: placeholderAttributes)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        setPaddingLeftRight(textField: textField)
        return textField
    }()
    
    // pwd 텍스트 필드
    lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.clipsToBounds = true
        
        // 비밀번호 텍스트 필드 힌트 설정
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "PlaceholderColor") ?? .gray,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: placeholderAttributes)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        setPaddingLeftRight(textField: textField)
        return textField
    }()
    
    // 로그인 버튼
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 카카오로그인 버튼
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        
        
        // 이미지 설정
        button.setImage(UIImage(named: "KakaoIcon"), for: .normal) // "kakao_icon"에 해당하는 이미지 넣기
        button.imageView?.contentMode = .scaleAspectFit
        
        // 이미지와 텍스트의 간격 설정
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -164, bottom: 0, right: 0)
     
        
        button.setTitle("카카오로 로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // Apple로그인 버튼
    lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        
        // 이미지 설정
        button.setImage(UIImage(named: "AppleIcon"), for: .normal) // "kakao_icon"에 해당하는 이미지 넣기
        button.imageView?.contentMode = .scaleAspectFit
        
        // 이미지와 텍스트의 간격 설정
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -164, bottom: 0, right: 0)
  
        
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private func addComponents() {
        self.addSubview(logoImage)
        self.addSubview(idText)
        self.addSubview(pwdText)
        self.addSubview(idTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            // 상단로고 이미지
            logoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.73),
            logoImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.088),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            
            // "이메일 주소" 텍스트
            idText.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.771),
            idText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            idText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 87),
            
            // 이메일 주소 텍스트필드
            idTextField.widthAnchor.constraint(equalTo: idText.widthAnchor),
            idTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.039),
            idTextField.centerXAnchor.constraint(equalTo: idText.centerXAnchor),
            idTextField.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 8),
            
            // "비밀번호" 텍스트
            pwdText.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.771),
            pwdText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pwdText.topAnchor.constraint(equalTo: idText.topAnchor, constant: 74),
            
            // 비밀번호 텍스트필드
            pwdTextField.widthAnchor.constraint(equalTo: pwdText.widthAnchor),
            pwdTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.039),
            pwdTextField.centerXAnchor.constraint(equalTo: pwdText.centerXAnchor),
            pwdTextField.topAnchor.constraint(equalTo: pwdText.bottomAnchor, constant: 8),
            
            // 로그인 버튼
            loginButton.widthAnchor.constraint(equalTo: pwdText.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0446),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 17),
            
            // 카카오 로그인 버튼
            kakaoLoginButton.widthAnchor.constraint(equalTo: pwdText.widthAnchor),
            kakaoLoginButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0447),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kakaoLoginButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 561),
            
            // 애플 로그인 버튼
            appleLoginButton.widthAnchor.constraint(equalTo: pwdText.widthAnchor),
            appleLoginButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.0447),
            appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLoginButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 623),
            
        ])
    }
}
