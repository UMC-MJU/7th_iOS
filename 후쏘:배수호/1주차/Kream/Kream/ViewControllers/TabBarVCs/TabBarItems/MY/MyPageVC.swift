import UIKit

class MyPageVC: UIViewController, MyPageViewDelegate {

    private let myPageView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        myPageView.delegate = self // Set the delegate
    }
}

// MARK: - MyPageViewDelegate
extension MyPageVC {
    func didTapEditProfileButton() {
        let viewController = EditProfileVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
