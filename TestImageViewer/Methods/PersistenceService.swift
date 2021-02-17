//
//  DataParksCoreData.swift
//  Picnic Moscow
//
//  Created by Сергей Верховский on 11.12.2020.
//

import Foundation
import CoreData


class PersistenceService {
    
    static let shared = PersistenceService()
    private init () {}
    
    var context: NSManagedObjectContext {return persistentContainer.viewContext}
   
   private var fetchedhResultController: NSFetchedResultsController<TestImageViewer>?
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
     
        let container = NSPersistentContainer(name: "TestImageViewer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

   
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("сохранение прошло успешно")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func createPhotoEntityFrom(dictionary: [String: AnyObject]) -> NSManagedObject? {
        
        if let imageEntity = NSEntityDescription.insertNewObject(forEntityName: "TestImageViewer", into: context) as? TestImageViewer {
            
                imageEntity.id = dictionary["id"] as! Int64
                imageEntity.largeImageURL = dictionary["largeImageURL"] as? String
                imageEntity.previewURL = dictionary["webformatURL"] as? String
                imageEntity.user = dictionary["user"] as? String
                imageEntity.date = DateInfo.shared.dateString()
                
                let url = URL(string: dictionary["webformatURL"] as! String)!
                
            imageEntity.dataImagePreview = savedDatainCD(url: url)
                                    
            return imageEntity
        }
        return nil
    }
    

  private func savedDatainCD (url: URL) -> Data? {
    var dataS: Data?
        DispatchQueue.global(qos: .utility).async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    dataS = data
                }
              
            } catch {
                
            }
        }
    return dataS
    }
    
    func saveInCoreDataWith(array: [[String: AnyObject]]) {

            _ = array.map{self.createPhotoEntityFrom(dictionary: $0)}
            saveContext()
    }
    
    
// Очистка CoreData
    func deleteCoreData () {
       
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TestImageViewer")
            do {
                let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                saveContext()
 
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
