//
//  NYCSchoolCell.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import UIKit

class NYCSchoolCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var data: NYCSchool? {
        didSet {
            
            // initialize
            self.schoolNameLabel.text = nil
            self.cityLabel.text = nil
            
            // display data
            if let data = self.data {
                self.schoolNameLabel.text = data.school_name
                self.cityLabel.text = data.city
            }
        }
    }
    
    static let identifier = "NYCSchoolCell"
    static let nib = UINib(nibName: "NYCSchoolCell", bundle: nil)
}
