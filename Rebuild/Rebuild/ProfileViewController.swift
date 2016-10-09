//
//  ProfileViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: Attributes
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 255/255.0, green: 99/255.0, blue: 71/255.0, alpha: 1)]
        
        if revealViewController() != nil{
            menuButton.target = self.revealViewController()
            
            menuButton.action = #selector(SWRevealViewController().revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
