//
//  CollectionViewController.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 16.02.2021.
//

import UIKit
import CoreData

class CollectionViewController: UICollectionViewController {
   
    private let persistence = PersistenceService.shared
    
    var fetchedhResultController: NSFetchedResultsController<TestImageViewer>?
    
    private var viewModel: CollectionViewModelType?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        fetchedhResultController?.delegate = self
        NetworkManager().updateCollectionContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Наблюдатель для вызова алерта
        NotificationCenter.default.addObserver(self, selector: #selector(alertError_Reload), name: NSNotification.Name(rawValue: ObserverName.errorLoad.rawValue), object: nil)
    }

    @objc func alertError_Reload() {
        DispatchQueue.main.async {
            let alert = AlertWindow.shared.showAlert(title: "Ошибка", message: "Произошла ошибка загрузки")
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfSection() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_Image", for: indexPath) as? CollectionViewCell
        
        guard let collectionCell = cell , let viewModel = viewModel else {return UICollectionViewCell()}

        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

        collectionCell.viewModel = cellViewModel

        return collectionCell
    }
    
//   Переход через prepare из-за iOS 11
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: segue)
        guard segue.identifier == "FullImage_Seque" else {return}
        let indexPath = collectionView.indexPathsForSelectedItems!
        fetchedhResultController = FetchResultController().frc()
        let item = fetchedhResultController?.object(at: indexPath.first!)
        let fullImageVC = segue.destination as! FullImageVC
        fullImageVC.fullImageTap?.dateInfo = item?.date
        fullImageVC.fullImageTap?.imageFull = item?.largeImageURL

    }

}

extension CollectionViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            self.collectionView.insertItems(at: [newIndexPath!])
        case .delete:
            self.collectionView.deleteItems(at: [indexPath!])
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.collectionView.reloadData()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.collectionView.reloadData()
    }
}
