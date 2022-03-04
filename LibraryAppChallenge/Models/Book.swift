//
//  Book.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import Foundation

struct Book : Decodable, Identifiable
{
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
}
