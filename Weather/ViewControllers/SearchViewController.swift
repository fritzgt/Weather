//
//  ViewController.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    //MARK: - Properties
    private var viewModel = SearchViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var lookupButton: UIButton!
    

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameTextField.delegate = self
        setupUI()
        
    }

    //MARK: - Private Methods
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)

        cityNameTextField.underlined()
        cityNameTextField.attributedPlaceholder = NSAttributedString(string: "City Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 15)])
        
        lookupButton.layer.borderColor = UIColor.gray.cgColor
        lookupButton.layer.borderWidth = 1
        lookupButton.layer.cornerRadius = 10
        
    }

    
    //MARK: - IBAction
    @IBAction func LookupButton(_ sender: UIButton) {
        if let city = cityNameTextField.text, city != "" {
            viewModel.fetchWeather(for: city)
            
        }else{
            cityNameTextField.placeholder = "Field cannot be blank"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableViewSegue"  {
            if let weatherVC = segue.destination as? WeatherTableViewController{
                weatherVC.viewModel = viewModel
                
                weatherVC.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
                weatherVC.navigationController?.navigationBar.tintColor = .white
                weatherVC.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if cityNameTextField.text != "" {
            cityNameTextField.text = ""
            cityNameTextField.placeholder = "City Name"
            return true
        }
        return false
    }
}


//MARK: - SearchViewController
extension SearchViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lookupButton.endEditing(true)
        return true
    }
    
}
