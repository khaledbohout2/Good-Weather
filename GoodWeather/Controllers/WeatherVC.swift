//
//  WeatherVC.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/6/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation
import UIKit

class WeatherVC : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell
        cell!.cityNameLbl.text = "Housten"
        cell!.tempLbl?.text = "70°"
        return cell!
    }
    
}
