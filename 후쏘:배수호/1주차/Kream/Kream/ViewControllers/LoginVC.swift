

import UIKit

class LoginVC: UIViewController, LoginViewDelegate {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        loginView.delegate = self // Set the delegate
    }
}

// MARK: - LoginViewDelegate
extension LoginVC {
    func didTapLoginButton() {
        let viewController = TabBarController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
