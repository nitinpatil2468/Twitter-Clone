//
//  NotificationController.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 24/12/20.
//

import Foundation
import UIKit


class NotificationController: UIViewController {
    
    // Mark: - Properties
    
    
    
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()    }
    
    
    // Mark: - Helpers
    func configureUI(){
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.title = "Notifications"
    }



}
