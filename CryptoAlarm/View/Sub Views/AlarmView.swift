//
//  AlarmView.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 10/1/21.
//

import SwiftUI

struct AlarmView: View {
    
    @State private var isOn: Bool = true
    let crypto: CryptoAlarm
    
    var body: some View {
        HStack {
            VStack {
                Text(crypto.symbol)
                    .font(.system(.title, design: .rounded))
                    .underline()
                    .foregroundColor(Color.orange)
                
                Group {
                    Text("Alarm Price:\n \(crypto.targetPrice)")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .padding(4)
                }
                .background(Color.orange)
                .cornerRadius(10)
                    
            }
        
            Group {
                Toggle(isOn: $isOn, label: {Text("")})
                    .padding(.trailing)
            }
        }
        .padding()
        
        
        
    }
      
}


