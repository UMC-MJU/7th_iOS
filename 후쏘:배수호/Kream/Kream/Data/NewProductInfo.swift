//
//  CategoryInfo.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import Foundation

struct NewProductInfo {
    var image: String
    var brand: String
    var name: String
    var nowPrice: String
}

final class DummyNewProduct {
    static let data: [NewProductInfo] = [
        NewProductInfo(image: "NewProduct_image1", brand: "MBL", name: "청키라이너 뉴욕양키스", nowPrice: "139,000원"),
        NewProductInfo(image: "NewProduct_image2", brand: "Jordan", name: "Jordan 1 Retro High OG Yellow Ochre", nowPrice: "228,000원"),
        NewProductInfo(image: "NewProduct_image1", brand: "MBL", name: "청키라이너 뉴욕양키스", nowPrice: "139,000원")
    ]
}
