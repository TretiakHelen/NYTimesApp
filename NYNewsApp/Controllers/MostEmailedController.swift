//
//  MostEmailedController.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 07.04.2024.
//

import UIKit

class MostEmailedController: UIViewController {
    var articlesList: [Article] = []
    var emailedArticles = MostPopularArticles()

    @IBOutlet weak var myTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.tableFooterView = UIView()

        emailedArticles.fetchMostPopularArticles(from: mostEmailedURL) { result in
            switch result {
            case .success(let articles):
                self.articlesList = articles
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            case .failure(let error):
                handleFetchError(viewController: self, error)
            }
        }
    }

}


