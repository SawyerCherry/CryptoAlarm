//
//  SetAlarmView.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 10/4/21.
//

import SwiftUI

struct SetAlarmView: View {
    //@Binding var price: Double
    
    let didComplete: (CryptoAlarm) -> Void
    var crypto: CryptoRow
    @State private var targetPrice = ""
    
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                Text("Alert me when \(crypto.name)")
                HStack {
                    Text("Reaches a price of: ").multilineTextAlignment(.center).padding()
                    TextField("$0.00", text: $targetPrice).multilineTextAlignment(.center)
                }
                
                Button("Save") {
                    let newAlarm = CryptoAlarm(targetPrice: targetPrice, symbol: crypto.symbol)
                    didComplete(newAlarm)
                }
                
            }.navigationTitle("Set Alarm For \(crypto.name)")
        }
    }
}
