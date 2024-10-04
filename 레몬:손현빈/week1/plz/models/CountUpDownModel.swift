//
//  model.swift
//  plz
//
//  Created by 손현빈 on 9/27/24.
//
import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
