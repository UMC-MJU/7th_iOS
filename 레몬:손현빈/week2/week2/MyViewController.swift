//
//  MyViewController.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//
import UIKit

class MyViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let followerLabel = UILabel()
    private let followingLabel = UILabel()
    private let profileManageButton = UIButton()
    private let profileShareButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        profileManageButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        profileImageView.image = UIImage(named: "profile_image") // 프로필 이미지 설정
        profileImageView.backgroundColor = .red
        profileManageButton.backgroundColor = .blue
        followerLabel.text = "팔로워 1111"
        followingLabel.text = "팔로잉 121"
        
        profileManageButton.setTitle("프로필 관리", for: .normal)
        profileShareButton.setTitle("프로필 공유", for: .normal)
        
        // View에 추가
        view.addSubview(profileImageView)
        view.addSubview(followerLabel)
        view.addSubview(followingLabel)
        view.addSubview(profileManageButton)
        view.addSubview(profileShareButton)
        
        // SnapKit 레이아웃 설정
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        profileManageButton.snp.makeConstraints { make in
            make.top.equalTo(followerLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        profileShareButton.snp.makeConstraints { make in
            make.top.equalTo(profileManageButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        //버튼 액션
        profileManageButton.addTarget(self, action: #selector(didTapProfileManageButton), for: .touchUpInside)
    }
    
    @objc
       private func didTapProfileManageButton() {
           // 프로필 수정 화면으로 전환
           print("test")
           
           //-MARK: error
           let profileEditVC = ProfileEditViewController() // 수정 화면 ViewController
           navigationController?.pushViewController(profileEditVC, animated: true)
       }
}
