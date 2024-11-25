
import UIKit
import SnapKit

class BottomBackgroundView: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(topLine)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 상단 구분선
    private lazy var topLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    // MARK: - Function
    
    /// 제약 조건 설정
    private func setConstraints() {
        topLine.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
