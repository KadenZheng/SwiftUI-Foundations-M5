//
//  ContentModel.swift
//  LearningApp
//
//  Created by LaptopCartUser on 1/1/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        // MARK: JSON Decoding
        // Get a url to the json file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData =  try Data(contentsOf: jsonURL!)
            
            //Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
        } catch {
            // TODO log error
            print(error.localizedDescription)
        }
        
        // MARK: Style (HTML) Decoding
        // Parse the style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
           // Read the file into a data object
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        } catch {
            // Log error
            print(error.localizedDescription)
        }
        
    }
}
