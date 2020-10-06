//
//  ViewController.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import UIKit
import MBProgressHUD

class ViewController: UITableViewController {
    
    // MARK: - Properties
    var nycSchools: [NYCSchool] = []
    
}

// MARK: - Lifecycle
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.fetchNYCSchools()
    }
}

// MARK: - Functions
extension ViewController {
    
    func initView() {
        self.tableView.register(NYCSchoolCell.nib, forCellReuseIdentifier: NYCSchoolCell.identifier)
    }
    
    func fetchNYCSchools() {
        let hud = MBProgressHUD.showAdded(to: self.navigationController!.view, animated: true)
        hud.label.text = "Loading..."
        hud.isUserInteractionEnabled = false
        
        APIs.NYCSchool.getItems { (nycSchools, error) in
            if let error = error {
                print(error)
                
                MBProgressHUD.hide(for: self.navigationController!.view, animated: true)
                return
            }
            
            // assign data
            self.nycSchools = nycSchools!
            
            // refresh
            self.refreshView()
            
            MBProgressHUD.hide(for: self.navigationController!.view, animated: true)
        }
    }
    
    func refreshView() {
        // reload tableview
        self.tableView.reloadData()
    }
}


// MARK: - Actions
extension ViewController {
    
    func didSelectItem(_ item: NYCSchool) {
        let hud = MBProgressHUD.showAdded(to: self.navigationController!.view, animated: true)
        hud.label.text = "Loading..."
        hud.isUserInteractionEnabled = false
        
        APIs.SATScores.getItemOfDBN(item.dbn) { (satScores, error) in
            if let error = error {
                print(error)
                
                MBProgressHUD.hide(for: self.navigationController!.view, animated: true)
                return
            }
            
            guard let satScores = satScores else {
                print("The matching sat scores not found!")
                
                MBProgressHUD.hide(for: self.navigationController!.view, animated: true)
                
                // display api error message
                let alertController = UIAlertController(title: "Data Error", message: "The matching sat scores of the school - \(item.school_name) not found!", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            let additionalInformationViewController = AdditionalInformationViewController.instance(satScores: satScores)
            self.navigationController?.pushViewController(additionalInformationViewController, animated: true)
            
            MBProgressHUD.hide(for: self.navigationController!.view, animated: true)
        }
    }
}

// MARK: - TableViewDelegate
extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nycSchools.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NYCSchoolCell.identifier) as! NYCSchoolCell
        
        let item = self.nycSchools[indexPath.row]
        cell.data = item
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let item = self.nycSchools[indexPath.row]
        self.didSelectItem(item)
    }
}
