
import UIKit

enum ButtonType {
    case buy
    case sell
}

class TradeButton: UIView, TradeButtonProtocol {
    
    let btnType: ButtonType
    
    // MARK: - init
    
    init(frame: CGRect, btnType: ButtonType) {
        self.btnType = btnType
        super.init(frame: frame)
        
        setConfigure(type: btnType)
        setBackgroundColor(type: btnType)
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Properties
    
    /// 상품 가격 레이블
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), color: .white)
    /// 즉시 구매가 / 즉시 판매가 표시 레이블
    lazy var subLabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), color: .black)
    
    /// 버튼 왼쪽 구매 / 판매 레이블
    lazy var buttonLeftLabel = makeLabel( font: UIFont.systemFont(ofSize: 16, weight: .semibold), color: .white)
    
    /// priceLabel + subLabel 스택뷰
    lazy var priceInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        return stack
    }()
    
    // MARK: - Function
    
    /// 레이블 생성 함수
    private func makeLabel( font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
    
    
    /// 컴포넌트 스택에 추가
    private func addStackView() {
        [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
    }
    
    /// 버튼 내부에 추가할 컴포넌트
    private func addComponents() {
        [buttonLeftLabel, priceInfoStack].forEach{ self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constraints() {
        buttonLeftLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(28)
        }
        
        priceInfoStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(buttonLeftLabel.snp.right).offset(21)
            make.width.greaterThanOrEqualTo(53)
            make.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(30)
            make.height.equalTo(16)
        }
        
        subLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(30)
            make.height.equalTo(12)
        }
    }
    
    /// 버튼 커스텀
    private func setConfigure(type: ButtonType) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        buttonLeftLabel.text = buttonLeftText(type: type)
        subLabel.textColor = setTextColor(type: type)
    }
    
    /// 버튼 텍스트 컬러 변경
    private func setTextColor(type: ButtonType) -> UIColor {
        switch type {
        case .buy:
            return UIColor(red: 0.639, green: 0.216, blue: 0.137, alpha: 1)
        case .sell:
            return UIColor(red: 0.122, green: 0.467, blue: 0.271, alpha: 1)
        }
    }
    
    /// 버튼 배경색 변경
    private func setBackgroundColor(type: ButtonType) {
        switch type {
        case .buy:
            self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
        case .sell:
            self.backgroundColor = UIColor(red: 0.255, green: 0.725, blue: 0.478, alpha: 1)
        }
    }
    
    /// 버튼 왼쪽 텍스트 반환
    private func buttonLeftText(type: ButtonType) -> String {
        switch type {
        case .buy:
            return "구매"
        case .sell:
            return "판매"
        }
    }
    
}
