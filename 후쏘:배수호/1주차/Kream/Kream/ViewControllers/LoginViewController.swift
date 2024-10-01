//
//  ViewController.swift
//  Kream
//
//  Created by 배수호 on 9/29/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = loginView
        }
        
        private lazy var loginView: LoginView = {
            let view = LoginView()
            return view
        }()
}

