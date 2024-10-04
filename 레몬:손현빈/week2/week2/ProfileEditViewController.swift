//
//  ProfileEditViewController.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//

// ProfileEditViewController.swift
import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {
    
    private let profileTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "프로필 수정"
        
        profileTextField.placeholder = "프로필 이름 수정"
        profileTextField.borderStyle = .roundedRect
        
        view.addSubview(profileTextField)
        
        profileTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}
