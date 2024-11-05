import UIKit
import SnapKit

class HomeView: UIView {

    // MARK: - 상수 선언부
    let items: [String] = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    let leftPadding = [12, 63, 115, 196, 262, 313]

    // MARK: - 컴포넌트 선언부
    // First Section
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var searchBar = UITextField().then { textField in
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
        textField.textColor = .black
        textField.backgroundColor = UIColor(named: "SearchBarColor")
        textField.font = UIFont.systemFont(ofSize: 13.5)
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
    }

    lazy var alertButton = UIButton().then { button in
        button.setImage(UIImage(named: "Alert_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
    }

    lazy var topStackView = UIStackView().then { stackView in
        stackView.axis = .horizontal
        stackView.spacing = 15
    }

    lazy var categoryControl = UISegmentedControl(items: items).then { control in
        control.apportionsSegmentWidthsByContent = true
        control.selectedSegmentIndex = 0
        
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        control.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        control.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ], for: .normal)
        control.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .selected)
        
        control.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }

    lazy var underline = UIView().then { view in
        view.backgroundColor = .black
    }

    lazy var advertiseImageView = UIImageView().then { imageView in
        imageView.image = UIImage(named: "Advertise_image")
        imageView.contentMode = .scaleAspectFill
    }

    lazy var categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.estimatedItemSize = .init(width: 61, height: 81)
        layout.minimumInteritemSpacing = 9
        layout.minimumLineSpacing = 20
    })).then { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }

    lazy var divideLine = UIView().then { view in
        view.backgroundColor = UIColor(named: "DivideLineColor")
    }
    
    lazy var title1 = UILabel().then{ label in
        label.text = "Just Dropped"
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        label.textColor = .black
    }
    
    lazy var subTitle1 = UILabel().then { label in
        label.text = "발매 상품"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(named: "SubTitleColor")
    }
    
    lazy var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.estimatedItemSize = .init(width: 142, height: 237)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
    })).then { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.register(NewProductCell.self, forCellWithReuseIdentifier: NewProductCell.identifier)
    }
        

    // MARK: init, 함수 선언부
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topStackView)
        contentView.addSubview(categoryControl)
        contentView.addSubview(underline)
        contentView.addSubview(advertiseImageView)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(divideLine)
        contentView.addSubview(title1)
        contentView.addSubview(subTitle1)
        contentView.addSubview(newProductCollectionView)
        
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(alertButton)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        alertButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }

        categoryControl.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(27)
        }

        underline.snp.makeConstraints { make in
            make.top.equalTo(categoryControl.snp.bottom).offset(2)
            make.left.equalTo(categoryControl).offset(leftPadding[0])
            make.width.equalTo(27.68)
            make.height.equalTo(2)
        }

        advertiseImageView.snp.makeConstraints { make in
            make.top.equalTo(underline.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(advertiseImageView.snp.width).multipliedBy(0.9)
        }

        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertiseImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(182) // height 지정 필요
        }

        divideLine.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        title1.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        subTitle1.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        newProductCollectionView.snp.makeConstraints { make in
            make.top.equalTo(subTitle1.snp.bottom).offset(14)
            make.left.right.equalToSuperview().offset(16)
            make.height.equalTo(237)
            make.bottom.equalToSuperview().offset(-20)
        }
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        underline.snp.remakeConstraints { make in
            make.width.equalTo(underlineWidth())
            make.top.equalTo(categoryControl.snp.bottom).offset(2)
            make.left.equalTo(categoryControl).offset(leftPadding[categoryControl.selectedSegmentIndex])
            make.height.equalTo(2)
        }
    }

    private func underlineWidth() -> Double {
        let selectedIndex = categoryControl.selectedSegmentIndex
        let selectedTitle = items[selectedIndex]
        
        let font = UIFont.systemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let underlineWidth = (selectedTitle as NSString).size(withAttributes: attributes).width
        return underlineWidth
    }
}
