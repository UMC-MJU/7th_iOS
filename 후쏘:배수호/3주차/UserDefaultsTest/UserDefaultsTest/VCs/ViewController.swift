
import SnapKit
import UIKit

class ViewController: UIViewController {

    private let userDefaultsModel = UserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = userDefaultsView
        
    }
    
    private lazy var userDefaultsView: UserDefaultsView = {
        let view = UserDefaultsView()
        view.inputButton.addTarget(self, action: #selector(inputButtonClicked), for: .touchUpInside)
        return view
    }()
    
    @objc func inputButtonClicked() {
        guard let text = userDefaultsView.inputTextField.text, !text.isEmpty else{
            return
        }
        // model에 저장
        userDefaultsModel.saveUserText(text)
        // view에 표시
        userDefaultsView.showTextValue.text = text
    }
    
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText(){
            userDefaultsView.showTextValue.text = savedText
        }
    }
    

}

