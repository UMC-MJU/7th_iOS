//
//  PurchaseModel.swift
//  Kream
//
//  Created by 배수호 on 11/25/24.
//

import UIKit

struct PurchaseModel: RequiredCellProtocol {
    var imageView: String
    var productName: String
}

final class PurchaseData{
    static let purchaseData: [PurchaseModel] = [
        .init(imageView: "Purchase_image1", productName: "마땡킴 로고 코팅 점퍼 블랙"),
        .init(imageView: "Purchase_image2", productName: "마땡킴 로고 코팅 점퍼 블루"),
        .init(imageView: "Purchase_image3", productName: "마땡킴 로고 코팅 점퍼 퍼플"),
        .init(imageView: "Purchase_image4", productName: "마땡킴 로고 코팅 점퍼 그린"),
        .init(imageView: "Purchase_image5", productName: "마땡킴 로고 코팅 점퍼 버건디"),
        .init(imageView: "Purchase_image6", productName: "마땡킴 로고 코팅 점퍼 레드"),
        .init(imageView: "Purchase_image7", productName: "마땡킴 로고 코팅 점퍼 브라운")
    ]
}
