import UIKit

class EditProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = EditProfileView()
        setNavigationBar()
    }
    
    private func setNavigationBar(){
        // 타이틀 설정
        self.title = "프로필 관리"
        // back 버튼 이미지 설정
        let backButtonImage = UIImage(named: "Back_icon")
        // 커스텀 back 버튼 생성
        let backButton = UIBarButtonItem(image: backButtonImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        // tintColor를 검정으로 설정
        backButton.tintColor = .black
        // leftBarButtonItem으로 설정
        navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
