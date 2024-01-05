//
//  ArticleCell.swift
//  NewsApp
//
//  Created by walid wahba on 5.01.2024.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var headlineLabel: UILabel!
    
    var articleToDisplay : Article?
    
    func displayArticle (_ article:Article){
        
        //keeep a refrence to the article
        articleToDisplay = article
        //set the headline
        headlineLabel.text = articleToDisplay!.title
        
        //download and display the image
        
        // Create the URL string
        
        
        //check if the aricle has an image
        guard articleToDisplay?.urlToImage != nil else {
            
            return
        }
        let urlString = articleToDisplay!.urlToImage!
        
        // Create the url
        let url = URL(string: urlString)
        
        // Check that itn't nil
        guard url != nil else {
            return
        }
        
        
        // Create a URLSession
        let session = URLSession.shared
        
        // Create a DataTask
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                DispatchQueue.main.async {
                    //Display the image in the image view
                    self.articleImageView.image = UIImage(data: data!)
                }
               
            }//End if
        }//End Data task 
        
        // Kick off the dataTask
        dataTask.resume()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
