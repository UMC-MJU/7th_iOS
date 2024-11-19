import UIKit
import SnapKit

class PurchaseView: UIView {
    
    // 상단 이미지와 썸네일 리스트
    let mainImageView = UIImageView()
    let thumbnailStackView = UIStackView()
    let thumbnails: [UIImageView] = (0..<6).map { _ in UIImageView() } // 임시로 6개의 썸네일
    
    // 상품 정보
    let priceLabel = UILabel()
    let productNameLabel = UILabel()
    let productDescription = UILabel()
    let priceright = UILabel()
    let productInfoStackView = UIStackView()
    
    // 하단 버튼 및 북마크
    let bookmarkButton = UIButton()
    let purchaseButton = UIButton()
    let sellButton = UIButton()
    let buttonStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        // 메인 이미지 설정
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.backgroundColor = .lightGray
        
        // 썸네일 스택뷰 설정
        thumbnailStackView.axis = .horizontal
        thumbnailStackView.spacing = 8
        thumbnailStackView.distribution = .fillEqually
        thumbnails.forEach { imageView in
            imageView.backgroundColor = .darkGray
            imageView.clipsToBounds = true
            thumbnailStackView.addArrangedSubview(imageView)
        }
        
        // 상품 정보 설정
        priceLabel.text = "228,000원"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        productNameLabel.text = "Matin Kim Logo Coating Jumper"
        productNameLabel.font = UIFont.systemFont(ofSize: 16)
        productNameLabel.textColor = .black
        
        priceright.text = "즉시 구매가"
        priceright.font = UIFont.systemFont(ofSize: 14)
        priceright.textColor = .gray
        
        productDescription.text = "마틴 킴 로고 코팅 점퍼"
        productDescription.font = UIFont.systemFont(ofSize: 14)
        productDescription.textColor = .gray
        
        productInfoStackView.axis = .vertical
        productInfoStackView.spacing = 4
        productInfoStackView.addArrangedSubview(priceright)
        productInfoStackView.addArrangedSubview(priceLabel)
        
        productInfoStackView.addArrangedSubview(productNameLabel)
        productInfoStackView.addArrangedSubview(productDescription)
        
        // 하단 버튼 설정
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .black
        
        purchaseButton.setTitle("구매", for: .normal)
        purchaseButton.backgroundColor = .red
        purchaseButton.layer.cornerRadius = 8
        
        sellButton.setTitle("판매", for: .normal)
        sellButton.backgroundColor = .green
        sellButton.layer.cornerRadius = 8
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        buttonStackView.distribution = .fillEqually
        buttonStackView.addArrangedSubview(purchaseButton)
        buttonStackView.addArrangedSubview(sellButton)
    }
    
    private func addComponents() {
        addSubview(mainImageView)
        addSubview(thumbnailStackView)
        addSubview(productInfoStackView)
        addSubview(bookmarkButton)
        addSubview(buttonStackView)
    }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 374, height: 373))
        }
        
        thumbnailStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(53)
        }
        
        productInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(thumbnailStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.leading.equalTo(bookmarkButton.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(bookmarkButton)
            make.height.equalTo(50)
        }
    }
}

