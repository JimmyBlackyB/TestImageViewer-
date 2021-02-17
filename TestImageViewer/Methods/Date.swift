//
//  Date.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import Foundation


class DateInfo {
    
    static let shared = DateInfo()
    private init (){}
    
    func dateString () -> String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        return "\(day).\(month).\(year)"
    }
    
}
