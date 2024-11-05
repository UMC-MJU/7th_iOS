

import UIKit

class HomeVC: UIViewController {
    
    let data = DummyCategory.data

    
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
    }


}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(DummyCategory.data.count)
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.identifier,
            for: indexPath) as? CategoryCell
        else {
            print("failed to create")
            return UICollectionViewCell()
        }
        print("created cell")
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
}
