//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    lazy var categoryImageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
    }

    lazy var categoryNameLabel = UILabel().then { label in
        label.text = "티니핑"
        label.font = UIFont.systemFont(ofSize: 11.5, weight: .light)
        label.textColor = .black
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
        addSubview(categoryImageView)
        addSubview(categoryNameLabel)
    }
    
    private func setConstraints(){
        categoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(61)
            make.width.equalTo(61)
        }
        categoryNameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalTo(categoryImageView)
        }
    }
    
    public func configure(model :CategoryInfo){
        self.categoryImageView.image = UIImage(named: model.image)
        self.categoryNameLabel.text = model.name
        print(model)
    }
}
