

import UIKit

class SavedVC: UIViewController {
    
    let data = DummyProductInfo.productDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView    }
    
    lazy var savedView: SavedView = {
        let view = SavedView()
        view.numberOfCells.text = "전체 \(data.count)개"
        view.productTableView.dataSource = self
        view.productTableView.delegate = self
        return view
    }()
}

extension SavedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        cell.configure(model: data[indexPath.row])
        return cell
    }
    

}

