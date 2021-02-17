//
//  CollectionViewModelType.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation

protocol CollectionViewModelType {
    func numberOfSection () -> Int
    func cellViewModel (forIndexPath indexPath: IndexPath) -> CollectionCellViewModelType?
}
