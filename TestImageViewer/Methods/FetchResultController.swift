//
//  FetchResultController.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation
import CoreData


class FetchResultController: NSObject {
    
    private let persistence = PersistenceService.shared
    
    func frc () -> NSFetchedResultsController<TestImageViewer> {
        let fetchRequest: NSFetchRequest<TestImageViewer> = TestImageViewer.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistence.context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("###\(#function): Failed to performFetch: \(error)")
        }
        return controller
    }
    
}
