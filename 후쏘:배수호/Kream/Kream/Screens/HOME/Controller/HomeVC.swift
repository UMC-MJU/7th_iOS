

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
    }
    
    private lazy var homeView = HomeView().then { homeView in
        homeView.backgroundColor = .white
        homeView.homeCollectionView.delegate = self
        homeView.homeCollectionView.dataSource = self
    }
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return HomeCellModel.bannerData.count
        case 1:
            return HomeCellModel.CategoryData.count
        case 2:
            return HomeCellModel.JustDroppedData.count
        case 3:
            return HomeCellModel.UserStoryData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvBannerCell.identifier, for: indexPath) as? AdvBannerCell else { return UICollectionViewCell()}
            let data = HomeCellModel.bannerData
            cell.configure(model: data[indexPath.row])
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell()}
            let data = HomeCellModel.CategoryData
            cell.configure(model: data[indexPath.row])
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCell.identifier, for: indexPath) as? JustDroppedCell else { return UICollectionViewCell()}
            let data = HomeCellModel.JustDroppedData
            cell.configure(model: data[indexPath.row])
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserStoryCell.identifier, for: indexPath) as? UserStoryCell else { return UICollectionViewCell()}
            let data = HomeCellModel.UserStoryData
            cell.configure(model: data[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
            
        }
    }
    
}
 
/// header, footer 추가
extension HomeVC {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        /* footer */
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SeparateFooter.identifier, for: indexPath) as! SeparateFooter
            return footer
            
        /* header */
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            /* Section Title Set */
            if indexPath.section == 2 {
                header.configure(title: "Just Dropped", subTitle: "발매 상품")
            }
            else if indexPath.section == 3 {
                header.configure(title: "본격 한파대비! 연말 필수템 모음", subTitle:"#해피홀릭룩챌린지")
            }
            
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 || section == 3 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        } else {
            return CGSize.zero
        }
    }
    
}
