//
//  RegistrationController.swift
//  Twitter-Clone
//
//  Created by Nitin Patil on 25/12/20.
//

import Foundation
import UIKit

class RegistrationController: UIViewController {
    
    // Mark: - Properties
    private let addPhotoButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self,action: #selector(addPhoto), for: .touchUpInside)
        return btn
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
    
    private lazy var fullnameContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(image: image, tf: fullnameTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    private lazy var usernameContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(image: image, tf: usernameTextField)
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
    
    private let fullnameTextField : UITextField = {
        let tv = Utilities().textField(placeholder: "Full Name")
        return tv
    }()
    
    private let usernameTextField : UITextField = {
        let tv = Utilities().textField(placeholder: "Username")
        return tv
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton : UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Log in")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var imagePicker : UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        return picker
    }()
    
    
    
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()    }
    
    
    // Mark: - Helpers
    func configureUI(){
        
        self.view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        addPhotoButton.setDimensions(width: 128, height: 128)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,fullnameContainerView,usernameContainerView,signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32,paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom:view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 40,paddingBottom: 16, paddingRight: 40)
       
    }
    
    @objc func handleShowLogin(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleSignup(){
        
        print("Sign up")
    }
    
    @objc func addPhoto(){
        
        present(imagePicker, animated: true, completion: nil)
        
    }
}

// Mark: - UIImagePickerControllerDelegate

extension RegistrationController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else{return}
        addPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        addPhotoButton.layer.cornerRadius = 128/2
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.imageView?.contentMode = .scaleAspectFill //// shortest side of img stretched to matched the view
        addPhotoButton.imageView?.clipsToBounds = true

        addPhotoButton.layer.borderWidth = 3
        addPhotoButton.layer.borderColor = UIColor.white.cgColor

        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
