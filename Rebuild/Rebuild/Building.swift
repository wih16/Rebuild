//
//  Building.swift
//  Rebuild
//
//  Created by William Hinard on 10/8/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import Foundation
import UIKit

class Building{
    var name: String
    var image: UIImage?
    
    //initializing
    init?(name: String, image: UIImage){
        self.name = name
        self.image = image
    }
}
