//
//  InfluencerInfo.swift
//  Kream
//
//  Created by 배수호 on 11/6/24.
//

import Foundation

struct InfluencerInfo {
    var image: String
}

final class DummyInfluencer {
    static let data: [InfluencerInfo] = [
        InfluencerInfo(image: "Influencer_image1"),
        InfluencerInfo(image: "Influencer_image2"),
        InfluencerInfo(image: "Influencer_image1"),
        InfluencerInfo(image: "Influencer_image1"),
        InfluencerInfo(image: "Influencer_image2"),
        InfluencerInfo(image: "Influencer_image1"),
        InfluencerInfo(image: "Influencer_image1"),
        InfluencerInfo(image: "Influencer_image2"),
        InfluencerInfo(image: "Influencer_image1")
    ]
}
