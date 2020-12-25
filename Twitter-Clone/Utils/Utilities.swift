//
//  Utilities.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 25/12/20.
//

import Foundation
import UIKit


class Utilities{
    
    func inputContainerView(image:UIImage,tf:UITextField)->UIView{
        
        let cv = UIView()
        cv.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        cv.addSubview(iv)
        
        iv.anchor(left:cv.leftAnchor,bottom: cv.bottomAnchor,paddingLeft: 8,paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        cv.addSubview(tf)
        tf.anchor(left:iv.rightAnchor,bottom: cv.bottomAnchor,right:cv.rightAnchor,paddingLeft: 8,paddingBottom: 8,paddingRight: 8)
        
        let borderView = UIView()
        borderView.backgroundColor = .white
        cv.addSubview(borderView)
        borderView.anchor(left:cv.leftAnchor,bottom: cv.bottomAnchor,right:cv.rightAnchor,paddingLeft: 8, paddingRight: 8, height: 0.75)
        
        return cv
    }
    
    func textField(placeholder:String)->UITextField{
        
        let tf = UITextField()
        tf.textColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        tf.font = UIFont.systemFont(ofSize: 16)
        return tf
    }
    
    func attributedButton(_ firstPart :String, _ secondPart : String)-> UIButton{
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)])
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
}
