import UIKit

class HomeView: UIView {
    
    // MARK: - 상수 선언부
    let items: [String] = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    let leftPadding = [12,63,115, 196, 262,313]
    
    // MARK: - 컴포넌트 선언부
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
    
    // 상단 스택뷰 ( searchBar + alertButton )
    lazy var topStackView = UIStackView().then { stackView in
        stackView.axis = .horizontal
        stackView.spacing = 15
    }
    
    // 카테고리 컨트롤
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
        
        // Value changed action 추가
        control.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    /// 카테고리 밑에 밑줄 효과 넣어줄 View
    /// segmentedControl Change 마다 underline Width() 호출
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
    
    // 뷰에 컴포넌트 추가
    private func setupViews() {
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(alertButton)
        
        self.addSubview(topStackView)
        self.addSubview(categoryControl)
        self.addSubview(underline)
        self.addSubview(advertiseImageView)
        self.addSubview(categoryCollectionView)
        self.addSubview(divideLine)
    }
    
    // 오토레이아웃 적용
    private func setConstraints() {
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
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
            make.bottom.equalToSuperview().offset(-74)
            make.top.equalTo(advertiseImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-138)
        }
        divideLine.snp.makeConstraints { make in
            make.width.left.equalToSuperview()
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
        
    }
    
    // 세그먼트 변경 시 underline의 width, postion 수정
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        underline.snp.remakeConstraints{ make in
            
            make.width.equalTo(underlineWidth())
            make.top.equalTo(categoryControl.snp.bottom).offset(2)
            make.left.equalTo(categoryControl).offset(leftPadding[categoryControl.selectedSegmentIndex])
            make.height.equalTo(2)
        }
    }

    // underline selectedSegmentIndex의 글자수에 따라 길이 계산해서 반환
    private func underlineWidth() -> Double {
        let selectedIndex = categoryControl.selectedSegmentIndex
        let selectedTitle = items[selectedIndex]
        
        // 16 포인트의 폰트로 텍스트 크기를 계산
        let font = UIFont.systemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let underlineWidth = (selectedTitle as NSString).size(withAttributes: attributes).width
        
        print(underlineWidth)
        
        return underlineWidth
    }

}
