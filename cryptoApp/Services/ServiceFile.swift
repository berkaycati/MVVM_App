//
//  ServiceFile.swift
//  cryptoApp
//
//  Created by Berkay on 31.10.2022.
//

import Foundation

class Webservice {
    func downloadCurrency(url: URL, completion: @escaping ([CryptoModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
            
        }.resume()
        
    }
}
