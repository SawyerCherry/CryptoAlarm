//
//  Row View.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 10/1/21.
//

import SwiftUI

struct RowView: View {
    //: MARK: - Properties
    let crypto: CryptoRow
  
    
    var body: some View {
        
        HStack {
            VStack {
                Text(crypto.name)
                    .font(.system(.footnote, design: .rounded))
                
                Text(crypto.symbol)
                    .font(.system(.title, design: .rounded))
            }.padding(.leading)
            
            Spacer()
            Text("\(crypto.price.rounded())")
            Spacer()
            Text("\(crypto.percentChangeOver24h)")
            Spacer()
            
        }
    }
}

