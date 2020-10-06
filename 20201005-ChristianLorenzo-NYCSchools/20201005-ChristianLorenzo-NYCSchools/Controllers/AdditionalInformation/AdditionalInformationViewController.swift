//
//  AdditionalInformationViewController.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import UIKit

class AdditionalInformationViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var satTestTakersCountLabel: UILabel!
    @IBOutlet weak var satMathScoreLabel: UILabel!
    @IBOutlet weak var satReadingScoreLabel: UILabel!
    @IBOutlet weak var satWritingScoreLabel: UILabel!

    // MARK - Properties
    var satScores: SATScores?
}

// MARK: - Lifecycle
extension AdditionalInformationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.refreshView()
    }
}

// MARK: - Functions
extension AdditionalInformationViewController {
    
    class func instance(satScores: SATScores) -> AdditionalInformationViewController {
        let storyboard = UIStoryboard.init(name: "AdditionalInformation", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AdditionalInformation") as! AdditionalInformationViewController
        viewController.satScores = satScores
        return viewController
    }
    
    func initView() {
        self.title = "SAT Scores"
    }
    
    func refreshView() {
        self.schoolNameLabel.text = satScores?.school_name
        self.satTestTakersCountLabel.text = "Num of test takers: " + satScores!.num_of_sat_test_takers
        self.satMathScoreLabel.text = "Math AVG score: " + satScores!.sat_math_avg_score
        self.satReadingScoreLabel.text = "Reading AVG score: " + satScores!.sat_critical_reading_avg_score
        self.satWritingScoreLabel.text = "Writing AVG score: " + satScores!.sat_writing_avg_score
    }
}
