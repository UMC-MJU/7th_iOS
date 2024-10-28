
import UIKit
import SnapKit

class UserDefaultsView: UIView {

    // MARK: - 상단 컴포넌트
    
    lazy var inputTitle:UILabel  = {
        let label = UILabel()
        label.text = "UserDefaults 실습 뷰"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var inputTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "아무 텍스트나 입력해주세요"
        textField.font = .systemFont(ofSize: 14)
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.masksToBounds = true
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var inputButton: UIButton = {
        let button = UIButton()
        button.setTitle("UserDefaults에 저장하기", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [inputTitle,inputTextField,inputButton])
        stackView.axis = .vertical
        stackView.spacing = 26
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: 하단 컴포넌트
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값 출력 라벨"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var showTextValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값이 출력됩니다."
        label.textColor = .black
        label.textAlignment = .center
        
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.blue.cgColor
        
        return label
    }()
    
    private lazy var outputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [subTitleLabel,showTextValue])
        stackView.axis = .vertical
        stackView.spacing = 21
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackView() {
        // 상단
        inputStackView.addArrangedSubview(inputTitle)
        inputStackView.addArrangedSubview(inputTextField)
        inputStackView.addArrangedSubview(inputButton)
        // 하단
        outputStackView.addArrangedSubview(subTitleLabel)
        outputStackView.addArrangedSubview(showTextValue)
    }
    
    private func addComponents() {
        addSubview(inputStackView)
        addSubview(outputStackView)
        
        // 상단
        inputStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(197)
            $0.left.equalToSuperview().offset(42)
            $0.right.equalToSuperview().offset(-42)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(309)
        }
        
        inputButton.snp.makeConstraints { make in
            make.height.equalTo(42)
            make.width.equalTo(222)
        }
        
        // 하단
        outputStackView.snp.makeConstraints { make in
            make.top.equalTo(inputStackView.snp.bottom).offset(114)
            make.left.equalToSuperview().offset(56.5)
            make.right.equalToSuperview().offset(-56.5)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.height.equalTo(24)
        }
        
        showTextValue.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.height.equalTo(127)
        }
    }
  
}
