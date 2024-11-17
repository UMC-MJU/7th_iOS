import UIKit
import SnapKit

class HomeView: UIView {

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
    // 서치바로 구현해야함 서치바 뷰컨트롤러로 담아놓고 헤더뷰 놓기
    
    lazy var searchBar = UITextField().then { make in
            make.placeholder = "브랜드, 상품, 프로필, 태그 등"
            make.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
            make.textColor = .black
            make.backgroundColor = UIColor(named: "SearchBarColor")
            make.font = UIFont.systemFont(ofSize: 13.5)
            make.layer.cornerRadius = 12
            make.layer.masksToBounds = true
        }
    lazy var alertButton = UIButton().then { button in
            button.setImage(UIImage(named: "Alert_icon"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFill
        }
    lazy var topStackView = UIStackView().then { make in
        make.axis = .horizontal
        make.spacing = 15
        make.distribution = .fill // 모든 서브뷰가 고르게 분포되도록 설정
        make.alignment = .center
        }
    lazy var underline = UIView().then { make in
            make.backgroundColor = .black
        }
    
    let items: [String] = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
     //상단 카테고리 부분
    lazy var category = UISegmentedControl(items: items).then { make in
        make.apportionsSegmentWidthsByContent = true
        make.selectedSegmentIndex = 0
        
        make.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        make.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        make.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        make.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        make.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ], for: .normal)
        make.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .selected)
        
       
    }
        // 중간에 라지 이미지
    lazy var LargeImageView = UIImageView().then { make in
         make.image = UIImage(named: "Advertise_image")
        make.contentMode = .scaleAspectFill
     }
    lazy var TopCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
           make.estimatedItemSize = .init(width: 60, height: 80)
        make.minimumInteritemSpacing = 10
        make.minimumLineSpacing = 20
       })).then { make in
           make.backgroundColor = .clear
           make.isScrollEnabled = false
           make.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
       }
    
    lazy var JustDroppedLabel = UILabel().then{ make in
            make.text = "Just Dropped"
        make.textColor = .black
    
            make.font = UIFont.systemFont(ofSize: 15,weight: .bold)
           }
    
    lazy var subTitle1 = UILabel().then {make in
        make.text = "발매 상품"
        make.textColor = UIColor(named: "SubTitleColor")
        make.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    
    // 신제품 컬렉션 뷰 신제품
    lazy var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
        make.estimatedItemSize = .init(width: 142, height: 237)
        make.minimumInteritemSpacing = 8
        make.scrollDirection = .horizontal
      })).then { make in
          make.showsHorizontalScrollIndicator = false
          make.backgroundColor = .clear
          make.register(NewProductCell.self, forCellWithReuseIdentifier: NewProductCell.identifier)
      }
      
    lazy var winter = UILabel().then{ make in
        make.text = "본격 한파대비! 연말 필수템 모음"
        make.textColor = .black
        make.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        
       }
    lazy var happy = UILabel().then { make in
        make.text = "해피홀리룩챌린지"
        make.font = UIFont.systemFont(ofSize: 13, weight: .light)
        make.textColor = UIColor(named: "SubTitleColor")
       }
    // 바텀
    lazy var bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
        make.estimatedItemSize = .init(width: 124, height: 165)
        make.minimumInteritemSpacing = 8
        make.scrollDirection = .horizontal
       })).then { make in
           make.showsHorizontalScrollIndicator = false
           make.backgroundColor = .clear
           make.register(bottomCell.self, forCellWithReuseIdentifier: bottomCell.identifier)
       }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.backgroundColor = .white
           setupViews()
           setLayout()
       }
    class CategoryCell : UICollectionViewCell {
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
                       make.height.equalTo(61)
                       make.width.equalTo(61)
                   }
                   categoryNameLabel.snp.makeConstraints { make in
                       make.bottom.equalToSuperview()
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
    class NewProductCell : UICollectionViewCell {
        //꼭 static을 써서 클래스 모든 애들이 공유하는 단일변수 취급을 해야함 static 안쓰면 위에서 접근을 못함
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
        var subex = UILabel().then {make in
            make.font = UIFont.systemFont(ofSize: 13, weight: .light)
            make.textColor = .black
            make.text = "즉시 구매가"
        }
        override init(frame: CGRect) {
               super.init(frame: frame)
            
                 addSubview(NewproductImageView)
                 addSubview(brandName)
                 addSubview(productname)
                 addSubview(price)
                 addSubview(subex)
            
            // layout
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
                   subex.snp.makeConstraints { make in
                       make.top.equalTo(price.snp.bottom).offset(2)
                       make.left.equalToSuperview().offset(4)
                   }
           }
           
           required init?(coder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
           }
        // configure 메서드 추가
           func configure(imageName: String, brand: String, productName: String, price: String) {
               NewproductImageView.image = UIImage(named: imageName)
               brandName.text = brand
               productname.text = productName
               self.price.text = price
           }
    }
    class bottomCell : UICollectionViewCell {
       static let identifier = "bottomCell"
        var bottomimage = UIImageView().then{ make in
            make.contentMode = .scaleAspectFill
            
        }
        override init(frame: CGRect) {
               super.init(frame: frame)
            addSubview(bottomimage)
            bottomimage.snp.makeConstraints{ make in
                make.edges.equalToSuperview()
                make.height.equalTo(160)
                make.width.equalTo(120)

            }
           }
           
           required init?(coder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
           }
        func configure(imageName: String) {
              bottomimage.image = UIImage(named: imageName)
          }
    }
    
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    private func setupViews() {
           addSubview(scrollView)
           scrollView.addSubview(contentView)
           
           contentView.addSubview(topStackView)
           contentView.addSubview(category)
           contentView.addSubview(underline)
           contentView.addSubview(LargeImageView)
           contentView.addSubview(TopCollectionView)
        contentView.addSubview(JustDroppedLabel)
           contentView.addSubview(subTitle1)
           contentView.addSubview(newProductCollectionView)
        
           contentView.addSubview(winter)
           contentView.addSubview(happy)
           contentView.addSubview(bottomCollectionView)
           
           topStackView.addArrangedSubview(searchBar)
           topStackView.addArrangedSubview(alertButton)
       }
    // 위로 레이아웃 맞추기
    private func setLayout() {
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

            category.snp.makeConstraints { make in
                make.top.equalTo(topStackView.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(24)
                make.trailing.equalToSuperview().offset(-25)
                make.height.equalTo(27)
            }

        

            LargeImageView.snp.makeConstraints { make in
                make.top.equalTo(underline.snp.bottom)
                make.width.equalToSuperview()
                make.height.equalTo(LargeImageView.snp.width).multipliedBy(0.9)
            }

            TopCollectionView.snp.makeConstraints { make in
                make.top.equalTo(LargeImageView.snp.bottom).offset(20)
                make.leading.trailing.equalToSuperview().inset(16)
                make.height.equalTo(182) // height 지정 필요
            }

           
            
        JustDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(TopCollectionView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(16)
            }
            
            subTitle1.snp.makeConstraints { make in
                make.top.equalTo(JustDroppedLabel.snp.bottom).offset(4)
                make.leading.equalToSuperview().offset(16)
            }
            
            newProductCollectionView.snp.makeConstraints { make in
                make.top.equalTo(subTitle1.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(237)
            }
            
        
            
            winter.snp.makeConstraints { make in
                make.top.equalTo(newProductCollectionView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(16)
            }
            
            happy.snp.makeConstraints { make in
                make.top.equalTo(winter.snp.bottom).offset(4)
                make.leading.equalToSuperview().offset(16)
            }
            
            bottomCollectionView.snp.makeConstraints { make in
                make.top.equalTo(happy.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(165)
                make.bottom.equalToSuperview().offset(-100)
            }
            
        }
   
    
}

