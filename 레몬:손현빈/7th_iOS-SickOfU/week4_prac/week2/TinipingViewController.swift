//
//  TinipingViewController.swift
//  week2
//
//  Created by 손현빈 on 11/6/24.
//

import UIKit
import SnapKit
import Then
class TinipingViewController: UIViewController {
    private let rootView = TinipingView()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view = TinipingView()
        }
    private func setupAction(){
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged),
            for: .valueChanged
        )
    }
    @objc
    private func segmentedControlValueChanged(){
        // segment 인덱스 따라
    }
    private func setupDelegate (){
        rootView.tinipingCollectionView.dataSource = self
    }
    
    
   
}

extension TinipingViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section : Int ) -> Int{
        return Tinipingmodel.dummy().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath : IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TinipingCollectionViewCell.identifier,
                                                            for: indexPath
                                                            )
                as? TinipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = Tinipingmodel.dummy()
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        return cell
        }
    }

