//
//  CardCollectionViewController.swift
//  afternoonProjectCardGame
//
//  Created by Justin Webster on 4/22/21.
//

import UIKit



class CardCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    
    var displayedAnimals: [Animal] = []
    var targetedAnimal: Animal?
    var selectedSpecies = "cat"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleAnimals(species: selectedSpecies)
    }
    
    //MARK: - Helper Methods
    
    func shuffleAnimals (species: String) {
        if species == "cat" {
            let shuffledCatGroup = AnimalController.cat.shuffled()
            let catGroup = shuffledCatGroup.prefix(3)
            displayedAnimals = Array(catGroup)
            targetedAnimal = AnimalController.dog.randomElement()
        } else {
            let shuffledDogGroup = AnimalController.dog.shuffled()
            let dogGroup = shuffledDogGroup.prefix(3)
            displayedAnimals = Array(dogGroup)
            targetedAnimal = AnimalController.cat.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let animal = targetedAnimal else {return}
        displayedAnimals.append(animal)
        displayedAnimals.shuffle()
        self.title = "Find the \(animal.breed)"
        collectionView.reloadData()
    }
    
    func presentAlert(animal: Animal) {
        let success = animal == targetedAnimal
        
        let alertcontroller = UIAlertController(title: success ? "Good Job" : "Try Again, Loser!", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleAnimals(species: self.selectedSpecies)
        }
        
        alertcontroller.addAction(doneAction)
        
        if success {
            alertcontroller.addAction(shuffleAction)
        }
        present(alertcontroller, animated: true)
    }
    
    
    
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return displayedAnimals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as? AnimalCollectionViewCell else {return UICollectionViewCell()}
        
        let animal = displayedAnimals[indexPath.row]
        cell.animal = animal
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = displayedAnimals[indexPath.row]
        presentAlert(animal: index)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? FilterViewController else {return}
            destination.delegate = self
        }
    }
    
    
}//End of Class

extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}//End of Extension

extension CardCollectionViewController: FilterSelectionDelegate {
    func speciesWasSelected(species: String) {
        selectedSpecies = species
        shuffleAnimals(species: species)
    }
}//End of Extension
