
import UIKit

enum OrderType {
    case fast
    case normal
}

class OrderButton: UIView, TradeButtonProtocol {
    
    let orderType: OrderType
    
    // MARK: - init
    
    init(frame: CGRect, orderType: OrderType) {
        self.orderType = orderType
        super.init(frame: frame)
        
        setConfigure(type: orderType)
        setBackgroundColor(type: orderType)
        addStackView()
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Properties
    
    /// 상품 가격 레이블
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), color: .white)
    /// "빠른 배송" / "일반 배송" 표시 레이블
    lazy var subLabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), color: .black)

    /// priceLabel + subLabel 스택뷰
    lazy var priceInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        stack.alignment = .center
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
        [priceInfoStack].forEach{ self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func setConstraints() {
        
        priceInfoStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(53)
            make.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(30)
        }
        
        subLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(30)
        }
    }
    
    /// 버튼 커스텀
    private func setConfigure(type: OrderType) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        subLabel.textColor = setTextColor(type: type)
        subLabel.text = setSubText(type: type)
    }
    
    /// 버튼 텍스트 컬러 변경
    private func setTextColor(type: OrderType) -> UIColor {
        switch type {
        case .fast:
            return UIColor(red: 1, green: 0.792, blue: 0.725, alpha: 1)
        case .normal:
            return  UIColor(red: 0.886, green: 0.886, blue: 0.886, alpha: 1)
        }
    }
    
    /// 버튼 배경색 변경
    private func setBackgroundColor(type: OrderType) {
        switch type {
        case .fast:
            self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
        case .normal:
            self.backgroundColor =  UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        }
    }
    
    /// 버튼 왼쪽 텍스트 반환
    private func setSubText(type: OrderType) -> String {
        switch type {
        case .fast:
            return "빠른배송(1~2일 소요)"
        case .normal:
            return "일반배송(5~7일 소요)"
        }
    }
    
}
