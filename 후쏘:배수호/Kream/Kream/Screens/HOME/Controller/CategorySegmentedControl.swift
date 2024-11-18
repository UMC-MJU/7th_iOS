

import UIKit

class CategorySegmentedControl: UISegmentedControl {
    
    // 선택 시 보일 검은색 막대
    let selectedIndicator = UIView()
    
    //MARK: - Init
    init(items: [String]) {
        super.init(items: items)
        configureSegmentedControl()
        selectedSegmentIndicator()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup Function
    
    private func configureSegmentedControl() {
        backgroundColor = .clear
        selectedSegmentTintColor = .clear
        apportionsSegmentWidthsByContent = true
         
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setBackgroundImage(clearImage, for: .highlighted, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
 
        /* 세그먼트 선택되었을 때 폰트 값 */
        let selectedAttributes = makeAttributes(color: UIColor.black, weight: .bold)
        
        /* 세그먼트 선택되지 않은 상태 폰트 값*/
        let normalAttributes = makeAttributes(color: UIColor.darkGray, weight: .regular)
        
        /* 세그먼트 선택되었을 때 폰트 설정 */
        setTitleTextAttributes(selectedAttributes, for: .selected)
        
        /* 세그먼트 기본 상태 폰트 설정 */
        setTitleTextAttributes(normalAttributes, for: .normal)
        
        // segmentedControl 클릭 이벤트 설정
        addTarget(self, action: #selector(segmentChange), for: .valueChanged)

    }
    
    // MARK: - MakeFunction
    
    /// 세그먼트 글자 커스텀 지정
    /// - Parameter weight: 굵기 조정
    /// - Returns: 지정된 폰트 스타일 반환
    private func makeAttributes(color: UIColor, weight: UIFont.Weight) -> [NSAttributedString.Key: Any] {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = color
        value[.font] = UIFont.systemFont(ofSize: 16, weight: weight)
        return value
    }
    
}


// MARK: - SegmentExtention
extension CategorySegmentedControl {
  
    private func selectedSegmentIndicator() {
        selectedIndicator.backgroundColor = .black
        selectedSegmentIndex = 0
        addSubview(selectedIndicator)
        /* 처음 보여줄때는 애니메이션을 보여줄 필요가 없기 때문에 animated를 false로 */
        updateIndicatorPosition(animated: false)
    }
    
    
    /// 세그먼트 막대 포지션 이동 설정
    /// - Parameter animated: 애니메이션 유/무 설정
    private func updateIndicatorPosition(animated: Bool) {
        guard selectedSegmentIndex >= 0, selectedSegmentIndex < numberOfSegments else { return }
        
        // 선택된 세그먼트의 프레임 가져오기
        let selectedSegmentFrame = self.subviews[selectedSegmentIndex].frame
        
        // 선택된 세그먼트의 텍스트 길이 계산
        let indicatorWidth = calculateLabelWidth(for: selectedSegmentIndex)
        
        // 선택된 세그먼트 중앙에 맞춘 막대 위치 계산
        let indicatorPositionX = selectedSegmentFrame.origin.x + (selectedSegmentFrame.width - indicatorWidth) / 2
        
        let indicatorFrame = CGRect(
            x: indicatorPositionX,
            y: bounds.height - 2,
            width: indicatorWidth,
            height: 2
        )
        
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.selectedIndicator.frame = indicatorFrame
            }
        } else {
            self.selectedIndicator.frame = indicatorFrame
        }
    }

    /// 세그먼트 아이템의 길이를 계산하는 함수
    /// - Parameter index: 현재 선택된 세그먼트 버튼의 인덱스
    /// - Returns: 선택된 세그먼트 텍스트 사이즈 값 반환
    private func calculateLabelWidth(for index: Int) -> CGFloat {
        guard let title = titleForSegment(at: index) else {return 0}
        let attributes: [NSAttributedString.Key: Any] = [.font:UIFont.systemFont(ofSize: 16,weight: .bold)]
        let textSize = (title as NSString).size(withAttributes: attributes)
        return textSize.width
    }
    
    @objc private func segmentChange() {
        updateIndicatorPosition(animated: true)
    }
}
