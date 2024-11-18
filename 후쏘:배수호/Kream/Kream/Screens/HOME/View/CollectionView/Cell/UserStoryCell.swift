import UIKit

class UserStoryCell: BaseCollectionCell {
    
    static let identifier = "UserStoryCell"

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageViewCorner(cornerRadius: 10)
        changeLabelColor()
        addComponents()
        setConstraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        subTitleText.text = nil
    }
    
    // MARK: - Function
    
    /// user ID textColor 를 흰색으로 변경
    private func changeLabelColor(){
        subTitleText.textColor = .white
    }
    
    private func addComponents(){
        [imageView, subTitleText].forEach { view in
            self.addSubview(view)
        }
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        subTitleText.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(11)
            make.bottom.equalToSuperview().offset(-10)
            make.width.greaterThanOrEqualTo(60)
            make.height.equalTo(14)
        }
    }
    
    override func configure(model: any RequiredCellProtocol) {
        guard let userStoryModel = model as? UserStoryModel else { return }
        
        imageView.image = UIImage(named: userStoryModel.imageView)
        subTitleText.text = userStoryModel.userName
    }
 
}
