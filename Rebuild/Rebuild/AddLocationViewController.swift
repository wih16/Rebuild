//
//  AddLocationViewController.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit
class AddLocationViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Attributes
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var locationImage: UIImageView!


    
    var buildingsArray = [Building]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    //MARK: UIImagePickerControllerDelagate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            locationImage.image = image
        } else{
            print("Something went wrong")
        }
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func save(_ sender: UIBarButtonItem) {
        buildingsArray = [Building]()
        buildingsArray.append(Building(name: locationName.text!, image: locationImage.image!)!)
        saveBuildings()
        saveBuildingsTotal()
        self.performSegue(withIdentifier: "cancel", sender: self)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: UITapGestureRecognizer) {
        locationName.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func saveBuildings(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(buildingsArray, toFile: Building.ArchiveURL.path)
        if !isSuccessfulSave{
            print("Failed")
        }
    }
    func saveBuildingsTotal(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(buildingsArray, toFile: Building.ArchiveURLTotal.path)
        if !isSuccessfulSave{
            print("Failed")
        }
    }
}

