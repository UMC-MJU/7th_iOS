//
//  ProductCellProtocol.swift
//  Kream
//
//  Created by 배수호 on 11/18/24.
//


import UIKit

/// 크림 상품 셀에 사용할 프로토콜
protocol ProductCellProtocol {
    var imageView: UIImageView { get }
    var titleText: UILabel { get }
    var priceLabel: UILabel { get }
    
    func configure(model: RequiredCellProtocol)
}
