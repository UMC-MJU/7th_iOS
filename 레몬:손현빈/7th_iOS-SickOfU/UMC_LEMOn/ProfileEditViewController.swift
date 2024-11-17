import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {

    // UI 요소 선언
    private let profileImageView = UIImageView()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailChangeButton = UIButton()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordChangeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupConstraints()
    }

    private func setupUI() {
        // 프로필 이미지 설정
        profileImageView.image = UIImage(named: "profile_image") // 실제 이미지 이름으로 변경하세요
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        
        // 이메일 정보 설정
        emailLabel.text = "유저 이메일"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailTextField.placeholder = "example@naver.com"
        emailTextField.borderStyle = .roundedRect
        emailTextField.isEnabled = false // 기본 비활성화 상태
        emailChangeButton.setTitle("변경", for: .normal)
        emailChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // 비밀번호 정보 설정
        passwordLabel.text = "유저 비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 16)
        passwordTextField.placeholder = "**************"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.isEnabled = false // 기본 비활성화 상태
        passwordChangeButton.setTitle("변경", for: .normal)
        passwordChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // 버튼 액션 추가
        emailChangeButton.addTarget(self, action: #selector(didTapEmailChangeButton), for: .touchUpInside)
        passwordChangeButton.addTarget(self, action: #selector(didTapPasswordChangeButton), for: .touchUpInside)
        
        // 뷰에 추가
        view.addSubview(profileImageView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailChangeButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordChangeButton)
    }
    
    private func setupConstraints() {
        // SnapKit 레이아웃 설정
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(40)
        }
        
        emailChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.leading.equalTo(emailTextField.snp.trailing).offset(10)
            make.width.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(40)
        }
        
        passwordChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.leading.equalTo(passwordTextField.snp.trailing).offset(10)
            make.width.equalTo(50)
        }
    }
    
    // 이메일 변경 버튼 클릭 시
    @objc private func didTapEmailChangeButton() {
        emailTextField.isEnabled = true // 입력 가능하게 변경
        emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
        emailChangeButton.setTitle("확인", for: .normal)
        
        emailChangeButton.removeTarget(self, action: #selector(didTapEmailChangeButton), for: .touchUpInside)
        emailChangeButton.addTarget(self, action: #selector(didConfirmEmailChange), for: .touchUpInside)
    }
    
    @objc private func didConfirmEmailChange() {
        emailTextField.text = "" // 입력 내용 지우기
        emailTextField.isEnabled = false // 다시 비활성화
        emailTextField.placeholder = "example@naver.com"
        emailChangeButton.setTitle("변경", for: .normal)
        
        emailChangeButton.removeTarget(self, action: #selector(didConfirmEmailChange), for: .touchUpInside)
        emailChangeButton.addTarget(self, action: #selector(didTapEmailChangeButton), for: .touchUpInside)
    }
    
    // 비밀번호 변경 버튼 클릭 시
    @objc private func didTapPasswordChangeButton() {
        passwordTextField.isEnabled = true // 입력 가능하게 변경
        passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
        passwordChangeButton.setTitle("확인", for: .normal)
        
        passwordChangeButton.removeTarget(self, action: #selector(didTapPasswordChangeButton), for: .touchUpInside)
        passwordChangeButton.addTarget(self, action: #selector(didConfirmPasswordChange), for: .touchUpInside)
    }
    
    @objc private func didConfirmPasswordChange() {
        passwordTextField.text = "" // 입력 내용 지우기
        passwordTextField.isEnabled = false // 다시 비활성화
        passwordTextField.placeholder = "**************"
        passwordChangeButton.setTitle("변경", for: .normal)
        
        passwordChangeButton.removeTarget(self, action: #selector(didConfirmPasswordChange), for: .touchUpInside)
        passwordChangeButton.addTarget(self, action: #selector(didTapPasswordChangeButton), for: .touchUpInside)
    }
}

