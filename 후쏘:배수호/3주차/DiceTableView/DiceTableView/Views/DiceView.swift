//
//  DiceView.swift
//  DiceTableView
//
//  Created by 배수호 on 10/28/24.
//

import UIKit

class DiceView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "주사위 테이블 뷰 만들기"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(DiceCell.self, forCellReuseIdentifier: DiceCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private func setViews(){
        self.addSubview(title)
        self.addSubview(tableView)
    }
    
    private func setConstraints(){
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-183)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(14)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}
