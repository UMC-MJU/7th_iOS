//
//  SavedView.swift
//  week2
//
//  Created by 손현빈 on 11/3/24.
//
import UIKit

class SavedView: UITableViewCell {
    //사진 들어갈 공간
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    // 타이틀
    let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.numberOfLines = 1
            return label
        }()
    // 작은 설명
    let descriptionLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 12)
         label.textColor = .gray
         label.numberOfLines = 2
         return label
     }()
    //가격 적기
    let priceLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.boldSystemFont(ofSize: 14)
          label.textColor = .black
          label.textAlignment = .right
          return label
      }()
    /// 북마크
    let bookmarkButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "bookmark"), for: .normal)
            return button
        }()
    //초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupUI()
       }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    private func setupUI(){
        //셀에 요소들 추가하기
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(bookmarkButton)
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
                priceLabel.translatesAutoresizingMaskIntoConstraints = false
                bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        //레이아웃 설정
        NSLayoutConstraint.activate([
                   // 이미지뷰 위치와 크기 설정
                   productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                   productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                   productImageView.widthAnchor.constraint(equalToConstant: 60),
                   productImageView.heightAnchor.constraint(equalToConstant: 60),

                   // 타이틀 레이블 위치 설정
                   titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                   titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
                   titleLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -8),

                   // 설명 레이블 위치 설정
                   descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                   descriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
                   descriptionLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -8),

                   // 가격 레이블 위치 설정
                   priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                   priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
                   priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                   // 북마크 버튼 위치와 크기 설정
                   bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                   bookmarkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                   bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
                   bookmarkButton.heightAnchor.constraint(equalToConstant: 24)
               ])
        
    }
}

