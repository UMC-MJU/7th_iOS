//
//  ViewController.swift
//  DiceTableView
//
//  Created by 배수호 on 10/28/24.
//

import UIKit

class DiceVC: UIViewController {

    let data = DummyDiceModel.diceDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = diceView
    }

    lazy var diceView: DiceView = {
        let view = DiceView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()

}

extension DiceVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiceCell.identifier, for: indexPath) as? DiceCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
}
