//
//  FacebookLoginViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/25.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookLoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = FBSDKAccessToken.current() {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 44.0))
            label.center = view.center
            label.text = "Already Logged In..."
            
            view.addSubview(label)
        } else {
            let loginButton = FBSDKLoginButton()
            loginButton.readPermissions = ["public_profile", "email"]
            loginButton.center = view.center
            loginButton.delegate = self
            
            view.addSubview(loginButton)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FacebookLoginViewController: FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //
        print("ログイン処理を実行")
        
        if (error != nil) {
            // エラーが発生した場合
            print("Process Error !")
        } else if result.isCancelled {
            // ログインをキャンセルした場合
            print("User Cancelled")
        } else {
            // その他
            print("Login Succeeded")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //
    }
}
