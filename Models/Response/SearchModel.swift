//
//  SearchModel.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/22/24.
//

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contestText: String?
    let date: String?
    let titleText: String?
    let urlText: String?
    
    enum CodingKeys: String, CodingKey {
        case contestText = "contents"
        case date = "datetime"
        case titleText = "title"
        case urlText = "url"
    }
}
