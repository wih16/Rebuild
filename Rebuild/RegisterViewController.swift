//
//  RegisterViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    //MARK: Outlets
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Confrim: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Username.delegate = self
        Email.delegate = self
        Password.delegate = self
        Confrim.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    @IBAction func Submit(_ sender: UIButton) {
        let user = Username.text!
        let email = Email.text!
        let pass = Password.text!
        let conf = Confrim.text!
        
        //check not empty 
        if(user.isEmpty || email.isEmpty || pass.isEmpty || conf.isEmpty){
            //alert message
            displayAlert(message: "Please fill out all fields")
            
            return
        }
        
        if(pass != conf){
            //alert message
            displayAlert(message: "Passwords do not match")
            
            return
        }
        
        UserDefaults.standard.set(user, forKey: "user")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(pass, forKey: "pass")
        UserDefaults.standard.synchronize()
        
        let alert = UIAlertController(title: "Alert", message: "Registration Complete", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in self.dismiss(animated: true, completion: nil)}
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func displayAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true;
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
