import UIKit
import SnapKit

class NavigationViewController: UIViewController {

    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "버튼을 누르면 모달 방식으로 화면전환이 일어남"
        label.textColor = .cyan
        
        button.setTitle("버튼을 누르세요", for: .normal)
        button.backgroundColor = .systemIndigo

        // add subview를 통해 label과 button을 view에 추가
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(244)
        }

        // 버튼 액션 추가 (수정된 부분)
        button.addTarget(self, action: #selector(buttonDidTrap), for: .touchUpInside)
    }

    // 액션 메소드
    @objc
    private func buttonDidTrap() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red

        // 모달 방식으로 화면 전환 (수정된 부분)
        present(viewController, animated: true, completion: nil)
    }
}

