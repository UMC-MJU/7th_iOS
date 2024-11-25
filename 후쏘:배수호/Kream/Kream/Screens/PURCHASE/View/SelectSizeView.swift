
import UIKit

class SelectSizeView: UIView {
    
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
    
    /// 사이즈 선택 화면에서 사이즈 선택하고자 하는 상품 이미지
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    /// 사이즈 옵션 컬렉션뷰
    public lazy var sizeOptionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SizeOptionCell.self, forCellWithReuseIdentifier: SizeOptionCell.identifier)
        return collectionView
    }()
    
    /// 상품 이름 레이블
    private lazy var productNameLabel: UILabel = makeLabel("", UIFont.systemFont(ofSize: 14, weight: .regular), color: .black)
    
    /// 상품 설명 레이블
    private lazy var productDescription: UILabel = makeLabel("", UIFont.systemFont(ofSize: 12, weight: .regular), color: .lightGray)
    /// 구분선과 배송 버튼 두개를 담을 백그라운드뷰
    private lazy var bottomBackgroundView: BottomBackgroundView = BottomBackgroundView()
    
    /// 왼쪽 빠른 배송 버튼
    public lazy var leftFastOrderBtn: OrderButton = makeBottomBtn(price: "345,000", type: .fast)
    
    /// 우측 일반 배송 버튼
    public lazy var rightOrderBtn: OrderButton = makeBottomBtn(price: "407,000", type: .normal)
    
    /// ( 상품 이름 + 상품 설명 ) 스택뷰
    private lazy var productInfoStackView: UIStackView = makeStackView(spacing: 4, axis: .vertical)
    
    /// ( 빠른 배송 + 일반 배송 ) 버튼 스택뷰
    private lazy var bottomButtonStackView: UIStackView = makeStackView(spacing: 6, axis: .horizontal)
    
    
    // MARK: - Make Function
    
    /// 레이블 생성 함수
    private func makeLabel(_ text: String, _ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    /// 스택뷰 생성 함수
    /// - Parameters
    /// - spacing: 간격
    /// - axis: 방향
    private func makeStackView(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        return stack
    }
    
    private func makeBottomBtn(price: String, type: OrderType) -> OrderButton {
        let btn = OrderButton(frame: .zero, orderType: type)
        btn.priceLabel.text = price
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    // MARK: - Function
    
    /// 받아온 데이터를 꺼내 컴포넌트 세팅
    public func setValue(data: ReceivePurchaseData) {
        self.productImageView.image = data.image
        self.productNameLabel.text = data.productName
        self.productDescription.text = data.prodcutDescription
    }
    
    /// 스택뷰 설정
    private func addStackView() {
        [productNameLabel, productDescription].forEach{ self.productInfoStackView.addArrangedSubview($0) }
        [leftFastOrderBtn, rightOrderBtn].forEach{ self.bottomButtonStackView.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 설정
    private func addComponents() {
        [productImageView, productInfoStackView,sizeOptionCollectionView, bottomBackgroundView].forEach{ self.addSubview($0) }
        [productImageView, productInfoStackView].forEach{ self.addSubview($0) }
        [bottomButtonStackView].forEach{ self.bottomBackgroundView.addSubview($0) }
    }
    
    /// 오토레이아웃 설정
    private func setConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            make.left.equalToSuperview().offset(16)
            make.width.height.equalTo(91)
        }
        
        productInfoStackView.snp.makeConstraints { make in
            make.centerY.equalTo(productImageView.snp.centerY)
            make.left.equalTo(productImageView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(35)
        }
        
        sizeOptionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.greaterThanOrEqualTo(115)
        }
        
        bottomBackgroundView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(95)
        }
        
        bottomButtonStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(342)
            make.height.equalTo(52)
        }
        
        leftFastOrderBtn.snp.makeConstraints { make in
            make.width.equalTo(168)
            make.height.equalTo(52)
        }
        
        rightOrderBtn.snp.makeConstraints { make in
            make.width.equalTo(168)
            make.height.equalTo(52)
        }
    }
    
   
}
