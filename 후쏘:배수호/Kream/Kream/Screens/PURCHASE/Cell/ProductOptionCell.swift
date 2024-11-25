
import UIKit

class ProductOptionCell: UICollectionViewCell {
   
    static let identifier = "ProductOptionCell"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    // MARK: - Properties
    
    private lazy var imageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Function
    
    private func setConstraints(){
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func configure(model: any RequiredCellProtocol) {
        guard let purchaseData = model as? PurchaseModel else { return }
        self.imageView.image = UIImage(named: purchaseData.imageView)
    }
    
}

