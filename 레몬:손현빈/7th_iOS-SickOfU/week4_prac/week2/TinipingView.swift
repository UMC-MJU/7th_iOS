//
//  TinipingView.swift
//  week2
//
//  Created by 손현빈 on 11/6/24.
//
import UIKit

class TinipingView : UIView{
    let segmentedControl = UISegmentedControl(items: ["Tiniping", " x tini"]).then{
        $0.setBackgroundImage(UIImage(),for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(),for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(),for: .highlighted, barMetrics:.default)
        $0.setDividerImage(UIImage(),forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font:UIFont.systemFont(ofSize:16, weight: .light)
                
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font:UIFont.systemFont(ofSize:16, weight: .bold)
            ],
            for:.selected 
        )
    }
    
    let tinipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(TinipingCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TinipingCollectionViewCell.self))
    }
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    private let emptyLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 24,weight: .medium)
        $0.textColor = .black
        $0.text = "No Tini"
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
        
    }
    private func setupUI() {
        [
            segmentedControl,
            tinipingCollectionView,
            divideLine,
            emptyLabel
        ].forEach{
            addSubview($0)
        }
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        divideLine.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(1)
            
        }
        tinipingCollectionView.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(74)
        }
        emptyLabel.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        }
    }
}
