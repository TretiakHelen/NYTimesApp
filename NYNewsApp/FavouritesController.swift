//
//  FavouritesController.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//

import UIKit

class FavouritesController: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    var favouriteArticles: [FavouriteArticle] = []
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            favouriteArticles = CoreDataManager.shared.fetchArticles()
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    
}
