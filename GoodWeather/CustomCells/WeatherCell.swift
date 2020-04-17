//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/8/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ weatherVM:weatherViewModel)  {
        self.cityNameLbl.text = "\(weatherVM.name.value)"
        self.tempLbl?.text = "\(weatherVM.currentTemperature.temperature.value.formatAsDegree)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
