//
//  DetailsFavouriteArticleController.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//

import UIKit

class DetailsFavouriteArticleController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var abstractLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    var imageCompletionHandler: ((UIImage?) -> Void)?
    
    var selectedArticleTitle: String?
    var selectedArticleAbstract: String?
    var selectedArticleImage: UIImage?
    
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
                self?.articleImage.image = image
            }
        }
    }
}
