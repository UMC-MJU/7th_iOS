

import UIKit

class TeeniepingView: UIView {
    
    lazy var segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then { UISegmentedControl in
     
        UISegmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        UISegmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        UISegmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

        UISegmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16,weight: .light)
            ]
            , for: .normal)
        UISegmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16,weight: .bold)
            ]
            , for: .selected)
        
        UISegmentedControl.selectedSegmentIndex = 0  // 기본 선택 설정
    }
    
    lazy var teeniepingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.estimatedItemSize = .init(width: 162, height: 144)
        layout.minimumInteritemSpacing = 12
    })).then { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(TeeniepingCell.self, forCellWithReuseIdentifier: TeeniepingCell.identifier)
    }
    
    private lazy var divideLine = UIView().then{
        $0.backgroundColor = .black
    }
    
    private lazy var emptyLabel = UILabel().then { UILabel in
        UILabel.font = .systemFont(ofSize: 24, weight: .medium)
        UILabel.textColor = .black
        UILabel.text = "휑~"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
        [
            segmentedControl,
            teeniepingCollectionView,
            divideLine,
            emptyLabel
        ].forEach { view in
            addSubview(view)
        }
    }
    
    private func setConstraints(){
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(19) // 높이 안 주면 안보인다는 사아실
        }
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        teeniepingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().offset(-74)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(301)
            make.centerX.equalToSuperview()
        }
        
    }

}
