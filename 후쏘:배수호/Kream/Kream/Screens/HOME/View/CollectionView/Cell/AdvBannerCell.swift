//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class AdvBannerCell: BaseCollectionCell {
    
    static let identifier = "AdvBannerCell"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    // MARK: - Function
    private func setupView(){
        addSubview(imageView)
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    /// RequiredCellProtocol 상속을 받는 모델 값을 파라미터로 전달하여 해당 셀의 값 넣어준다.
    /// - Parameter model: RequiredCellProtocol을 상속받는 모델
    override func configure(model: any RequiredCellProtocol) {
        guard let bannerModel = model as? BannerModel else { return }
        
        self.imageView.image = UIImage(named: bannerModel.imageView)
    }
}
