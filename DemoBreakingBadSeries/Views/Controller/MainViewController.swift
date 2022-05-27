//
//  MainViewController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var viewModel = MainViewModel(self)
    lazy var navigator         = MainNavigator(self)
    var arrAllData             = [String]()

    @IBOutlet weak var tableAllData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    func prepareView(){
        viewModel.callMainApi()
        tableAllData.register(MainCell.self, reuseIdentifier: "MainCell")
    }
    
    func successApiResponse(_ mainData: MainModel){
        let mirror = Mirror(reflecting: mainData)
        
        for child in mirror.children{
            arrAllData.append(child.label ?? "")
        }
        
        DispatchQueue.main.async {
            self.tableAllData.reloadData()
        }
        
        
    }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAllData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
        cell.numberLabel.text = "\(indexPath.row + 1)."
        cell.titleLabel.text = arrAllData[indexPath.row].uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableAllData.deselectRow(at: indexPath, animated: true)
        navigator.moveToCharecterListScreen(at: indexPath.row)
    }
    
}

