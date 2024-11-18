//
//  CategoryCell.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import UIKit

class CategoryCell: BaseCollectionCell {
    
    static let identifier = "CategoryCell"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
        changeFont()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        titleText.text = nil
    }
    
    // MARK: - Function
    
    private func changeFont() {
        titleText.font = UIFont.systemFont(ofSize: 11.5, weight: .regular)
    }
    
    private func addComponents(){
        [imageView, titleText].forEach { view in
            addSubview(view)
        }
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(61)
        }
        titleText.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(6)
            make.centerX.equalTo(imageView.snp.centerX)
            make.width.lessThanOrEqualTo(65)
            make.height.equalTo(14)
        }
    }
    
    override func configure(model : any RequiredCellProtocol){
        guard let categoryModel = model as? CategoryModel else { return }
        imageView.image = UIImage(named: categoryModel.imageView)
        titleText.text = categoryModel.titleText
    }
}
