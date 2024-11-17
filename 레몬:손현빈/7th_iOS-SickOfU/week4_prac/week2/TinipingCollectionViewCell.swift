//
//  TinipingCollectionViewCell.swift
//  week2
//
//  Created by 손현빈 on 11/6/24.
//

import UIKit
class TinipingCollectionViewCell : UICollectionViewCell {
    static let identifier = "TinipingCollectionViewCell"
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight : .semibold)
        $0.textColor = .black
        $0.text = "xijinping"
    }
    required init? (coder : NSCoder){
        fatalError( "init(coder:) has not been implemented")
    }
    private func setupview(){
        addSubview(imageView)
        addSubview(titleLabel)
        imageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(120)
        }
        titleLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
            
        }
        
    }
}
