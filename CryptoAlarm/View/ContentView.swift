//
//  ContentView.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 9/24/21.
//

import SwiftUI



struct CryptoAlarm: Identifiable {
    let id = UUID()
    let targetPrice: String
    let symbol: String
}

class ViewModel: ObservableObject {
    @Published var savedAlarms = [CryptoAlarm]()
}


struct ContentView: View {
    
    //: MARK: - Properties
    @StateObject var viewModel = ViewModel()
    
    @State private var isShowingCryptoList: Bool = false
    

    
    //: MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("", destination: CryptoListView(closure: { newAlarm in
                    viewModel.savedAlarms.append(newAlarm)
                    isShowingCryptoList = false
                }), isActive: $isShowingCryptoList)
                    .hidden()
                
                List {
                    ForEach(viewModel.savedAlarms) { crypto in
                        AlarmView(crypto: crypto)
                    }
                
                }
             
            }
            .navigationBarTitle("Crypto Alarm", displayMode: .large)

            .navigationBarItems(trailing: Button(action: {
                self.isShowingCryptoList = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(Color.green)
            }))
        }
        
    }
}






