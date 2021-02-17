//
//  AlertWindow.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 16.02.2021.
//

import UIKit

class AlertWindow {
    
    static let shared = AlertWindow()
    private init  (){}
    
    //    MARK: - Касстомное решение по вызову Алерт Окна
    func showAlert(title: String , message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let reloadAction = UIAlertAction(title: "Попробовать снова", style: .default) { (_) in
            print("Запуск загрузки заново")
            NetworkManager().updateCollectionContent()
        }
        let cancel = UIAlertAction(title: "Пропустить", style: .cancel) { (_) in
            print("Пропустить")
        }
        alert.addAction(reloadAction)
        alert.addAction(cancel)
        return alert
    }
}


