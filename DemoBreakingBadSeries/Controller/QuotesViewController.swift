//
//  QuotesViewController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import UIKit

class QuotesViewController: UIViewController {

    private lazy var viewModel = QuotesViewModel(self)
    var arrData                = [QuotesModel]()

    @IBOutlet weak var tableQuotes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView(){
        viewModel.callQoutesApi()
        tableQuotes.register(QuotesCell.self, reuseIdentifier: "QuotesCell")
    }
    
    func successApiResponse(_ data: [QuotesModel]){
        arrData = data
        DispatchQueue.main.async {
            self.tableQuotes.reloadData()
        }
    }

}

extension QuotesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: QuotesCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupData(arrData[indexPath.row])
        return cell
    }
}
