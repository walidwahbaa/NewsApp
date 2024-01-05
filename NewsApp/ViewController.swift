//
//  ViewController.swift
//  NewsApp
//
//  Created by walid wahba on 21.12.2023.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    

    var model = ArticleModel()
    var articles = [Article]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the view controller as the data source and the delegete of the table view
        tableView.delegate = self
        tableView.dataSource = self
        //Get the articles from the article model
        model.delegete = self
        model.getArticles()
        
        
    }

}

//We use extentions which can add functionality to any existing class and it's a better way to organize code
extension ViewController: ArticleModelProtocol {
    
//MARK: Article Model Protocol Methods
    
func articlesRetrived(_ articles: [Article]) {
    //set the articels retrived from the article model to the articles in the view controller
    self.articles = articles
    
    //Refreach the tableView
    tableView.reloadData()
    
}
    
    
}
extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        //Get the article that the table view is asking about
        let article = articles[indexPath.row]
        
        //Configure it
        cell.displayArticle(article)
        
        //Return it
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

