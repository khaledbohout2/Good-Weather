//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/6/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    
    func addWeather(vm: weatherViewModel)
}

class AddCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTxF: BindingTextField! {
        didSet {
            cityNameTxF.bind {self.addCityViewModel.city  =  $0}
        }
    }
    
    @IBOutlet weak var stateTextField: BindingTextField! {
           didSet {
               stateTextField.bind {self.addCityViewModel.state  =  $0}
           }
       }
    
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
           didSet {
               zipCodeTextField.bind {self.addCityViewModel.zipCode  =  $0}
           }
       }
    
    var delegete: AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        if let city = cityNameTxF.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b4bfb74e67f7412186268b023cd95e00")!
            
            let weatherResource = Resource<weatherViewModel>(url: weatherURL) {data in
                
                let weatherVM = try! JSONDecoder().decode(weatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { result in
                if let delegate = self.delegete {
                    delegate.addWeather(vm: result!)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
