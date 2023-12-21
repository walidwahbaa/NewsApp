//
//  Article.swift
//  NewsApp
//
//  Created by walid wahba on 21.12.2023.
//

import Foundation

struct Article : Decodable{
    var author: String?
    var title: String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var puplishedAt:String?
}
