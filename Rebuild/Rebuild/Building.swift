//
//  Building.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import Foundation
import UIKit

class Building: NSObject, NSCoding{
    
    //MARK: Properties
    var name: String
    var image: UIImage?

    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("trial")
    
    static let ArchiveURLTotal = DocumentsDirectory.appendingPathComponent("trialTotal")
    
    
    //initializing
    init?(name: String, image: UIImage){
        self.name = name
        self.image = image
        
        
        super.init()

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let nameD = aDecoder.decodeObject(forKey: "name") as! String
        let photo = aDecoder.decodeObject(forKey: "image") as? UIImage
        
        self.init(name: nameD, image: photo!)
    }
    
    
    
}
