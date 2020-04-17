//
//  WeatherDetailsVC.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/16/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsVC: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    var weatherViewModel: weatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVMBinding()
    }
    
    func setUpVMBinding() {
        if let weatherVM = self.weatherViewModel {
            weatherViewModel?.name.bind { self.cityNameLbl.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.tempLbl.text = $0.formatAsDegree }
        }
    }
    
    
}
