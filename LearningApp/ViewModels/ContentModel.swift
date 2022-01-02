//
//  ContentModel.swift
//  LearningApp
//
//  Created by LaptopCartUser on 1/1/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: - Data Methods
    
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
    
    // MARK: - Module Navigation Methods
    
    func beginModule (_ moduleID: Int) {
        
        // Find the index for this moduleID
        for index in 0..<modules.count {
            if modules[index].id == moduleID {
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
