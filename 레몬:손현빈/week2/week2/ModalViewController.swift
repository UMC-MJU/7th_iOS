//
//  ModalViewController.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//

import UIKit
import SnapKit
class ModalViewController: UIViewController {

    private let label = UILabel()
    private let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "버튼을 누르면 모달 방식으로 화면전환이 일어남"
        label.textColor = .cyan
        
        button.setTitle("버튼을 누르세요", for : .normal)
        button.backgroundColor = .systemIndigo

        //add subview를 통해 label 과 button을 view에 추가해주기
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(244)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    // 액션 메소드 내의 코드 쓰기
    @objc
    private func buttonDidTrap(){
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        viewController.modalPresentationStyle = .fullScreen
        
        // 모달을 이용해서 뷰를 띄우기 위해 present메소드 이용함 
        present(viewController, animated : true )
    }
    
}
