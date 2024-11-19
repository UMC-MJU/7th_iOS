import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // HomeView 인스턴스 생성
    lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()

    // 더미 데이터 배열 정의
    let categoryData: [(image: String, name: String)] = [
        ("Category_image1", "크림 드로우"),
        ("Category_image2", "실시간 차트"),
        ("Category_image3", "남성 추천"),
        ("Category_image4", "여성 추천"),
        ("Category_image5", "색다른 추천"),
        ("Category_image6", "정가 아래"),
        ("Category_image7", "윤세 24AW"),
        ("Category_image8", "올해의 베스트"),
        ("Category_image9", "10월 베네핏"),
        ("Category_image10", "아크네 선물")
    ]

    let newProductData: [(image: String, brand: String, name: String, nowPrice: String)] = [
        ("NewProduct_image1", "MBL", "청키라이너 뉴욕양키스", "139,000원"),
        ("NewProduct_image2", "Jordan", "Jordan 1 Retro High OG Yellow Ochre", "228,000원"),
        ("NewProduct_image3", "HUMAN MADE", "휴먼 메이드", "139,000원"),
        ("NewProduct_image4", "LEBRON", "역시릅신", "449,440원"),
        ("NewProduct_image5", "Jordan high fly", "luka doncici", "222,222원")
    ]

    let bottomData: [String] = [
        "bottom_image1",
        "bottom_image2",
        "bottom_image3",
        "bottom_image4",
        "bottom_image5"
    ]

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        registerCells()
        setupCollectionViewDataSources()
    }

    // 셀 클래스 등록 메서드
    private func registerCells() {
        homeView.TopCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        homeView.newProductCollectionView.register(NewProductCell.self, forCellWithReuseIdentifier: NewProductCell.identifier)
        homeView.bottomCollectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.identifier)
    }

    // 컬렉션 뷰의 데이터 소스 및 델리게이트 설정 메서드
    private func setupCollectionViewDataSources() {
        homeView.TopCollectionView.dataSource = self
        homeView.newProductCollectionView.dataSource = self
        homeView.bottomCollectionView.dataSource = self

        homeView.TopCollectionView.delegate = self
        homeView.newProductCollectionView.delegate = self
        homeView.bottomCollectionView.delegate = self
    }
}

//  - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.TopCollectionView {
            return categoryData.count
        } else if collectionView == homeView.newProductCollectionView {
            return newProductData.count
        } else if collectionView == homeView.bottomCollectionView {
            return bottomData.count
        }
        return 0
    }
//error
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.TopCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath) as? CategoryCell else {
                   
                    return UICollectionViewCell()
            }
            let data = categoryData[indexPath.row]
            cell.configure(imageName: data.image, name: data.name)
            return cell
        } else if collectionView == homeView.newProductCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewProductCell.identifier,
                for: indexPath) as? NewProductCell else {
                 
                    return UICollectionViewCell()
            }
            let data = newProductData[indexPath.row]
            cell.configure(imageName: data.image, brand: data.brand, productName: data.name, price: data.nowPrice)
            return cell
        } else if collectionView == homeView.bottomCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BottomCell.identifier,
                for: indexPath) as? BottomCell else {
                    
                    return UICollectionViewCell()
            }
            let data = bottomData[indexPath.row]
            cell.configure(imageName: data)
            return cell
        }
        return UICollectionViewCell()
    }
}


class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"

    var categoryImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
    }

    var categoryNameLabel = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 12)
        make.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryImageView)
        addSubview(categoryNameLabel)
        categoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(61)
        }
        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryImageView.snp.bottom).offset(4)
            make.centerX.equalTo(categoryImageView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String, name: String) {
        categoryImageView.image = UIImage(named: imageName)
        categoryNameLabel.text = name
    }
}


class NewProductCell: UICollectionViewCell {
    static let identifier = "NewProductCell"

    var NewproductImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
    }

    var brandName = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        make.textColor = .black
    }

    lazy var productname = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 14, weight: .light)
        make.textColor = .black
        make.numberOfLines = 2
    }

    lazy var price = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        make.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(NewproductImageView)
        addSubview(brandName)
        addSubview(productname)
        addSubview(price)

        NewproductImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(142)
        }

        brandName.snp.makeConstraints { make in
            make.top.equalTo(NewproductImageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(4)
        }

        productname.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(4)
            make.width.equalTo(124)
        }

        price.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(43)
            make.left.equalToSuperview().offset(4)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String, brand: String, productName: String, price: String) {
        NewproductImageView.image = UIImage(named: imageName)
        brandName.text = brand
        productname.text = productName
        self.price.text = price
    }
}


class BottomCell: UICollectionViewCell {
    static let identifier = "BottomCell"

    var bottomImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bottomImageView)

        bottomImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//configure이 있어야 딴데서도 쓰기 ㄱ
    func configure(imageName: String) {
        bottomImageView.image = UIImage(named: imageName)
    }
}

