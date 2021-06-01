//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by FGT MAC on 5/29/21.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    //MARK: - Properties
    var viewModel: SearchViewModel?
    
    
    //MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.weatherCount ?? 0
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)

        setupCellUI(for: cell)
        
        // Configure the cell...
        let weatherData = viewModel?.getTableViewData(for: indexPath.row)
        
        cell.textLabel?.text = weatherData?.condition
        cell.detailTextLabel?.text = weatherData?.temp
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.setDetailsForSelectedRow(for: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            if let detailVC = segue.destination as? DetailViewController{
                detailVC.viewModel = viewModel
            }
        }
    }

    //MARK: - Private Methods
    private func setupUI()  {
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        
        
        tableView.rowHeight = 60
        
    }
    
    
    private func setupCellUI(for cell: UITableViewCell) {
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
}

extension WeatherTableViewController: WeatherDelegate{
    
    func isDataSet() {
        tableView.reloadData()
        activityIndicator.isHidden = true
    }
}
