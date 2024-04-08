//
//  Extensions.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func loadImageForArticle(_ article: Article, into detailsArticle: DetailsArticleController) {
        if let mediaMetadata = article.media.first?.metadata.first,
            let imageUrl = URL(string: mediaMetadata.url) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    print("Error fetching image data: \(error)")
                    return
                }
                guard let data = data else {
                    print("No image data received")
                    return
                }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        detailsArticle.selectedArticleImage = image
                        detailsArticle.imageCompletionHandler?(image)
                    }
                } else {
                    print("Failed to convert image data to UIImage")
                }
            }.resume()
        } else {
            print("No image metadata or URL found")
        }
    }
}

extension MostViewedController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView!.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articlesList[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = myTableView.indexPathForSelectedRow {
            let detailsArticle = segue.destination as! DetailsArticleController
            let selectedArticle = articlesList[indexPath.row]
    
            detailsArticle.selectedArticleTitle = selectedArticle.title
            detailsArticle.selectedArticleAbstract = selectedArticle.abstract
            detailsArticle.selectedArticleURl = selectedArticle.url
            
            loadImageForArticle(selectedArticle, into: detailsArticle)
        }
    }
}

extension MostEmailedController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView!.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articlesList[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = myTableView.indexPathForSelectedRow {
            let detailsArticle = segue.destination as! DetailsArticleController
            let selectedArticle = articlesList[indexPath.row]
            
            detailsArticle.selectedArticleTitle = selectedArticle.title
            detailsArticle.selectedArticleAbstract = selectedArticle.abstract
            detailsArticle.selectedArticleURl = selectedArticle.url
            
            loadImageForArticle(selectedArticle, into: detailsArticle)
        }
    }
}

extension MostSharedController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView!.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articlesList[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = myTableView.indexPathForSelectedRow {
            let detailsArticle = segue.destination as! DetailsArticleController
            let selectedArticle = articlesList[indexPath.row]
            
            detailsArticle.selectedArticleTitle = selectedArticle.title
            detailsArticle.selectedArticleAbstract = selectedArticle.abstract
            detailsArticle.selectedArticleURl = selectedArticle.url
            
            loadImageForArticle(selectedArticle, into: detailsArticle)
        }
    }
}
extension FavouritesController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteArticles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favouriteArticles[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = myTableView.indexPathForSelectedRow {
            let detailsArticle = segue.destination as! DetailsFavouriteArticleController
            let selectedArticle = favouriteArticles[indexPath.row]
            
            detailsArticle.selectedArticleTitle = selectedArticle.title
            detailsArticle.selectedArticleAbstract = selectedArticle.abstract

            if let mediaMetadata = selectedArticle.image{
                if let image = UIImage(data: mediaMetadata) {
                    DispatchQueue.main.async {
                        detailsArticle.selectedArticleImage = image
                        detailsArticle.imageCompletionHandler?(image)
                    }
                }
            }
        }
    }
}
