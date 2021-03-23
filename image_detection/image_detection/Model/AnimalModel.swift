//
//  AnimalModel.swift
//  image_detection
//
//  Created by X Y on 3/17/21.
//

import Foundation

//Networking

class AnimalModel : ObservableObject{
    
    @Published var animal = Animal()
    
    func getAnimal() {
        
        let stringUrl = Bool.random() ? catUrl : dogUrl
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that the URL isn't nil
        guard url != nil else {
            print("Couldn't create URL object")
            return
        }
        
        // Get a URL session
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //If there is no error, and data was returned
            if error == nil && data != nil {
                
                //Attempt to parse JSON
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        let item = json.isEmpty ? [:] : json[0]
                        
                        if let animal = Animal(json: item) {
                            
                            DispatchQueue.main.async {
                                
                                while animal.results.isEmpty {}
                                self.animal = animal
                                
                            }
                            
                        }
                        
                    }
                    
                } catch {
                    print("coulnt parson JSON")
                }
            }
        }
        // Start the data task
        dataTask.resume()
    }
    
}
