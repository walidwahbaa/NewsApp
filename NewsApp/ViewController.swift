//
//  ViewController.swift
//  NewsApp
//
//  Created by walid wahba on 21.12.2023.
//

import UIKit

class ViewController: UIViewController{

    var model = ArticleModel()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the articles from the article model
        model.delegete = self
        model.getArticles()
        
        
    }

}
//We use extentions which can add functionality to any existing class and it's a better way to organize code
extension ViewController: ArticleModelProtocol {
    
//MARK: Article Model Protocol Methods
    
func articlesRetrived(_ articles: [Article]) {
    print("Articles retrived from the model")
}
    
}

