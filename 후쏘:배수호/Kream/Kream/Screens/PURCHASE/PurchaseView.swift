

import UIKit

class PurchaseView: UIView {

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addStackView()
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    /// 상단 제일 큰 상품 이미지
    public lazy var productImageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
    }
    
    /// 상품의 다른 색상의 이미지 리스트
    public lazy var productOptionCollectionView = UICollectionView()
    
    /// "즉시 구매가" 텍스트 레이블
    private lazy var priceTitleLabel: UILabel = makeLabel("즉시 구매가", UIFont.systemFont(ofSize: 12,weight: .light), .black)
    
    /// 상품의 가격 레이블
    private lazy var priceLabel: UILabel = makeLabel("228,000원", UIFont.systemFont(ofSize: 20,weight: .semibold), .black)
    
    /// 상품의 이름 레이블
    private lazy var productName: UILabel = makeLabel("Matin Kim Logo Coating Jumprt", UIFont.systemFont(ofSize: 16,weight: .regular), .black)
    
    /// 상품의 한글 이름 레이블
    public lazy var productDescription: UILabel = makeLabel("마뗑킴 로고 코팅 점퍼 블랙", UIFont.systemFont(ofSize: 12, weight: .regular), UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1))
    
    /// 하단 저장 버튼
    private lazy var tagBtn = UIButton().then { button in
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "Saved_not_icon")
        configuration.imagePlacement = .top
        configuration.imagePadding = 1
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        configuration.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        button.configuration = configuration
    }
    
    /// 하단 왼쪽 구매 버튼
    public lazy var leftBuyBtn: TradeButton = makeBottomButton(price: "345,000", sub: "즉시 구매가", type: .buy)
    /// 하단 오른쪽 판매 버튼
    public lazy var rightSellBtn: TradeButton = makeBottomButton(price: "395,000", sub: "즉시 판매가", type: .sell)
    /// 하단의 태그 및 버튼들을 담는 백그라운드 뷰
    private lazy var bottomBackgroundView: BottomBackgroundView = BottomBackgroundView()
    
    /// priceTitleLabel + priceLabel 담는 스택
    private lazy var priceStack: UIStackView = makeStackView(spacing: 4, axis: .vertical)
    
    /// productName + productDescription 담는 스택
    private lazy var productStack: UIStackView = makeStackView(spacing: 6, axis: .vertical)
    
    /// 하단 커스텀 버튼 2개 담는 스택
    private lazy var bottomButtonStack: UIStackView = makeStackView(spacing: 6, axis: .horizontal)
    
    
    // MARK: - Make Component Function
    
    /// label 생성 함수
    private func makeLabel(_ text: String, _ font: UIFont, _ color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    /// bottom button 생성 함수
    private func makeBottomButton (price: String, sub: String, type: ButtonType) -> TradeButton {
        let btn = TradeButton(frame: .zero, btnType: type)
        btn.priceLabel.text = price
        btn.subLabel.text = sub
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    /// stackView 생성 함수
    private func makeStackView(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        return stack
    }
    
    
    // MARK: - Function
    
    private func addStackView(){
        [priceTitleLabel, priceLabel].forEach{ self.priceStack.addArrangedSubview($0) }
        [productName, productDescription].forEach{ self.productStack.addArrangedSubview($0) }
        [leftBuyBtn, rightSellBtn].forEach{ self.bottomButtonStack.addArrangedSubview($0) }
    }
    
    private func addComponents(){
        [productImageView].forEach{ self.addSubview($0) }
        [priceStack, productStack, bottomBackgroundView].forEach{ self.addSubview($0) }
        [tagBtn, bottomButtonStack].forEach{ self.bottomBackgroundView.addSubview($0) }
    }
    
    private func setConstraints(){
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        priceStack.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
            $0.width.greaterThanOrEqualTo(50)
            $0.height.equalTo(42)
        }
        
        productStack.snp.makeConstraints {
            $0.top.equalTo(priceStack.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
            $0.width.greaterThanOrEqualTo(80)
            $0.height.equalTo(40)
        }
        
        bottomBackgroundView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        tagBtn.snp.makeConstraints {
            $0.left.equalToSuperview().offset(19)
            $0.top.equalToSuperview().offset(12)
            $0.height.greaterThanOrEqualTo(30)
            $0.width.greaterThanOrEqualTo(20)
        }
        
        bottomButtonStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(tagBtn.snp.right).offset(19)
            $0.width.equalTo(300)
            $0.height.equalTo(49)
        }
        
        leftBuyBtn.snp.makeConstraints {
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        rightSellBtn.snp.makeConstraints {
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
    }
    
}
