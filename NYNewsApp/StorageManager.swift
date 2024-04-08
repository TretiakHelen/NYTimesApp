//
//  StorageManager.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//

import UIKit
import CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistenContainer.viewContext
    }
    
    public func createNYArticle(title: String, abstract: String, image: Data){
        let fetchRequest: NSFetchRequest<FavouriteArticle> = NSFetchRequest(entityName: entityNameOfDataModel)
        fetchRequest.predicate = NSPredicate(format: "title == %@ AND abstract == %@", title, abstract)
        do {
            let existingArticles = try context.fetch(fetchRequest)
            guard existingArticles.isEmpty else {
                return
            }
        } catch {
            print("Error fetching existing articles: \(error.localizedDescription)")
            return
        }
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: entityNameOfDataModel, in: context) else {
            return
        }
        let nYArticle = FavouriteArticle(entity: entityDescription, insertInto: context)
        nYArticle.title = title
        nYArticle.abstract = abstract
        nYArticle.image = image
        
        appDelegate.saveContext()
    }
    
    public func fetchArticles() -> [FavouriteArticle] {
        let fetchRequest: NSFetchRequest<FavouriteArticle> = NSFetchRequest(entityName: entityNameOfDataModel)
            do {
                let articles = try context.fetch(fetchRequest)
                return articles
            } catch {
                print("Failed to fetch articles: \(error)")
                return []
            }
    }
    
}
