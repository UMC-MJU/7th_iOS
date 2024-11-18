//
//  BannerModel.swift
//  Kream
//
//  Created by 배수호 on 11/18/24.
//


/// 홈 탭의 광고 배너, 1번째 섹션
struct BannerModel: RequiredCellProtocol {
    var imageView: String
}

/// 홈 탭의 카테고리 분류, 2번째 섹션
struct CategoryModel: RequiredCellProtocol {
    var imageView: String
    var titleText: String
}

/// 홈 탭의 Just Dropped, 3번째 섹션
struct JustDroppedModel: RequiredCellProtocol {
    var imageView: String
    var purchaseCnt: String
    var selectedTag: Bool
    var titleText: String
    var subTitleText: String
    var priceText: String
}

/// 홈 탭의 User Story, 4번째 섹션
struct UserStoryModel: RequiredCellProtocol {
    var imageView: String
    var userName: String
}

// MARK: - Dummy Data
final class HomeCellModel {
    /* 광고 배너 데이터, 1번째 섹션 데이터 */
    static let bannerData: [BannerModel] = [.init(imageView: "Advertise_image")]
    
    /* 카테고리 분류 데이터, 2번째 섹션 데이터 */
    static let CategoryData: [CategoryModel] = [
        .init(imageView: "Category_image1", titleText: "크림 드로우"),
        .init(imageView: "Category_image2", titleText: "실시간 차트"),
        .init(imageView: "Category_image3", titleText: "남성 추천"),
        .init(imageView: "Category_image4", titleText: "여성 추천"),
        .init(imageView: "Category_image5", titleText: "색다른 추천"),
        .init(imageView: "Category_image6", titleText: "정가 아래"),
        .init(imageView: "Category_image7", titleText: "윤세 24AW"),
        .init(imageView: "Category_image8", titleText: "올해의 베스트"),
        .init(imageView: "Category_image9", titleText: "10월 베네핏"),
        .init(imageView: "Category_image10", titleText: "아크네 선물")
    ]
    
    /* Just Dropped 데이터, 3번째 섹션 데이터 */
    static let JustDroppedData: [JustDroppedModel] = [
        .init(imageView: "Product_image1",
              purchaseCnt: "거래 12.8만",
              selectedTag: false,
              titleText: "MLB",
              subTitleText: "청키라이너 뉴욕양키스",
              priceText: "139,000원"),
        .init(imageView: "Product_image2",
              purchaseCnt: "거래 20.1만",
              selectedTag: true,
              titleText: "Jordan",
              subTitleText: "Jordan 1 Retro High OG Yellow Ochre",
              priceText: "228,000원"),
        .init(imageView: "Product_image3",
              purchaseCnt: "거래 9.3만",
              selectedTag: false,
              titleText: "Adidas",
              subTitleText: "Yeezy Boost 350 V2",
              priceText: "350,000원"),
        .init(imageView: "Product_image4",
              purchaseCnt: "거래 5.4만",
              selectedTag: false,
              titleText: "Converse",
              subTitleText: "Chuck Taylor All Star",
              priceText: "95,000원"),
        .init(imageView: "Product_image5",
              purchaseCnt: "거래 15.6만",
              selectedTag: true,
              titleText: "Nike",
              subTitleText: "Air Max 97",
              priceText: "180,000원"),
        .init(imageView: "Product_image6",
              purchaseCnt: "거래 8.7만",
              selectedTag: false,
              titleText: "Reebok",
              subTitleText: "Club C 85",
              priceText: "75,000원")
       ]

    /* 유저 스토리형 데이터, 4번째 섹션 데이터 */
    static let UserStoryData: [UserStoryModel] = [
        .init(imageView: "UserStory_image1", userName: "@bae.s_o"),
        .init(imageView: "UserStory_image2", userName: "@UMC-7th"),
        .init(imageView: "UserStory_image3", userName: "@thosan"),
        .init(imageView: "UserStory_image4", userName: "@londonHuman"),
        .init(imageView: "UserStory_image5", userName: "@Faker")
        ]
}
