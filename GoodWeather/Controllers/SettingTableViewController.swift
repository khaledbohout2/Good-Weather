//
//  SettingTableViewController.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/14/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingViewModel)
}

class SettingTableViewController: UITableViewController {
    
    var settingViewModel = SettingViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingViewModel.units[indexPath.row]
        let cell = tableView
        .dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        if settingsItem == self.settingViewModel.selectedUnit {
            cell.accessoryType  = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            tableView.visibleCells.forEach { cell in
                cell.accessoryType = .none
            }
            
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingViewModel.selectedUnit = unit
        }
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    @IBAction func doneBtnTapped(_ sender: Any) {
        
        if let delegate = self.delegate {
            delegate.settingsDone(vm: self.settingViewModel)
        }
        self.dismiss(animated: true, completion: nil)
            
    }
    
}
