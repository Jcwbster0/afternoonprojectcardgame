//
//  FilterViewController.swift
//  afternoonProjectCardGame
//
//  Created by Justin Webster on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func speciesWasSelected(species: String)
}

class FilterViewController: UIViewController {

    //MARK: - Properties
    
    weak var delegate: FilterSelectionDelegate?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func catButtonTapped(_ sender: Any) {
        delegate?.speciesWasSelected(species: "cat")
        self.dismiss(animated: true)
    }
    @IBAction func dogButtonTapped(_ sender: Any) {
        delegate?.speciesWasSelected(species: "dog")
        self.dismiss(animated: true)
    }
    
    
    

}//End of Class
