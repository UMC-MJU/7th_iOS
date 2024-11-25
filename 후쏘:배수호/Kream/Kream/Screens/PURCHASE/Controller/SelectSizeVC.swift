
import UIKit


/// 사이즈 선택 화면에서 받아야 할 데이터 구조체
struct ReceivePurchaseData {
    let image: UIImage
    let productName: String
    let prodcutDescription: String
}

class SelectSizeVC: UIViewController {

    let data = SizeData.sizeData
    var receiveData: ReceivePurchaseData?
    
    // MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setValue()
    }

    override func loadView() {
        self.view = selectSizeView
    }
    
    
    // MARK: - Properties
    
    /// MARK: - 커스텀한 사이즈 선택 뷰
    private lazy var selectSizeView: SelectSizeView = {
        let view = SelectSizeView()
        return view
    }()
    
    // MARK: - Function
    
    /// 상단 " 구매하기 (가격 단위: 원) " 타이틀과 닫기 버튼이 들어 있는 네비게이션바 세팅
    private func setNavigationBar(){
        /* 타이블뷰 생성 */
        self.navigationItem.titleView = NavigationTitleView(frame: .zero, titleText: "구매하기", subTitleText: "가격 단위: 원")
        /* 오른쪽 닫기 버튼 생성 */
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped))
        closeButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    /// 이전 뷰에서 전달 받아온 데이터를 뷰에 적용
    private func setValue() {
        if let data = receiveData {
            selectSizeView.setValue(data: data)
        }
    }
    
    // MARK: - Action Function
    @objc func closeButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
    
        
    
}
