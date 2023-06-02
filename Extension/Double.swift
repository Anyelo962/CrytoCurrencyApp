//
//  Double.swift
//  CrytoCurrencyApp
//
//  Created by Anyelo Vinzen on 30/5/23.
//

import Foundation

extension Double{
    private var currencyFormater: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        
        return formatter
    }
    
    
    private var numberFormmatter: NumberFormatter{
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    
    func toCurrency() -> String{
        return currencyFormater.string(for: self) ?? "$0.00"
    }
    
    
    func toPercentString() -> String{
        
        guard let numberAsString = numberFormmatter.string(for:self) else {return ""}
        
        return numberAsString + "%"
    }
}
