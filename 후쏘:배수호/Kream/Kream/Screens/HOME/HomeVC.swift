

import UIKit

class HomeVC: UIViewController {
    
    lazy var homeView = {
        let view = HomeView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setDelegate()
        
    }
    
    private func setDelegate(){
        homeView.categoryCollectionView.dataSource = self
        homeView.newProductCollectionView.dataSource = self
    }


}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.categoryCollectionView {
            return DummyCategory.data.count
        }
        else if collectionView == homeView.newProductCollectionView {
            return DummyNewProduct.data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath) as? CategoryCell
            else {
                print("failed to create")
                return UICollectionViewCell()
            }
            print("created cell")
            let data = DummyCategory.data
            
            cell.configure(model: data[indexPath.row])
            
            return cell
        }
        else if collectionView == homeView.newProductCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewProductCell.identifier,
                for: indexPath) as? NewProductCell
            else {
                print("failed to create")
                return UICollectionViewCell()
            }
            print("created cell")
            let data = DummyNewProduct.data
            
            cell.configure(model: data[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
}
    

