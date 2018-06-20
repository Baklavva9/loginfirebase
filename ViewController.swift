//
//  ViewController.swift
//  SocialLoginModule
//
//  Created by Xcode Server on 16/6/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet var anotherFBButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. for default button

        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
        
        anotherFBButton.layer.cornerRadius = 8
        
        
        
        //2. custom fb login button here
        
        let customFBButton = UIButton(type: .system)
        customFBButton.backgroundColor = .blue
        customFBButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
        customFBButton.setTitle("Custom FB Login here", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.layer.cornerRadius = 10.0
        
        customFBButton.setImage(#imageLiteral(resourceName: "facebook").withRenderingMode(.alwaysTemplate), for: .normal)
        customFBButton.tintColor = .white
        customFBButton.contentMode = .scaleAspectFit
        
        view.addSubview(customFBButton)

        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: . touchUpInside)
        
    }
    
        //2. for custom button
    
    @objc func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) {
            (result, err) in
            if err != nil {
                print("Custom FB Login failed:", err)
                return
            }
            print(result?.token.tokenString)
           
            self.showEmailAddress()
         
        }
    
    }
    
    //1. for default button
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        
        showEmailAddress()
        
//        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
//            (connection, result, err) in
//
//            if err != nil {
//                print("Failed to start graph request:", err)
//                return
//                }
//                print(result)
//                // print("Successfully logged in with facebook...")
//            }
//        }
}

    
    //2. for custom button
    func showEmailAddress() {
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                print("something went wrong with our FB user: ", error!)
                
                return
            }
            
            print("successfully logged in with our users: ", user!)
        })
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in

            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
            // print("Successfully logged in with facebook...")
            }
            }
    
    
    // 3. for button label
    @IBAction func loginFb(_ sender: Any) {
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) {
            (result, err) in
            if err != nil {
                print("Custom FB Login failed:", err)
                return
            }
            print(result?.token.tokenString)
          
            self.showEmailAddress()
            }
        }

}





