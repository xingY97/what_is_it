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
        
        //Create a URL object
        let url = URL(string: imageUrl)
        
        //Check that the URL isn't nil
        guard url != nil else {
            print("Coulnt get URL object")
            return
        }
        
        //Get a URL session
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check that there are no errors and that there was data
            if error == nil && data != nil {
                self.imageData = data
            }
        }
        
        //Start the data task
        dataTask.resume()
    }
}
