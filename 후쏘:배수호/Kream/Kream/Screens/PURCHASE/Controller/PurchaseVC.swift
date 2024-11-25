
import UIKit

class PurchaseVC: UIViewController {

    let data = PurchaseData.purchaseData
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSelection()
        setNavigationBar()
        addTapGesture()
    }
    
    override func loadView() {
        self.view = purchaseView
    }

    // MARK: - Properties
    
    private lazy var purchaseView = PurchaseView().then { view in
        view.productOptionCollectionView.delegate = self
        view.productOptionCollectionView.dataSource = self
        
    }
    
    
    // MARK: - Function
    
    /// 왼쪽 상단 백버튼 생성
    private func setNavigationBar(){
        let image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(.gray)
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleBackButton))
        self.navigationItem.leftBarButtonItem = item
    }
    
    /// UIView타입인 구매 버튼에 액션 추가하는 함수
    private func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBuybutton))
        purchaseView.leftBuyBtn.addGestureRecognizer(tapGesture)
    }
    
    /// 상품의 다른 옵션을 클릭하면 이미지와 상품명 변경하는 함수
    /// - Parameter indexPath: 선택한 셀의 인덱스
    private func updateSelectedImage(for indexPath: IndexPath) {
        purchaseView.productImageView.image = UIImage(named: data[indexPath.item].imageView)
        purchaseView.productDescription.text = data[indexPath.item].productName
    }
    
    /// 뷰 로드 시 처음 보여줄 옵션
    private func setDefaultSelection() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        updateSelectedImage(for: firstIndexPath)
    }
    
    // MARK: - Action Function
    
    /// BackButton 클릭 이벤트
    @objc private func handleBackButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    /// 구매 버튼 클릭 이벤트
    @objc private func handleBuybutton(){
        let modalVC = SelectSizeVC()
        let image = purchaseView.productImageView.image ?? UIImage()
        let productName = purchaseView.productName.text ?? ""
        let productDescription = purchaseView.productDescription.text ?? ""
        modalVC.receiveData = ReceivePurchaseData(image: image, productName: productName, prodcutDescription: productDescription)
        let navigationVC = UINavigationController(rootViewController: modalVC)
        navigationVC.modalPresentationStyle = .pageSheet
        present(navigationVC, animated: true, completion: nil)
    }
}


    // MARK: - CollectionView Extension

extension PurchaseVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductOptionCell.identifier, for: indexPath) as? ProductOptionCell else { return UICollectionViewCell() }
        cell.configure(model: data[indexPath.row])
        return cell
    }
    
    /// 컬렉션 뷰 섹션 내부 여백 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    /// 컬렉션뷰 아이템 선택 시 호출
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateSelectedImage(for: indexPath)
    }
    
}
