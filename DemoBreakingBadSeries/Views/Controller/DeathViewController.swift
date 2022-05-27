//
//  DeathViewController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import UIKit

class DeathViewController: UIViewController {

    
    private lazy var viewModel = DeathViewModel(self)
    var arrData                = [DeathModel]()

    @IBOutlet weak var tableDeaths: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView(){
        viewModel.callDeathsApi()
        tableDeaths.register(DeathsCell.self, reuseIdentifier: "DeathsCell")
    }
    
    func successApiResponse(_ data: [DeathModel]){
        arrData = data
        DispatchQueue.main.async {
            self.tableDeaths.reloadData()
        }
    }

    
}


extension DeathViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DeathsCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupData(arrData[indexPath.row])
        return cell
    }
}
