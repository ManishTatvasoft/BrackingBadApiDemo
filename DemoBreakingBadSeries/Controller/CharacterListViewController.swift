//
//  CharacterListViewController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    @IBOutlet weak var collectionCharacter: UICollectionView!
    var arrayData = [CharacterModel]()
    private lazy var viewModel = CharacterViewModel(self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()
    }
    
    
    func prepareView(){
        viewModel.callCharacterApi()
        collectionCharacter.register(CharecterCell.self)
    }
    
    func successApiResponse(_ characterdata: [CharacterModel]){
        arrayData = characterdata
        DispatchQueue.main.async {
            self.collectionCharacter.reloadData()
        }
    }

}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharecterCell", for: indexPath) as! CharecterCell
        cell.setupData(arrayData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 2
        let height = width * 1.31
        
        return CGSize(width: width, height: height)
    }
    
}
