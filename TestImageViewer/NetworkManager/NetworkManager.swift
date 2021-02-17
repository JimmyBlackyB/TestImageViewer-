//
//  NetworkManager.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 16.02.2021.
//

import UIKit


class NetworkManager: NSObject {
    
    private lazy var apiKey: String = "16744775-bf96150881e7fd52ecdaf1664"
    private lazy var urlApi: String = "https://pixabay.com/api/?key=\(apiKey)"
    private let queue = DispatchQueue.main
    private let persistence = PersistenceService.shared
    
    func getImage (completion: @escaping ([[String: AnyObject]]?) -> Void) {
        
        guard let url = URL(string:urlApi) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Вставить проверку CoreData")
                self.queue.async {
                    NotificationCenter_Post.shared.NotificationCenterPost_ErrorLoad()
                }
            }
            
            guard let data = data else {
                self.queue.async {
                    NotificationCenter_Post.shared.NotificationCenterPost_ErrorLoad()
                }
                return
            }
            
            
            do {
                if let jsonAnswer = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String : AnyObject] {
                    guard let itemsJsonArray = jsonAnswer["hits"] as? [[String: AnyObject]]  else {
                        self.queue.async {
                            NotificationCenter_Post.shared.NotificationCenterPost_ErrorLoad()
                        }
                        return
                    }
                    self.queue.async {
                        completion(itemsJsonArray)
                    }
                }
            } catch {
                return
            }
            
           
        }.resume()
    }

    func updateCollectionContent() {
      
        let service = NetworkManager()
        service.getImage { [self] (result) in
            if result != nil {
                persistence.deleteCoreData()
                persistence.saveInCoreDataWith(array: result!)
            } else {
                DispatchQueue.main.async {
                   let alert =  AlertWindow.shared.showAlert(title: "Ошибка", message: "")
//                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

