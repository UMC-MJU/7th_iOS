//
//  myPageView.swift
//  week2
//
//  Created by 손현빈 on 10/28/24.
//
import UIKit

class MyPageView: UIView {

    // 설정 아이콘
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 프로필 설정 아이콘
    var profileSettingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 프로필 이미지
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pro")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 사용자 이름 라벨
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 팔로워,팔로잉 정보 라벨
    private lazy var followInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326  팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 프로필 관리 버튼
    var manageProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 관리", for: .normal)
        button.layer.borderWidth = 20
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 프로필 공유 버튼
    var shareProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 공유", for: .normal)
        button.layer.borderWidth = 20
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 상단 툴바 (가로 묶음) 설정이랑 카메라 위에 묶기
    private lazy var toolbarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [settingsButton, profileSettingsButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 프로필 관리 , 공유 버튼 (가로 묶음)
    private lazy var actionButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [manageProfileButton, shareProfileButton])
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 프로필 정보 영역 (세로 묶음)
    private lazy var profileInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, usernameLabel, followInfoLabel, actionButtonsStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 전체 레이아웃 (세로 묶음)
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [toolbarStackView, profileInfoStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 메인 스택뷰 중앙 정렬 및 전체 화면에 맞추기
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            // 상단 툴바의 높이 설정
            toolbarStackView.heightAnchor.constraint(equalToConstant: 40),
            
            // 프로필 이미지 크기 설정
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // 관리 및 공유 버튼 높이 설정
            manageProfileButton.heightAnchor.constraint(equalToConstant: 40),
            shareProfileButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

