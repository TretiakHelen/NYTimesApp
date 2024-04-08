//
//  Model.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 07.04.2024.
//
import UIKit
struct ArticlesResponse: Codable {
    let results: [Article]
}

struct Article: Codable {
    let title: String
    let abstract: String
    let url: String
    let media: [Media]
}

struct Media: Codable {
    let metadata: [MediaMetadata]
    
    private enum CodingKeys: String, CodingKey {
        case metadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
