//
//  CatListView.swift
//  CatStoryBoard
//
//  Created by Oliver Zheng on 8/22/23.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel: CatServiceViewModel

    var body: some View {
        List(viewModel.data, id: \.self) { info in
            Text("Name: \(info.name), Breed: \(info.breed)")
        }
        .onAppear {
            viewModel.getData()
        }
    }
}
