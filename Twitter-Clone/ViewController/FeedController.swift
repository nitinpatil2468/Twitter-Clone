//
//  FeedController.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 24/12/20.
//

import UIKit

class FeedController: UIViewController {
    
    // Mark: - Properties
    
    
    
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()    }
    
    
    // Mark: - Helpers
    func configureUI(){
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let imgView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imgView.contentMode = .scaleAspectFit
        navigationItem.titleView = imgView
    }



}
