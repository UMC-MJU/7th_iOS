//
//  TeeniepingCollectionViewCell.swift
//  TeeniepingCollectionView
//
//  Created by 배수호 on 10/30/24.
//

import UIKit

class TeeniepingCell: UICollectionViewCell {
    
    static let identifier = "TeeniepingCell"
    
    lazy var imageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }

    lazy var nameLabel = UILabel().then { label in
        label.text = "티니핑"
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
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
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(120)
            make.width.equalTo(162)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
        }
    }
    
    public func configure(model :Teenieping){
        self.imageView.image = UIImage(named: model.image)
        self.nameLabel.text = model.name
        print(model)
    }
}
