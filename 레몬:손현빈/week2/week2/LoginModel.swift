//
//  LoginModel.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//
//
//  LoginViewController.swift
//  plz
//
//  Created by 손현빈 on 9/27/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: Int
    mutating func setID(_id: String) {
        self.id = _id
    }
    
    mutating func setpwd(_pwd: Int) {
        self.pwd = _pwd
    }
}


