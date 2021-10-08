//
//  APIClient.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 9/30/21.
//

import Foundation


class CryptoNetwork: ObservableObject {
    @Published var cryptoRow = [CryptoRow]()
    var baseURL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    
    let parameters = [
           "start": 1,
           "limit": 100,
           "convert": "USD"
           
    ] as [String : Any]
    
    let headers = [
        "Accept": "application/json",
        "X-CMC_PRO_API_KEY": "a6ef4da4-d6c5-4377-83fa-62c1fe9ff66a"
    ]
    
    
    
    init() {
        findCrypto()
    }
    
    func findCrypto() {
        guard let url = URL(string: baseURL) else { return }

        // request with  URL
        
        var request = URLRequest(url: url)
        
        // need to add the authentication header
        
        Encoder.setHeaders(for: &request, with: headers)
        
        // need to add header  Accept: applcation/json
        
        Encoder.encodeParameters(for: &request, with: parameters)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let cryptoList = try JSONDecoder().decode(CryptoList.self, from: data)
                DispatchQueue.main.async {
                    
                    self.cryptoRow = cryptoList.data.map({ crypto -> CryptoRow in
                       return CryptoRow(
                            symbol: crypto.symbol,
                            name: crypto.name,
                            price: crypto.quote.USD.price,
                            percentChangeOver24h: crypto.quote.USD.percentChangeOver24h)
                    })
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


struct CryptoRow: Identifiable {
    var id: String {
        return symbol
    }
    
    let symbol: String
    let name: String
    let price: Double
    let percentChangeOver24h: Double
}
