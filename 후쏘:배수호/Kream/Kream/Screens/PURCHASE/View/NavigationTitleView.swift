

import UIKit

class NavigationTitleView: UIView {

    // MARK: - init
    
    init(frame: CGRect, titleText: String, subTitleText: String?) {
        super.init(frame: frame)
        setText(titleText: titleText, subTitleText: subTitleText)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    
    /// 네비게이션바 타이틀 텍스트
    private lazy var titleLabel = makeLabel(font: UIFont.systemFont(ofSize: 15, weight: .bold), color: .black)
    
    /// 네비게이션바 서브 타이틀 텍스트
    private lazy var subTitleLabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), color: .gray)
   
    
    /// 타이틀 + 서브 타이틀 스택뷰
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Make Function
    
    /// 레이블 생성 함수
    private func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
    
    //MARK: - Function
    
    // 생성 시 레이블 텍스트를 채우는 함수
    private func setText(titleText: String, subTitleText: String? ){
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText ?? nil
    }
    
    /// 제약 조건 설정
    private func setConstraints() {
        self.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
}
