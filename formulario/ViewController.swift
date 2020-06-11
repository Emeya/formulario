//
//  ViewController.swift
//  formulario
//
//  Created by Manuel Soberanis on 11/06/20.
//  Copyright © 2020 Archer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        return view
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "itssyLogo")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .darkGray
        return iv
    }()
    
    let userNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.adjustsFontForContentSizeCategory = true
        tf.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.textColor = .white
        tf.backgroundColor = .darkGray
        tf.textAlignment = .center
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.adjustsFontForContentSizeCategory = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.textAlignment = .center
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = .darkGray
        tf.layer.cornerRadius = 10
        tf.textColor = .white
        tf.layer.borderWidth = 1
        tf.layer.masksToBounds = true
        return tf
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Login", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        view.addSubview(containerView)

        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        containerView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2).isActive = true
        
        containerView.addSubview(userNameTF)
        userNameTF.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        userNameTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        userNameTF.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5, constant: 60).isActive = true
        userNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(passwordTF)
        passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 20).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: userNameTF.centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: userNameTF.widthAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        containerView.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40).isActive = true
//        submitButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5, constant: -20).isActive = true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
