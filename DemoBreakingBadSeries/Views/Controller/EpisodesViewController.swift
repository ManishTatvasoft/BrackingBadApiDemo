//
//  EpisodesViewController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    private lazy var viewModel = EpisodeViewModel(self)
    var arrData             = [EpisodeModel]()

    @IBOutlet weak var tableEpisodes: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }


    func prepareView(){
        viewModel.callEpisodeApi()
        tableEpisodes.register(EpisodeCell.self, reuseIdentifier: "EpisodeCell")
    }
    
    func successApiResponse(_ data: [EpisodeModel]){
        arrData = data
        DispatchQueue.main.async {
            self.tableEpisodes.reloadData()
        }
        
        
    }
    
    
    @IBAction func btnCharacterTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard.episodes.get(CharacterViewController.self)!
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 200, height: 200)
        vc.arrCharecters = arrData[sender.tag].characters ?? []
        if let pres = vc.presentationController {
            pres.delegate = self
        }
        self.present(vc, animated: true)
        if let pop = vc.popoverPresentationController {
            pop.sourceView = (sender as UIView)
            pop.sourceRect = (sender as UIView).bounds
        }
        
//        present(ppc!, animated: true, completion: nil)
    }
}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EpisodeCell = tableView.dequeueReusableCell(for: indexPath)
        cell.characterButton.tag = indexPath.row
        cell.setupData(arrData[indexPath.row])
        return cell
    }
}

extension EpisodesViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
