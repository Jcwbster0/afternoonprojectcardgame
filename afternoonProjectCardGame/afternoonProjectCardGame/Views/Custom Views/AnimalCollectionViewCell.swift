//
//  AnimalCollectionViewCell.swift
//  afternoonProjectCardGame
//
//  Created by Justin Webster on 4/22/21.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var animalImageView: UIImageView!
    
    //MARK: - Properties
    var animal: Animal? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let animal = animal else {return}
        animalImageView.contentMode = .scaleAspectFill
        animalImageView.image = animal.photo
    }
}
