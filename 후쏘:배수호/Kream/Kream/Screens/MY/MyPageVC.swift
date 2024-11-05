import UIKit

class MyPageVC: UIViewController, MyPageViewDelegate {
    
    private let myPageView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        myPageView.delegate = self // Set the delegate
        setNavigationBar()
    }
    
    private func setNavigationBar(){
        
        let gearImage = UIImage(named: "Gear_icon")
        let cameraImage = UIImage(named: "Camera_icon")
    
        let settiongButton = UIBarButtonItem(image: gearImage)
        let cameraButton = UIBarButtonItem(image: cameraImage)
        // tintColor를 검정으로 설정
        settiongButton.tintColor = .black
        cameraButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = settiongButton
        navigationItem.rightBarButtonItem = cameraButton
    }
}



// MARK: - MyPageViewDelegate
extension MyPageVC {
    func didTapEditProfileButton() {
        let viewController = EditProfileVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

