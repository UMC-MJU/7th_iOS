
import UIKit

class SizeOptionCell: UICollectionViewCell {
   
    static let identifier = "SizeOptionCell"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setBorder()
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    

    /// 사이즈 크기 레이블
    private lazy var sizeLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 14, weight: .regular), color: .black)
    
    /// 가격 레이블
    private lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .regular), color: .red)
    
    // MARK: - Make Function
    
    /// 레이블 생성 함수
    private func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
    
    // MARK: - Function
    
    private func setBorder(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(named: "SeparateFooterColor")?.cgColor
        self.layer.borderWidth = 1
    }
    
    /// 컴포넌트 추가
    private func addComponents() {
        [sizeLabel, priceLabel].forEach{ self.addSubview($0) }
    }
    
    /// 오토레이아웃 지정
    private func setConstraints() {
        sizeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(9)
            make.height.equalTo(17)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(1)
            make.centerX.equalTo(sizeLabel.snp.centerX)
            make.width.greaterThanOrEqualTo(9)
            make.height.equalTo(17)
        }
    }
    
    public func configure(model: SizeModel) {
        self.sizeLabel.text = model.size
        self.priceLabel.text = model.price
    }
    
}

extension SizeOptionCell {
    func updateBorderColor(to color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
}
