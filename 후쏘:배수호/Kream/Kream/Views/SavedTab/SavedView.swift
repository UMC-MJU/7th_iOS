import UIKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    lazy var numberOfCells: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var productTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    private func setViews() {
        self.addSubview(title)
        self.addSubview(numberOfCells)
        self.addSubview(productTableView)
    }
    
    private func setConstraints() {
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(61)
            make.left.equalToSuperview().offset(10)
        }

        numberOfCells.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(122)
            make.left.equalToSuperview().offset(13)
        }

        productTableView.snp.makeConstraints { make in
            make.top.equalTo(numberOfCells.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    
    
    
}
