//
//  StartViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/9/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var buildingsArray = [Building]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveBuildings(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(buildingsArray, toFile: Building.ArchiveURL.path)
        
        if !isSuccessfulSave {
            print("Failed")
        }
    }
    func saveBuildingsTotal(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(buildingsArray, toFile: Building.ArchiveURLTotal.path)
        
        if !isSuccessfulSave {
            print("Failed")
        }
    }
    
    func loadBuildings() -> [Building]{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Building.ArchiveURL.path) as! [Building]
    }
    func loadBuildingsTotal() -> [Building]{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Building.ArchiveURLTotal.path) as! [Building]
    }


}
