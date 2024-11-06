//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class InfluencerCell: UICollectionViewCell {
    static let identifier = "InfluencerCell"
    
    lazy var influencerImageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
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
        addSubview(influencerImageView)
    }
    
    private func setConstraints(){
        influencerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(124)
        }
        
    }
    
    public func configure(model :InfluencerInfo){
        self.influencerImageView.image = UIImage(named: model.image)
        print(model)
    }
}
