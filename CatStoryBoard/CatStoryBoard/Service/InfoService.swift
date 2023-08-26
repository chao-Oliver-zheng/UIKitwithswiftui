//
//  InfoService.swift
//  CatStoryBoard
//
//  Created by Oliver Zheng on 8/22/23.
//

import Foundation
import Combine
enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case emptyData
    case serviceUnavailable
    case decodingError
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "invalid url"
        case .invalidResponse:
            return "invalid response"
        case .emptyData:
            return "empty data"
        case .serviceUnavailable:
            return "service unavailable"
        case .decodingError:
            return "decoding error"
        }
    }
}
class InfoService {
    
    let urlString = "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats"
    func fetchData() -> AnyPublisher<[Info], Error> {
        guard let url = URL(string: urlString) else{ return Fail(error: APIError.invalidUrl).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [Info].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
