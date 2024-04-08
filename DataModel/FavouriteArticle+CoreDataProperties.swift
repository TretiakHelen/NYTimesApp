//
//  FavouriteArticle+CoreDataProperties.swift
//  
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//
//

import CoreData

@objc(FavouriteArticle)
public class FavouriteArticle: NSManagedObject {}

extension FavouriteArticle {
    @NSManaged public var title: String?
    @NSManaged public var abstract: String?
    @NSManaged public var image: Data?

}
