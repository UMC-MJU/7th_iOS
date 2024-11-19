import UIKit

class SavedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    let savedItems: [(image: String, title: String, description: String, price: String)] = [
        ("image1", "손오공이 잃어버린 머리띠 반쪽", "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사 속 물건", "942,192,000원"),
        ("image2", "골드 반지", "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건. ㅓ때요??", "12,000원"),
        ("image3", "하얀 신발", "짝퉁 나이키 신발 ㅜ", "90,000원"),
        ("image4", "에베레스트 다이아 반지", "개비쌈", "1,292,999,000원"),
        ("image5", "아디다스다 신발", "아디다스아님", "120,000원"),
        ("image6", "황제 잠옷", "어느 황제가 크리스마스날 입었다는 그. 잠옷", "120,000,000원")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // 테이블 뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SavedView.self, forCellReuseIdentifier: "SavedView") // 식별자 일치
        view.addSubview(tableView)
        
        // 오토레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // UITableViewDataSource 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedView", for: indexPath) as? SavedView else {
            return UITableViewCell()
        }

        let item = savedItems[indexPath.row]
        cell.productImageView.image = UIImage(named: item.image) // 이미지 설정
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = item.price
        cell.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)

        return cell
    }

    // UITableViewDelegate 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // 셀 높이 설정
    }
}

