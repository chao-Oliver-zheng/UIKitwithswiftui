//
//  InfoViewModel.swift
//  CatStoryBoard
//
//  Created by Oliver Zheng on 8/22/23.
//

import UIKit
import Combine
class CatServiceViewModel: ObservableObject {
    
    @Published var data: [Info] = []
    var cancellable: Set<AnyCancellable> = []
    let service = InfoService()
    
    func getData() {
        self.service.fetchData()
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let err):
                print(err)
            }
            }, receiveValue: { [weak self] data in
                self?.data = data
            })
            .store(in: &cancellable)
    }
}
