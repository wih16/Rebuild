//
//  LoginViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: 255/255.0, green: 99/255.0, blue: 71/255.0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Action
    @IBAction func loginButton(_ sender: UIButton) {
        let username = Username.text!
        let password = Password.text!
        
        let usernameStored = UserDefaults.standard.string(forKey: "user")
        let passwordStored = UserDefaults.standard.string(forKey: "pass")
        
        if(username == usernameStored){
            if(password == passwordStored){
                //User is logged in 
                UserDefaults.standard.set(true, forKey: "loggedIn")
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
