//
//  PhotosListView.swift
//  Card
//
//  Created by Wei-Lun Su on 9/28/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import SwiftUI

// TODO: Pass Generic Types <T: ItemList, S: Service>
struct PhotosListView: View {
    @ObservedObject private var viewModel = ListViewModel<Gallery>(items: [], service: GalleryService())
    
    var photos: [Photo] {
        viewModel.items.last?.photos?.photo ?? []
    }
    
    var body: some View {
        List(photos, rowContent: PhotoRow.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosListView()
    }
}
