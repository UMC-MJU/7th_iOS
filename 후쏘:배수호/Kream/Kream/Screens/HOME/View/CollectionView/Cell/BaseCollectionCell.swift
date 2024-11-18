//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, ProductCellProtocol {

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        titleText.text = nil
        subTitleText.text = nil
        priceLabel.text = nil
    }
    
    // MARK: - Properties
    
    /// 상품 이미지
    lazy var imageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    /// 상품 타이틀
    lazy var titleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), UIColor.black)
    
    /// 상품 서브 타이틀
    lazy var subTitleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .regular), UIColor.black)
    
    /// 상품 가격
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), UIColor.black)
    
    func configure(model: any RequiredCellProtocol) {
        
    }
    
    // MARK: - Function
    
    /// 중복 라벨 처리 함수
    /// - Parameter font: 텍스트 폰트 지정
    /// - Returns: 지정된 폰트 UILabel 반환
    func makeLabel(font: UIFont, _ color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }
    
    /// 스xor뷰 생성
    /// - Parameter spacing: 간격 조정
    /// - Returns: UIStackView 반환
    func makeStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = spacing
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }
    
    func imageViewCorner(cornerRadius: CGFloat) {
        imageView.layer.cornerRadius = cornerRadius
    }
}
