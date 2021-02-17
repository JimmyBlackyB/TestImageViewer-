//
//  CollectionCellViewModel.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation


class CollectionCellViewModel: CollectionCellViewModelType {
    
    var previewURL: String?
    var user: String?
    var largeImageURL: String?
    var id: Int64?
    
    init?(image: TestImageViewer) {
        self.previewURL = image.previewURL
        self.largeImageURL = image.largeImageURL
        self.user = image.user
        self.id = image.id
        
    }
    
}
