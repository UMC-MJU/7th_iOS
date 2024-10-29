//
//  DiceCell.swift
//  DiceTableView
//
//  Created by 배수호 on 10/28/24.
//

import UIKit
import SnapKit

class DiceCell: UITableViewCell {

    static let identifier = "DiceCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.diceImageView.image = nil
        self.diceName.text = nil
    }
    
    // MARK: 컴포넌트
    
    private lazy var diceImageView: UIImageView = {
        let imageView = UIImageView()
        // 이미지 값은 VC에서 설정
        return imageView
    }()
    
    private lazy var diceName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        // 주사위 이름 값은 VC에서 설정
        return label
    }()
    
    private func setViews(){
        self.addSubview(diceImageView)
        self.addSubview(diceName)
    }
    
    private func setConstraints(){
        diceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.left.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(75)
        }
        
        diceName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36.5)
            make.left.equalTo(diceImageView.snp.right).offset(87)
            make.right.equalToSuperview().offset(-144)
        }
    }
    
    public func configure(model: DiceModel){
        self.diceImageView.image = UIImage(named: model.diceImage)
        self.diceName.text = model.diceName
    }

  
}
