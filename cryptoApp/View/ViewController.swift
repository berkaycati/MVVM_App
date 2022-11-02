//
//  ViewController.swift
//  cryptoApp
//
//  Created by Berkay on 31.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel: CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getDataFromNet()
        
        colorArray = [
            UIColor(red: 123/255, green: 15/255, blue: 200/255, alpha: 1),
            UIColor(red: 23/255, green: 155/255, blue: 20/255, alpha: 1),
            UIColor(red: 13/255, green: 95/255, blue: 100/255, alpha: 1),
            UIColor(red: 193/255, green: 35/255, blue: 0, alpha: 1),
            UIColor(red: 53/255, green: 225/255, blue: 99/255, alpha: 1)
        ]
    }

    
    func getDataFromNet() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        Webservice().downloadCurrency(url: url!) { cryptoModels in
            if let cryptoModels = cryptoModels {
                self.cryptoListViewModel = CryptoListViewModel(cryptoViewModelList: cryptoModels)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        
        let cryoptoViewModel = cryptoListViewModel.cyrptoAtIndex(indexPath.row)
        cell.nameOfText.text = cryoptoViewModel.name
        cell.valueOfText.text = cryoptoViewModel.price
        cell.backgroundColor = colorArray[indexPath.row % 4]
        cell.valueOfText.textColor = UIColor.white
        cell.nameOfText.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numbersOfRowSection()
    }
}

