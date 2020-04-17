//
//  WeatherVC.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/6/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController : UITableViewController, AddWeatherDelegate {
    
    var weatherListViewModel  = WeatherListViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeather(vm: weatherViewModel) {
        print(vm.name)
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell!.configureCell(weatherVM)
        return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAddCityVC" {
            
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("navigation controller not founf")
        }
        guard let addCityVC = nav.viewControllers.first as? AddCityViewController else {
            fatalError("addCityVC not found")
        }
        addCityVC.delegete = self
            
        } else if segue.identifier == "toSettingVC"  {
            
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("navigation controller not founf")
            }
            guard let settingTableViewController = nav.viewControllers.first as? SettingTableViewController else {
                fatalError("addCityVC not found")
            }
            settingTableViewController.delegate = self
        } else if segue.identifier == "toWeatherDetails" {
            guard let weatherDetailsVC = segue.destination as? WeatherDetailsVC,
            let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
            weatherDetailsVC.weatherViewModel = weatherVM
        }
    }
    
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingViewModel) {
        
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}
