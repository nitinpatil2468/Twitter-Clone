//
//  ViewController.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 24/12/20.
//

import UIKit

class MainTabController: UITabBarController {

    // Mark: - Properties
    let actionButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = .white
        btn.backgroundColor = .twitterBlue
        btn.setImage(UIImage(named: "new_tweet"), for: .normal)
        btn.addTarget(self, action: #selector(actionButtontapped), for: .touchUpInside)
        return btn
    }()
    
    
    
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        configureViewControllers()
        configureUI()
    }
    
    
    // Mark: - Helpers
    
    func configureUI(){
        
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }

    func configureViewControllers(){
        
        let feed = templateNavigationConroller(image: UIImage(named:"home_unselected"), rootViewController: FeedController())
        let explore = templateNavigationConroller(image: UIImage(named:"search_unselected"), rootViewController: ExploreController())
        let notifications = templateNavigationConroller(image: UIImage(named:"like_unselected"), rootViewController: NotificationController())
        let conversations = templateNavigationConroller(image: UIImage(named:"like_unselected"), rootViewController: ConversationController())
        viewControllers = [feed,explore,notifications,conversations]
    }
    
    func templateNavigationConroller(image:UIImage?,rootViewController:UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .black
        return nav
        
    }
    
    @objc func actionButtontapped(){
        
        print("123")
        
        
    }

}

