//
//  DataServices.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import Foundation

class DataServices {
    
    static func getLocalData() -> [Book]
    {
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        guard pathString != nil else
        {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do{
                let bookData = try decoder.decode([Book].self, from: data)
                
                return bookData
            }
            catch
            {
                print(error)
            }
        }
        catch{
            print(error)
        }
        return [Book]()
    }
}
