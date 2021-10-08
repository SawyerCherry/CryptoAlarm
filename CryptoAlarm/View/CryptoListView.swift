//
//  CryptoListView.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 10/1/21.
//

import SwiftUI

struct CryptoListView: View {
    //: MARK: - Properties
    var closure: (CryptoAlarm) -> Void
    @ObservedObject var viewModel = CryptoNetwork()
    var body: some View {
        List {
            ForEach(viewModel.cryptoRow) { cryptoRow in
                NavigationLink(destination: SetAlarmView(didComplete: closure, crypto: cryptoRow)) {
                    RowView(crypto: cryptoRow)
                        .padding(.vertical, 4)
                }
             
            }
        }
        .navigationBarTitle("Crypto Alarm", displayMode: .inline)
    }
}


