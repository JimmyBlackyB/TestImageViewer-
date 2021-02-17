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
    var imagePreview: Data?
    var imageLarge: Data?
    
    init?(image: TestImageViewer) {
        self.previewURL = image.previewURL
        self.largeImageURL = image.largeImageURL
        self.user = image.user
        self.imagePreview = image.imagePreview
        self.imageLarge = image.imageLarge
    }
    
}
