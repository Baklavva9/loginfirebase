//
//  ModuleLoginViewController.swift
//  SocialLoginModule
//
//  Created by Xcode Server on 18/6/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit

class ModuleLoginViewController: UIViewController {
    
    var placeholdertext : String = ""
    
    
    
    
    ///Email field
    
    let emailTextField: UITextField = {
        
        let textField = UITextField()
        
        var placeholder = NSAttributedString()
        
      //  to define the attributes for the string
        
//        let placeholderTextAttributes: [NSAttributedStringKey : Any] =
//                [NSAttributedStringKey.font            : UIFont.systemFont(ofSize: 14.0),
//                 NSAttributedStringKey.foregroundColor : UIColor.blue ]

   //     textField.placeholder = "Email"

//        let attributedPlaceholder = NSAttributedString(string:"Email address here", attributes: [NSAttributedStringKey.foregroundColor : UIColor.blue,
//             NSAttributedStringKey.font            : UIFont.systemFont(ofSize: 14.0)
//                                                                                      ])
        
        let attributedPlaceholder = NSAttributedString(string: "enter your email here", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,
             NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18.0)])
        
            textField.attributedPlaceholder = attributedPlaceholder
        
            textField.textColor = .white
            textField.backgroundColor = .red
        
            textField.layer.cornerRadius = 8
        
        
        return textField
        
        
    }()
    
    ///Password field
    
    let passwordTextField: UITextField = {
        
        let textField = UITextField()
        
        
        let attributedPlaceholder = NSAttributedString(string: "enter your password here", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,
             NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18.0)])
        
            textField.attributedPlaceholder = attributedPlaceholder
        
       //     textField.placeholder = "Password"
        
            textField.textColor = .white
            textField.backgroundColor = .blue
        
        return textField
    
    }()
    
    ///Login button
    
    let loginButton: UIButton = {
        
        let button = UIButton(type:. system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .purple
        
        return button
    }()
    
    ///have account? section
    
    let haveAccountClickableText: UIButton = {
        
        let textButton = UIButton(type: .system)
        let attributedTitle = NSAttributedString(string: "Don't have an account?", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
//        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes:[NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont]))
     
        textButton.setAttributedTitle(attributedTitle, for: .normal)
//        textButton.backgroundColor = .gray
    
        return textButton
    
    }()
    
    /// forgot password section??
    
    let forgotPasswordClickableText: UIButton = {
        
        let textButton = UIButton(type: .system)
        
      //  let attributedTitle = NSAttributedString(string: "Forgot Password?", attributes:
      //  [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        textButton.setTitle("Forgot Password?", for: .normal)
        textButton.setTitleColor(.white, for: .normal)
//        textButton.backgroundColor = .purple
        
        return textButton
    }()
    
    
    /// signup if not??
    
    let SignUpClickableText: UIButton = {
        
        let textButton = UIButton(type: .system)
        
        //  let attributedTitle = NSAttributedString(string: "Forgot Password?", attributes:
        //  [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        textButton.setTitle("SignUp", for: .normal)
        textButton.setTitleColor(.white, for: .normal)
        //        textButton.backgroundColor = .purple
        
        return textButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        setupTextFieldComponents()
        setupLoginButton()
        setupHaveAccountClickableText()
        setupForgotPasswordClickableText()
        setupSignUpClickableText()
        
    }
    
    // you can put a function in a function and chuck it in viewDidLoad
    
    func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
    }
    
    
    // functions below allows components to be added using the [addSubview] method...
    
    func setupEmailField() {
        
        view.addSubview(emailTextField)
        
        // using constraints to design the layouts
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
      
        // adding a left padding for placeholder_text
        
//        let paddingView = UIView(frame: CGRect(x:0, y:0, width:50, height:self.emailTextField.frame.height))
//        emailTextField.leftView = paddingView
//        emailTextField.leftViewMode = UITextFieldViewMode.always
//
//
        // adding icons to leftView
        
        let emailImage = UIImage(named: "email-field-icon")
        addLeftImageTo(textField: emailTextField, leftImage: emailImage!)
    

    }

    
    func setupPasswordField() {
        
        view.addSubview(passwordTextField)
        
        //using constraints to layout your components
        
    
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
          // adding a left padding for placeholder_text
        
//        let paddingView = UIView(frame: CGRect(x:0, y:0, width:35, height:self.passwordTextField.frame.height))
//        passwordTextField.leftView = paddingView
//        passwordTextField.leftViewMode = UITextFieldViewMode.always
        
        
        // adding icons to leftView
        
        let passwordImage = UIImage(named: "password-field-icon")
        addLeftImageTo(textField: passwordTextField, leftImage: passwordImage!)
        
    }
    
    //Adding images to textField
    func addLeftImageTo(textField: UITextField, leftImage img: UIImage) {
        
    
        let leftImageView = UIImageView(frame: CGRect(x: 20.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        
        let allleftview = UIView(frame:CGRect(x: 0, y: 0, width: 10 , height: img.size.height))
       
        allleftview.addSubview(leftImageView)
//        textField.leftView = paddingView
//        textField.leftViewMode = .always
        
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
        
        
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
//        view.addSubview(imageView)
        
        
    }
    
    
    
    func setupLoginButton() {
        
        view.addSubview(loginButton)
        
//        loginButton.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 24, right: view.rightAnchor, rightPad:  24, height: 30, width:  0)
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    func setupForgotPasswordClickableText() {
        
        view.addSubview(forgotPasswordClickableText)
        
        
//        forgotPasswordClickableText.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 24, right: view.rightAnchor, rightPad:  24, height: 30, width:  0)
    
        
        forgotPasswordClickableText.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordClickableText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        forgotPasswordClickableText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        forgotPasswordClickableText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        forgotPasswordClickableText.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    func setupHaveAccountClickableText() {
        
         view.addSubview(haveAccountClickableText)
        
//
//        forgotPasswordClickableText.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 24, right: view.rightAnchor, rightPad:  24, height: 30, width:  0)
        
         haveAccountClickableText.translatesAutoresizingMaskIntoConstraints = false
         haveAccountClickableText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
         haveAccountClickableText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -70).isActive = true
         haveAccountClickableText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
         haveAccountClickableText.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    func setupSignUpClickableText() {
        
        view.addSubview(SignUpClickableText)
        
    
        SignUpClickableText.translatesAutoresizingMaskIntoConstraints = false

        SignUpClickableText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

        SignUpClickableText.leftAnchor.constraint(equalTo: haveAccountClickableText.leftAnchor, constant: 170).isActive = true
        SignUpClickableText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        SignUpClickableText.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    

}
