//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class JustDroppedCell: BaseCollectionCell {
    
    static let identifier = "JustDroppedCell"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        addComponents()
        setConstraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        purchaseCount.text = nil
        tagButton.setImage(nil, for: .normal)
        
        titleText.text = nil
        subTitleText.text = nil
        
        priceLabel.text = nil
        //priceDescription.text = nil
    }
    
    // MARK: - Properties
    
    /// 상품 구매 수
    private lazy var purchaseCount: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), UIColor(red: 0.251, green: 0.272, blue: 0.294, alpha: 1))
    
    /// 상품 백그라운드 이미지 색상 랜덤
    private lazy var imageBackground = UIView().then { view in
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.6
        )
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
    }
    
    /// 태그 버튼
    private lazy var tagButton = UIButton()
    
    private lazy var priceDescription = UILabel().then { label in
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 0.635, green: 0.635, blue: 0.635, alpha: 1)
    }
    
    /// 상품 브랜드 + 이름 스택뷰
    private lazy var productTitleStack: UIStackView = makeStackView(spacing: 3)
    
    /// 가격 + "즉시 구매가" 스택뷰
    private lazy var priceTitleStack: UIStackView = makeStackView(spacing: 2)
    
    // MARK: - Function
    
    /// stackView에 컴포넌트 추가
    private func addStackView(){
        [priceLabel, priceDescription].forEach { view in
            priceTitleStack.addArrangedSubview(view)
        }
        [titleText, subTitleText].forEach { view in
            productTitleStack.addArrangedSubview(view)
        }
    }
    
    /// 컴포넌트 추가
    private func addComponents(){
        
        /* 랜덤 색상 백그라운드 뷰에 컴포넌트 추가 (상품 이미지 + 구매 수 + 태그 버튼) */
        [imageView, purchaseCount, tagButton].forEach { view in
            imageBackground.addSubview(view)
        }
        /* Cell에 컴포넌트 추가 ( 상품 스택뷰, 가격 스택뷰, 상품 이미지 ) */
        [productTitleStack, priceTitleStack, imageBackground].forEach { view in
            self.addSubview(view)
        }
    }
    
    /// autoLayout 적용
    private func setConstraints(){
        imageBackground.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.right.equalToSuperview().offset(0)
            $0.height.equalTo(142)
        }
        
        purchaseCount.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            $0.width.greaterThanOrEqualTo(48)
            $0.height.equalTo(12)
        }
        
        tagButton.snp.makeConstraints {
            $0.top.equalTo(purchaseCount.snp.bottom).offset(92)
            $0.right.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(14.2)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.lessThanOrEqualTo(123)
            $0.height.greaterThanOrEqualTo(30)
        }
        
        /* 상품 배경에 속해 있는 데이터 */
        
        productTitleStack.snp.makeConstraints {
            $0.top.equalTo(imageBackground.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(25)
        }
        
        titleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        subTitleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(14)
        }
        
        priceTitleStack.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
    
    /// saved 이미지 설정 함수
    private func setTagButtonImage(isMark: Bool) -> UIImage {
        if isMark {
            return UIImage(named: "Saved_fill_icon") ?? UIImage()
        }
        else{
            return UIImage(named: "Saved_not_icon") ?? UIImage()
        }
    }
    
    override func configure(model: any RequiredCellProtocol) {
        guard let justDroppedModel = model as? JustDroppedModel else { return }
        
        imageView.image = UIImage(named: justDroppedModel.imageView)?.downSample(scale: 0.3)
        purchaseCount.text = justDroppedModel.purchaseCnt
        tagButton.setImage(setTagButtonImage(isMark: justDroppedModel.selectedTag), for: .normal)
        
        titleText.text = justDroppedModel.titleText
        subTitleText.text = justDroppedModel.subTitleText
        
        priceLabel.text = justDroppedModel.priceText
    }
    
}
