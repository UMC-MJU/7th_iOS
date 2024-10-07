

import UIKit

class EditProfileView: UIView {

    lazy var test: UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        addSubview(test)
        test.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
       
}
