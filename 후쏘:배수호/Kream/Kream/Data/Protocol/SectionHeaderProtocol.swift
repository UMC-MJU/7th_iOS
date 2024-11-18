
import UIKit

/// 셀의 헤더가 정의해야하는 컴포넌트 
protocol CellHeaderProtocol {
    var headerTitle: UILabel { get }
    var headerSubTitle: UILabel { get }
}
