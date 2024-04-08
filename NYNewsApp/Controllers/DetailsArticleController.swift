//
//  DetailsArticleController.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 07.04.2024.
//

import UIKit
import SafariServices

class DetailsArticleController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var abstractLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var selectedArticleTitle: String?
    var selectedArticleAbstract: String?
    var selectedArticleURl: String?
    var selectedArticleImage: UIImage?
    
    var imageCompletionHandler: ((UIImage?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = selectedArticleTitle {
            titleLabel.text = title
        }
        if let abstract = selectedArticleAbstract {
            abstractLabel.text = abstract
        }
        imageCompletionHandler = { [weak self] image in
            DispatchQueue.main.async {
                self?.articleImageView.image = image
            }
        }
    }
    
    @IBAction func showNYTimesWeb(){
        guard let articleURL = URL(string: selectedArticleURl!) else { return }

        let safariVC = SFSafariViewController(url: articleURL)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func addToFavourites(){
        guard let title = selectedArticleTitle, let abstract = selectedArticleAbstract, let articleImage = selectedArticleImage else { return }
        
        guard let imageData = articleImage.jpegData(compressionQuality: 1.0) else { return }
        CoreDataManager.shared.createNYArticle(title: title, abstract: abstract, image: imageData)
        
    }

}
