
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
        appearance()
    }
    
    // 탭바 아이템 설정 - 홈 / 스타일 / 쇼핑 / 즐겨찾기 / 마이페이지
    private func setTabBarItems(){
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home.pdf"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Style.pdf"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop.pdf"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Saved.pdf"), tag: 4)
        myPageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "My.pdf"), tag: 5)
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
        
    }
    
    /// 클릭 시, 검은색으로 칠해지도록 Aprrearance 조정 함수
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
           
}
