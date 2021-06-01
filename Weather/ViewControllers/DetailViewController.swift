//
//  DetailViewController.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: SearchViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    private func setLabels() {
        guard let weather = viewModel else { return }
        temperatureLabel.text = weather.temperature
        feelsLikeLabel.text = weather.feelsLike
        conditionsLabel.text = weather.condition
        detailsLabel.text = weather.conditionDetails
    }
}
