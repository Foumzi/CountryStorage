//
//  ViewController.swift
//  CountryStorage
//
//  Created by Amine Nakhle on 27/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var countryList: [CountryResult] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        
        let country = countryList[indexPath.row]
        cell.setup(country: country)
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func getCountriesFromServer() {

       

        // Step 1: Declare the URL String
        let urlString = "https://restcountries.com/v3.1/all"

        // step 2: We convert the url string to an actual URL in Swift
        guard let url = URL(string: urlString) else { return }

        // step 3: Call the request

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data found")
        
                return
            }

            do {

                let countryResponse = try JSONDecoder().decode(CountryResult.self, from: data)
                
               
                self.countryList = countryResponse
              

                // We should always reload data only on the main thread!!!
                DispatchQueue.main.async {
                    // UI Related
                    self.tableView.reloadData()
                }


            } catch {
                print("Error couldn't retreive data")
            }

            
        }.resume()
    }

}




