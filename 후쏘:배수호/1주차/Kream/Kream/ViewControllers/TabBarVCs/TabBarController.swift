
import UIKit

class TabBarController: UITabBarController {

    private let homeVC = HomeVC()
    private let styleVC = StyleVC()
    private let shopVC = ShopVC()
    private let savedVC = SavedVC()
    private let myPageVC = UINavigationController(rootViewController: MyPageVC())
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
    }
    
    // 탭바 아이템 설정 - 홈 / 스타일 / 쇼핑 / 즐겨찾기 / 마이페이지
    private func setTabBarItems(){
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "Home_icon"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "Style_icon"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "Shop_icon"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "Saved_icon"), tag: 3)
        myPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "My_icon"), tag: 4)
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
        self.tabBar.unselectedItemTintColor = .black
    }

}
