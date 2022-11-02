//
//  CryptoViewModel.swift
//  cryptoApp
//
//  Created by Berkay on 1.11.2022.
//

import Foundation

struct CryptoListViewModel {
    
    let cryptoViewModelList : [CryptoModel]
    
}

extension CryptoListViewModel {
    
    func numbersOfRowSection() -> Int {
        return self.cryptoViewModelList.count
    }
    
    func cyrptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoViewModelList[index]
        return CryptoViewModel(cyrptoCurrency: crypto)
    }
}

    
struct CryptoViewModel {
    
    let cyrptoCurrency : CryptoModel
   
}

extension CryptoViewModel {
    
    var name : String {
        return self.cyrptoCurrency.currency
    }
    var price : String {
        return self.cyrptoCurrency.price
    }
}


