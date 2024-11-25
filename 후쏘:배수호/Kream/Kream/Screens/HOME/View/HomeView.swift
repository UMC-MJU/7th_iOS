import UIKit
import SnapKit

class HomeView: UIView {

// MARK: - 컴포넌트 선언부

    /// 상단 헤더 뷰
    public lazy var homeHeaderView: HomeHeaderView = HomeHeaderView()
    
    public lazy var homeCollectionView: UICollectionView = {
        let layout = HomecollectionLayout.createCompositionalLayout()
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        /* Section Cell register  */
        collectionView.register(AdvBannerCell.self, forCellWithReuseIdentifier: AdvBannerCell.identifier)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.register(JustDroppedCell.self, forCellWithReuseIdentifier: JustDroppedCell.identifier)
        collectionView.register(UserStoryCell.self, forCellWithReuseIdentifier: UserStoryCell.identifier)
        
        /* Header, Footer Cell register */
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(SeparateFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SeparateFooter.identifier)
        
        collectionView.backgroundColor = .white
        
        
        return collectionView
    }()
    
    
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
        [homeHeaderView, homeCollectionView].forEach { self.addSubview($0) }
    }

    private func setConstraints() {
        homeHeaderView.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide)
        }
        homeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(homeHeaderView.snp.bottom)
            make.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }


}
