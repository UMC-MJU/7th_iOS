import UIKit
import SnapKit

class HomeHeaderView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    public lazy var searchBar = UISearchBar().then { searchBar in
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .clear
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 12
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.leftView = nil
    }
    
    private lazy var alertButton = UIButton().then { button in
        button.setImage(UIImage(named: "Alert_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
    }
    
    /// 상단 세그먼트 컨트롤
    public lazy var segmentControl: CategorySegmentedControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentControl = CategorySegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()

    /// 컴포넌트 생성
    private func addComponents() {
        [searchBar, alertButton, segmentControl,bottomBorder].forEach { self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(alertButton.snp.left).offset(-15)
        }
        
        alertButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar.snp.centerY)
            make.right.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(27)
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(segmentControl.snp.bottom).offset(1)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
    }

}
