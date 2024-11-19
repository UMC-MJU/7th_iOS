//
//  PurchaseButtonProtocol.swift
//  Kream
//
//  Created by 배수호 on 11/19/24.
//

import Foundation
import UIKit

/// 거래 버튼 구현을 위해 구현해야하는 컴포넌트
protocol TradeButtonProtocol {
    var priceLabel: UILabel { get set }
    var subLabel: UILabel { get set }
}
