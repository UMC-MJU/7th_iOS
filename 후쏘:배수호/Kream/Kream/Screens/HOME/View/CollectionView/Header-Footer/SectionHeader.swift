
import UIKit

/// 컬렉션 뷰의 섹션 구분선 footer
class SectionHeader: UICollectionReusableView, CellHeaderProtocol {
    
 
        
    static let identifier: String = "SectionHeader"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        headerTitle.text = nil
        headerSubTitle.text = nil
    }
    
    // MARK: - Properties
    
    /// 헤더의 메인 타이틀
    lazy var headerTitle: UILabel = makeLabel(font: .systemFont(ofSize: 16, weight: .semibold), .black)
    
    /// 헤더의 서브 타이틀
    lazy var headerSubTitle: UILabel = makeLabel(font:.systemFont(ofSize: 13, weight: .light), .lightGray)
    
    /// 헤더의 텍스트를 담는 스택뷰 ( 헤더 메인 + 헤더 서브 )
    private lazy var headerStackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
    }
    
    // MARK: - Function
    
    func makeLabel(font: UIFont, _ color: UIColor) -> UILabel{
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
    
    private func addComponents(){
        [headerTitle, headerSubTitle].forEach { self.headerStackView.addArrangedSubview($0) }
        self.addSubview(headerStackView)
    }
    
    private func setConstraints(){
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(200)
            make.height.equalTo(19)
        }
        
        headerSubTitle.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(19)
        }
    }
    
    public func configure(title: String, subTitle: String) {
        self.headerTitle.text = title
        self.headerSubTitle.text = subTitle
    }

    
}
