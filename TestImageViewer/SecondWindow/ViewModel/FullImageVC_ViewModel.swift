//
//  FullImageVC_ViewModel.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import UIKit
import CoreData

//class FullImageVC_ViewModel: FullImageVC_Type {
//    
//    private  var fetchedhResultController: NSFetchedResultsController<TestImageViewer>?
//    
//    func didSelectImage(forIndexPath indexPath: IndexPath, seque: UIStoryboardSegue) {
//        fetchedhResultController = FetchResultController().frc()
//        let item = fetchedhResultController?.object(at: indexPath)
//        dateImageUpload = item?.user
//        let fullImageVC = seque.destination as! FullImageVC
//    }
// 
//    var imageFull: UIImage?
//    
//    var dateImageUpload: String?
//
//    func fullImageSet() -> UIImage? {
//        return nil
//    }
//    
//    func textDate() -> String? {
//        return nil
//    }
//    
//    
//    
//}

struct FullImage {
    var dateInfo: String?
    var imageFull: String?
    
    init?(dateInfo: String, imageFull: String) {
        self.dateInfo = dateInfo
        self.imageFull = imageFull
    }
    
    
}
