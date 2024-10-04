//
//  BaseViewController.swift
//  week2
//
//  Created by 손현빈 on 10/3/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    
    // 탭바 모델 창들 어디어디 구현될지
    private let home = HomeViewController()
    private let style = StyleViewController()
    private let shop = ShopViewController()
    private let my = MyViewController()
    
    // NavigationViewController를 rootview로 하는 navigationVC객체를 생성해
    //navigation 방식을 사용할 수 있다.
    private let navigationVC =  UINavigationController (rootViewController :NavigationViewController() )
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title : "modalvc", image : UIImage(systemName: "apple.terminal"), tag : 0)
        navigationVC.tabBarItem = UITabBarItem(title : "navigationvc", image : UIImage(systemName: "person.crop.circle"), tag : 5)
        home.tabBarItem = UITabBarItem(title : "HOME", image : UIImage(systemName: "star"), tag : 1)
        style.tabBarItem = UITabBarItem(title : "STYLE", image : UIImage(systemName : "house"), tag : 2)
        shop.tabBarItem = UITabBarItem(title : "SHOP", image : UIImage (systemName : "cart"), tag : 3)
        my.tabBarItem = UITabBarItem(title : "MY", image : UIImage (systemName : "person.crop.circle"), tag : 4)
        
        
        
        
        self.viewControllers = [home,style,shop , my]
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
