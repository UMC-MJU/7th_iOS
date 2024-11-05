//
//  ProductCell.swift
//  Kream
//
//  Created by 배수호 on 10/28/24.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let identifier = "ProductCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 컴포넌트
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true  // 이미지가 라운드 경계 안에 맞춰 잘리도록 설정
        imageView.layer.cornerRadius = 10  // 원하는 라운드 값
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var contents: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "DescriptionColor")
        label.font = UIFont.systemFont(ofSize: 9)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7
        return stackView
    }()
    
    lazy var savedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Saved_fill_icon")
        return imageView
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private func setViews() {
        self.addSubview(productImage)
        self.addSubview(descriptionStackView)
        self.addSubview(savedIcon)
        self.addSubview(price)
        
        //set StackView
        descriptionStackView.addArrangedSubview(title)
        descriptionStackView.addArrangedSubview(contents)
    }
    
    private func setConstraints(){
        productImage.snp.makeConstraints { make in
            make.width.height.equalTo(72)
            make.top.left.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-14)
        }
        title.snp.makeConstraints { make in
        }
        descriptionStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalTo(productImage.snp.right).offset(13)
            make.width.equalTo(153)
        }
        savedIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        price.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    public func configure(model: ProductInfo){
        self.productImage.image = UIImage(named: model.productImage)
        self.title.text = model.title
        self.contents.text = model.contents
        self.price.text = model.price
        
        // 줄 간격 설정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4  // 원하는 줄 간격
        
        let attributedString = NSAttributedString(
            string: model.contents,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont.systemFont(ofSize: 9)  // 폰트 유지
            ]
        )
        self.contents.attributedText = attributedString
    }
    
}
