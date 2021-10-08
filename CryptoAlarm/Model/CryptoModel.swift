//
//  CryptoModel.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 9/29/21.
//

import Foundation
// root.data.quote.usd.price

struct Crypto: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case symbol
        case quote
        
    }
    
    var id: Int
    var name: String
    var symbol: String
    var quote: Quote

}

struct Quote: Decodable {
    var USD: Currency
}

struct Currency: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case price
        case percentChangeOver24h = "percent_change_24h"
    }
    
    var price: Double
    var percentChangeOver24h: Double
}



//root
struct CryptoList: Decodable {
    var data: [Crypto]
}
