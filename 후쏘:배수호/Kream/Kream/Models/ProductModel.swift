//
//  ProductModel.swift
//  Kream
//
//  Created by 배수호 on 10/28/24.
//

import UIKit

struct ProductModel {
    let title: String
    let contents: String
    let productImage: String
    let price: String
    
}

final class DummyProductModel {
    static let productDatas: [ProductModel] = [
        ProductModel(title: "나이키 덩크 로우", contents: "나이키 덩크 로우 범고래 색상 사이즈 270. 실착 2회. 상태 A급입니다.", productImage: "Product_icon", price: "89,000원"),
                ProductModel(title: "아이패드 프로 11인치 4세대", contents: "128GB, 스페이스 그레이. 사용감 거의 없고 애플펜슬 포함입니다.", productImage: "Product_icon", price: "900,000원"),
                ProductModel(title: "에어팟 프로 2세대", contents: "생활기스 살짝 있음. 충전 케이스 포함, 정상 작동합니다.", productImage: "Product_icon", price: "230,000원"),
                ProductModel(title: "구찌 반지갑", contents: "선물 받았는데 제 취향이 아니어서 팝니다. 사용감 없습니다.", productImage: "Product_icon", price: "350,000원"),
                ProductModel(title: "플레이스테이션5 (PS5)", contents: "구매 후 거의 사용하지 않아 판매합니다. 패드 1개 포함.", productImage: "Product_icon", price: "590,000원"),
                ProductModel(title: "다이슨 V11 무선청소기", contents: "구성품 모두 있습니다. 작동 잘 되고 청소 성능 좋습니다.", productImage: "Product_icon", price: "450,000원"),
                ProductModel(title: "맥북 에어 M1", contents: "13인치, 8GB RAM, 256GB SSD. 생활기스 외 이상 없습니다.", productImage: "Product_icon", price: "850,000원"),
                ProductModel(title: "삼성 갤럭시 워치5", contents: "미스틱 실버 색상. 충전기 포함, 정상 작동합니다.", productImage: "Product_icon", price: "220,000원"),
                ProductModel(title: "LG 43인치 TV", contents: "스탠드형 TV, 리모컨 포함. 문제 없이 잘 작동합니다.", productImage: "Product_icon", price: "390,000원"),
                ProductModel(title: "캠핑 의자 세트", contents: "2인용 캠핑 의자. 접이식이고 사용감 적습니다.", productImage: "Product_icon", price: "70,000원"),
                ProductModel(title: "샤넬 N°5 향수", contents: "미개봉 새 제품입니다. 100ml 용량.", productImage: "Product_icon", price: "150,000원")
        ]
}
