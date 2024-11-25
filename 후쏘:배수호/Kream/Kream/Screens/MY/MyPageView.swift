
import UIKit

protocol MyPageViewDelegate: AnyObject {
    func didTapEditProfileButton()
}

class MyPageView: UIView {
    
    weak var delegate: MyPageViewDelegate?
    
//    상단 버튼 ViewController의 navigationBar로 변경

//    lazy var settingButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Gear_icon"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFill
//        return button
//    }()
//    
//    lazy var cameraButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Camera_icon"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFill
//        return button
//    }()
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile_image")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var userNameText: UILabel = {
        let label = UILabel()
        label.text = "Bae_iOS"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var followerText: UILabel = {
        let label = UILabel()
        label.text = "팔로워"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var followerCountText: UILabel = {
        let label = UILabel()
        label.text = "326"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    
    lazy var followingText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "팔로잉"
        return label
    }()
    
    lazy var followingCountText: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
//    // 상단 네비게이션바 스택뷰 (settingButton + cameraButton)
//    lazy var navigationBar: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [settingButton, cameraButton])
//        stackView.axis = .horizontal
//        stackView.spacing = 278
//        return stackView
//    }()
//    
    // 팔로워 스택뷰 (followerText + followerCountText)
    lazy var followerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerText, followerCountText])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    // 팔로잉 스택뷰 (followingText + followingCountText)
    lazy var followingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followingText, followingCountText])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    // 팔로워 + 팔로잉을 합친 수평 스택뷰
    lazy var followStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerStackView, followingStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8  // 팔로워와 팔로잉 사이의 간격
        return stackView
    }()
    
    // 유저 이름 + 팔로우(팔로워, 팔로잉) 합친 수직 스택뷰
    lazy var nameFollowStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameText, followStackView])
        stackView.axis = .vertical
        return stackView
    }()
    
    //  프로필 이미지 + ( 유저 이름 + 팔로우 ) 합친 수평 스택뷰
    lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImage, nameFollowStackView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    //   프로필 관련 버튼 ( edit 버튼 + share 버튼 ) 수평 스택뷰
    lazy var profileButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [editProfileButton, shareProfileButton])
        stackView.axis = .horizontal
        stackView.spacing = 14
        return stackView
    }()
    
    // 상단바 + 프로필 정보 + 버튼 합친 수직 스택뷰
    lazy var manageUserInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userInfoStackView, profileButtonStackView])
        stackView.axis = .vertical
        stackView.spacing = 47
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        addSubview(manageUserInfoStackView)
        
        nameFollowStackView.snp.makeConstraints{ make in
            make.height.equalTo(48)
        }
        manageUserInfoStackView.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide).offset(26)
            make.centerX.equalToSuperview()
        }
                
        // 버튼 크기 조정
        editProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        shareProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
    
    // MARK: 로그인 버튼 클릭 이벤트
    @objc private func editProfileButtonTapped() {
        delegate?.didTapEditProfileButton()
     }
     private func addActions() {
         editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
     }
}
