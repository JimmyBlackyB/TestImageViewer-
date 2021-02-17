//
//  NotificationCenter_Post.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 16.02.2021.
//

import UIKit

class NotificationCenter_Post {
    
    static let shared = NotificationCenter_Post()
    private init (){}
    
    func NotificationCenterPost_ErrorLoad() {
        NotificationCenter.default.post(name: NSNotification.Name(ObserverName.errorLoad.rawValue), object: nil)
    }
    
}
