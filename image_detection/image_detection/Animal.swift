//
//  Animal.swift
//  image_detection
//
//  Created by X Y on 3/17/21.
//

import Foundation

class Animal {
    
    // url for the image
    var imageUrl: String
    
    // image data
    var imageData: Data?
    
    init(){
        self.imageUrl = ""
        self.imageData = nil
    }
    
    init?(json: [String: Any]){
        
        //check that JSON has a url
        guard let imageUrl = json["url"] as? String else {
            return nil
        }
        
        // set the animal properties
        self.imageUrl = imageUrl
        self.imageData = nil
        
        //Download the image data
        getImage()
    }
    
    func getImage() {
        
        
    }
}
