//
//  ModalViewController.swift
//  umc-ios-workbook_week2
//
//  Created by 배수호 on 10/6/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {

    lazy var label = UILabel();
    lazy var button = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "버튼 클릭 시 Modal 화면 전환"
        label.textColor = .blue
        
        button.setTitle("버튼 클릭!", for: .normal)
        button.backgroundColor = .green
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .red
        viewController.modalPresentationStyle = .pageSheet
        
        present(viewController, animated: true)
    }
}
