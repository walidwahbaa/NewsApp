//
//  ArticleModel.swift
//  NewsApp
//
//  Created by walid wahba on 21.12.2023.
//

import Foundation
protocol ArticleModelProtocol {
    func articlesRetrived(_ articles:[Article])
}
class ArticleModel {
    
    var delegete : ArticleModelProtocol?
    func getArticles (){
        //Fire the request to the API
        
        // Parse the requested JSON file into article instances and pass it back to the view controlller with the protocol & delegete
        delegete?.articlesRetrived([Article]())
    }
}

