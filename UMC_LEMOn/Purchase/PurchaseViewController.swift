import UIKit

class PurchaseViewController: UIViewController {
    
    let purchaseView = PurchaseView()
    
    override func loadView() {
        view = purchaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseView.purchaseButton.addTarget(self, action: #selector(showSelectSizeView), for: .touchUpInside)
    }
    
    @objc private func showSelectSizeView() {
        let selectSizeVC = SelectSizeViewController()
        selectSizeVC.modalPresentationStyle = .overFullScreen
        present(selectSizeVC, animated: true, completion: nil)
    }
}

