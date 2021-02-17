//
//  ViewModel.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation
import CoreData

class ViewModel : CollectionViewModelType {
    
    private var fetchedhResultController: NSFetchedResultsController<TestImageViewer>?
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionCellViewModelType? {
        fetchedhResultController = FetchResultController().frc()
       let items =  fetchedhResultController?.object(at: indexPath)
        return CollectionCellViewModel(image: items!)
    }
       
    func numberOfSection() -> Int {
        
        guard  let fetchRequest = FetchResultController().frc().fetchedObjects else {return 0}
        
        if fetchRequest.count > 0 {
            return fetchRequest.count
        } else {
            return 0
        }
    }
    
    
    
}
