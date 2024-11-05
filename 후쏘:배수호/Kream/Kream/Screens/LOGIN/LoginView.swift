
import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapLoginButton()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 크림 상단 로고 이미지
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo_image")
        return imageView
    }()
    
    // "이메일 주소" 텍스트 레이블
    lazy var idText: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // id 텍스트 필드
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.clipsToBounds = true
        textField.placeholder = "kream@kream.co.kr"
        textField.font = .systemFont(ofSize: 12)
        setPaddingLeftRight(textField: textField)
        return textField
    }()
    
    // "비밀번호" 텍스트 레이블
    lazy var pwdText: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // pwd 텍스트 필드
    lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.clipsToBounds = true
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = .systemFont(ofSize: 12)
        textField.isSecureTextEntry = true
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
        return button
    }()
    
    // 카카오 로그인 버튼
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "KakaoLogin_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    // Apple 로그인 버튼
    lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AppleLogin_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    // 이메일 스택뷰 (레이블 + 텍스트필드)
    lazy var idStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idText, idTextField])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // 비밀번호 스택뷰 (레이블 + 텍스트필드)
    lazy var pwdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdText, pwdTextField])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // 인증 정보 스택뷰 (idStackView + pwdStackView + 로그인 버튼)
    lazy var credentialsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idStackView, pwdStackView, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // 소셜 로그인 스택뷰 (카카오 로그인 + 애플 로그인 버튼)
    lazy var socialLoginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
        
    }()
    
    private func addComponents() {
        self.addSubview(logoImage)
        self.addSubview(credentialsStackView)
        self.addSubview(socialLoginStackView)
        
        // 상단 로고 이미지 제약조건 설정
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(126)
            make.width.equalToSuperview().multipliedBy(0.74)
            make.height.equalToSuperview().multipliedBy(0.088)
        }
        
        // 인증 정보 스택뷰 제약조건 설정
        credentialsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(87)
            make.width.equalToSuperview().multipliedBy(0.74)
        }
        
        // 이메일 입력창 제약조건 설정 (너비 303, 높이 34)
        idTextField.snp.makeConstraints { make in
              make.width.equalTo(303)
              make.height.equalTo(34)
          }
        // 비밀번호 입력창 제약조건 설정 (너비 303, 높이 34)
        pwdTextField.snp.makeConstraints { make in
              make.width.equalTo(303)
              make.height.equalTo(34)
          }
        // 로그인 버튼 제약조건 설정 (너비 303, 높이 38)
          loginButton.snp.makeConstraints { make in
              make.width.equalTo(303)
              make.height.equalTo(38)
          }
        
        // 소셜 로그인 스택뷰 제약조건 설정
        socialLoginStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(credentialsStackView.snp.bottom).offset(48)
//            make.width.equalToSuperview().multipliedBy(0.74)
        }
    }
    
    // Padding 설정 메서드
    func setPaddingLeftRight(textField: UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y:0, width: 16, height: frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    
    
    // MARK: 로그인 버튼 클릭 이벤트
    @objc private func loginButtonTapped() {
         delegate?.didTapLoginButton()
     }

     private func addActions() {
         loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
     }
}
