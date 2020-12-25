//
//  LoginController.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 25/12/20.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    // Mark: - Properties
    
    private let logoImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit // longest side of img stretched to matched the view
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var emailContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(image: image, tf: emailTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    private lazy var passwordContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(image: image, tf: passwordTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    private let emailTextField : UITextField = {
        let tv = Utilities().textField(placeholder: "Email")
        return tv
    }()
    
    private let passwordTextField : UITextField = {
        let tv = Utilities().textField(placeholder: "Password")
        tv.isSecureTextEntry = true
        return tv
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let doNotHaveAccountButton : UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    
    
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()    }
    
    
    // Mark: - Helpers
    func configureUI(){
        
        navigationController?.navigationBar.barStyle = .black // tintcolor for item set to white
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .twitterBlue
        view.addSubview(logoImageView)
        
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor,paddingLeft:32,paddingRight: 32)
        
        view.addSubview(doNotHaveAccountButton)
        doNotHaveAccountButton.anchor(left: view.leftAnchor, bottom:view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 40,paddingBottom: 16, paddingRight: 40)
    }
    
    @objc func handleLogin(){
        
        print("login")
        
    }
    
    @objc func handleShowSignUp(){
        
        let vc = RegistrationController()
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
