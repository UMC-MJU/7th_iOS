//
//  DiceModel.swift
//  DiceTableView
//
//  Created by 배수호 on 10/28/24.
//

import Foundation

struct DiceModel {
    let diceImage: String
    let diceName: String
}

final class DummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "dice 1.pdf", diceName: "주사위 1"),
        DiceModel(diceImage: "dice 2.pdf", diceName: "주사위 2"),
        DiceModel(diceImage: "dice 3.pdf", diceName: "주사위 3"),
        DiceModel(diceImage: "dice 4.pdf", diceName: "주사위 4"),
        DiceModel(diceImage: "dice 5.pdf", diceName: "주사위 5"),
        DiceModel(diceImage: "dice 6.pdf", diceName: "주사위 6")
    ]
}
