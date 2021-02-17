//
//  CollectionCellViewModelType.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation
import CoreData

protocol CollectionCellViewModelType {
    var previewURL: String? {get}
    var user: String? {get}
    var largeImageURL: String? {get}
    var imagePreview: Data? {get}
    var imageLarge: Data? {get}
}
