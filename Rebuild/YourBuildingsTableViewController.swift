//
//  YourBuildingsTableViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class YourBuildingsTableViewController: UITableViewController {

    //MARK: Attributes
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //MARK: Properties
    var buildingsArray = [Building]()
    var loadArray = [Building]()
    
    
    override func viewDidLoad() {
        
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 255/255.0, green: 99/255.0, blue: 71/255.0, alpha: 1)]
                
        if revealViewController() != nil{
            menuButton.target = self.revealViewController()
            
            menuButton.action = #selector(SWRevealViewController().revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        buildingsArray = [Building]()
        loadArray = loadBuildings()
        for b in loadArray {
            buildingsArray.append(b)
        }
        
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "buildingImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! YourBuildingsTableViewCell
        let building = buildingsArray[indexPath.row]
        
        cell.yourBuildingNameLabel.text = building.name
        cell.yourBuildingImage.image = building.image
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: NSCoding
    
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
        if NSKeyedUnarchiver.unarchiveObject(withFile: Building.ArchiveURL.path) as? [Building] != nil{
            return (NSKeyedUnarchiver.unarchiveObject(withFile: Building.ArchiveURL.path) as! [Building])
        }
        let array = [Building]()
        
        return array

    }
}
