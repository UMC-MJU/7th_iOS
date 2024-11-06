//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class NewProductCell: UICollectionViewCell {
    static let identifier = "NewProductCell"
    
    lazy var imageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
    }

    lazy var brandName = UILabel().then { label in
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
    }

    lazy var name = UILabel().then { label in
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.numberOfLines = 2
    }
   
    lazy var price = UILabel().then { label in
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .black
    }
    
    lazy var nowPriceLabel = UILabel().then { label in
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(named: "DescriptionColor")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(imageView)
        addSubview(brandName)
        addSubview(name)
        addSubview(price)
        addSubview(nowPriceLabel)
    }
//    
    private func setConstraints(){
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(142)
        }
        brandName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(4)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(4)
            make.width.equalTo(124)
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(43)
            make.left.equalToSuperview().offset(4)
        }
        nowPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(4)
        }
        
    }
//    
    public func configure(model: NewProductInfo){
        self.imageView.image = UIImage(named: model.image)
        self.brandName.text = model.brand
        self.name.text = model.name
        self.price.text = model.nowPrice
        print(model)
    }
}
