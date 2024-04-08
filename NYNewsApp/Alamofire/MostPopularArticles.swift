//
//  MostPopularArticles.swift
//  NYNewsApp
//
//  Created by Ihor Zaporozhets on 08.04.2024.
//
import Alamofire

class MostPopularArticles {
    func fetchMostPopularArticles(from url: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        AF.request(url).responseDecodable(of: ArticlesResponse.self) { response in
            switch response.result {
            case .success(let articlesResponse):
                completion(.success(articlesResponse.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
