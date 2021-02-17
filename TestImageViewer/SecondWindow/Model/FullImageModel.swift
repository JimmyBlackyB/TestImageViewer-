//
//  FullImageVC_ViewModel.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import UIKit

struct FullImage {
    var dateInfo: String?
    var imageFull: String?
    
    init?(dateInfo: String, imageFull: String) {
        self.dateInfo = dateInfo
        self.imageFull = imageFull
    }
    
    
}
