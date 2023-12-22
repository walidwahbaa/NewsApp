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
        
        //Create a string url
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5011f5716b744c5a80ab48457321b6b9"
        
        //Create URL object
        let url = URL(string: stringUrl)
        //Check that URL is not nil
        guard url !=  nil else {
            print("couldn't create a url ")
            return
        }
        
        //Get the URL session
        let session = URLSession.shared
        //Create the data task
       let dataTask = session.dataTask(with: url!) { data, response, error in
            //Check that there is no errors and there is data
            if error == nil && data != nil {
                
                //Parse the JSON
                let decoder = JSONDecoder()
                do {
                    //Parse the json into article servies
                    let articleServies = try decoder.decode(ArticleServies.self, from: data!)
                    //get the articles property
                    let articles = articleServies.articles!
                    
                    
                    //Pass the articles to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegete?.articlesRetrived(articles)
                    }
                }
                catch{
                    print ("Error Parsing the JSON ")
                } //End DO - Catch
                
            } //End If
           
        }//End Data Task
        
        //Start the data task
        dataTask.resume()
    }
}

