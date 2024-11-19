import UIKit
import SnapKit

class MyViewController: UIViewController {
    
    // MyPageView 인스턴스 생성
    private let myPageView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // MyPageView 추가
        view.addSubview(myPageView)
        
        // MyPageView 레이아웃 설정
        myPageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 화면 전체를 채우도록 설정
        }
        
        // MyPageView의 프로필 관리 버튼 액션 연결
        myPageView.manageProfileButton.addTarget(self, action: #selector(didTapProfileManageButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapProfileManageButton() {
        // 프로필 수정 화면으로 전환
        let profileEditVC = ProfileEditViewController()
        profileEditVC.view.backgroundColor = .lightGray
        navigationController?.pushViewController(profileEditVC, animated: true)
    }
}

