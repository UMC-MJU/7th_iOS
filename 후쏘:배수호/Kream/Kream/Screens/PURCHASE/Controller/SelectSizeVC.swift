
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
    // 현재 선택된 셀의 IndexPath를 저장
    var selectedIndexPath: IndexPath?
    
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
        view.sizeOptionCollectionView.delegate = self
        view.sizeOptionCollectionView.dataSource = self
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

// MARK: - 컬렉션뷰 Extension

extension SelectSizeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeOptionCell.identifier, for: indexPath) as? SizeOptionCell else { return UICollectionViewCell() }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 47)
    }
    
    /// 셀 내부 여백 처리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 이전 선택된 셀이 있다면 기본 상태로 복원
        if let previousIndexPath = selectedIndexPath,
           let previousCell = collectionView.cellForItem(at: previousIndexPath) as? SizeOptionCell {
            previousCell.updateBorderColor(to: UIColor(named: "SeparateFooterColor") ?? .separateFooter) // 기본 색으로 복원
        }
        
        // 현재 선택된 셀의 테두리 색 변경
        if let currentCell = collectionView.cellForItem(at: indexPath) as? SizeOptionCell {
            currentCell.updateBorderColor(to: .black) // 검정색으로 변경
        }
        
        // 현재 선택된 IndexPath 저장
        selectedIndexPath = indexPath
    }
    
}
