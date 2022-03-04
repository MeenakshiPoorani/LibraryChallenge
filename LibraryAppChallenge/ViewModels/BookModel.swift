//
//  BookModel.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import Foundation

class BookModel : ObservableObject {
    @Published var books = [Book]()
    
    init()
    {
        books = DataServices.getLocalData()
    }
    
    func updateFavourite(forId: Int) {
        
        /* The following will not work because index and ids are different parameters.
         
         ex. lets say we want to toggle book[0].isFavourite, so forId passed into the function call for book[0] is forID = 1 (book[0] has id = 1).
             In case of first round, index would have value 0 and forId would have value 1 and is skipped.
             In next iteration, index is 1 and forId is 1 and you toggle book[index].isFavourite,since index = 1, you're toggling the next book actually i.e. book[1] instead of desired book[0]
         
        for index in 0...books.count-1
        {
            if index == forId {
                
                books[index].isFavourite.toggle()
            }
        }
        */
        
        /* Chris's solution :
         if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }*/
        
        for index in 0...books.count-1
        {
            if books[index].id == forId {
                
                books[index].isFavourite.toggle()
            }
        }
   
    }
    
    func updateRating (forId:Int, rating:Int)
    {
        for index in 0...books.count-1
        {
            if books[index].id == forId {
                
                books[index].rating = rating
            }
        }
    }
}
