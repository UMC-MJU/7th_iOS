
import UIKit

/// 컬렉션 뷰의 섹션 구분선 footer
class SeparateFooter: UICollectionReusableView {
        
    static let identifier: String = "SeparateFooter"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 구분선
    lazy var separator = UIView().then { view in
        view.backgroundColor = UIColor(named: "SeparateFooterColor")
    }
    
    private func setView(){
        addSubview(separator)
        separator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    
}
