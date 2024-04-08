//
//  HandleErrors.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//

import UIKit
import Alamofire

func handleFetchError(viewController: UIViewController, _ error: Error) {
    if let afError = error as? AFError, afError.isSessionTaskError, afError.responseCode == nil {
        viewController.showAlert(title: "CONNECTION ERROR", message: "Please check your internet connection and try again")
    } else {
        viewController.showAlert(title: "ERROR", message: "Error fetching articles: \(error.localizedDescription)")
    }
}
