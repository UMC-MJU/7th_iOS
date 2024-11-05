//
//  ViewController.swift
//  TeenipingCollectionView
//
//  Created by 배수호 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class TeeniepingVC: UIViewController {

    
    let data = DummyTeenieping.data
    
    lazy var teeniepingView:TeeniepingView = {
        let view = TeeniepingView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = teeniepingView
        
        setupAction()
        setDelegate()
        
    }
    
    
    private func setDelegate(){
        teeniepingView.teeniepingCollectionView.dataSource = self
    }
    
    private func setupAction(){
        teeniepingView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(control:)), for: .valueChanged)
    }

    @objc
    private func segmentedControlValueChanged(control: UISegmentedControl){
        
    }
    

}

extension TeeniepingVC: UICollectionViewDataSource{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(DummyTeenieping.data.count)
        return data.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeeniepingCell.identifier,
            for: indexPath) as? TeeniepingCell
        else {
            print("failed to create")
            return UICollectionViewCell()
        }
        print("created cell")
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
}
