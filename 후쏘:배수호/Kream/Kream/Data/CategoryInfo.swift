//
//  CategoryInfo.swift
//  Kream
//
//  Created by 배수호 on 11/5/24.
//

import Foundation

struct CategoryInfo {
    var image: String
    var name: String
    
    
}
final class DummyCategory {
    static let data: [CategoryInfo] = [
        CategoryInfo(image: "Category_image1", name: "크림 드로우"),
        CategoryInfo(image: "Category_image2", name: "실시간 차트"),
        CategoryInfo(image: "Category_image3", name: "남성 추천"),
        CategoryInfo(image: "Category_image4", name: "여성 추천"),
        CategoryInfo(image: "Category_image5", name: "색다른 추천"),
        CategoryInfo(image: "Category_image6", name: "정가 아래"),
        CategoryInfo(image: "Category_image7", name: "윤세 24AW"),
        CategoryInfo(image: "Category_image8", name: "올해의 베스트"),
        CategoryInfo(image: "Category_image9", name: "10월 베네핏"),
        CategoryInfo(image: "Category_image10", name: "아크네 선물")
    ]
}
