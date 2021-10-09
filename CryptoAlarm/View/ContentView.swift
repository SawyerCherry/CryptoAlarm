//
//  ContentView.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 9/24/21.
//

import SwiftUI



struct CryptoAlarm: Identifiable, Codable {
    var id: String {
        return symbol
    }
    let targetPrice: String
    let symbol: String
}

class ViewModel: ObservableObject {
    @Published var savedAlarms = [CryptoAlarm]()
    
    func save() {
        let jsonEncoder = JSONEncoder()
            if let savedData = try? jsonEncoder.encode(savedAlarms) {
                let defaults = UserDefaults.standard
                defaults.set(savedData, forKey: "alarms")
            } else {
                print("Failed to save alarms.")
            }
    }
    
    func load() {
        let defaults = UserDefaults.standard

        if let savedAlarms = defaults.data(forKey: "alarms") {
            let jsonDecoder = JSONDecoder()

            do {
                self.savedAlarms = try jsonDecoder.decode([CryptoAlarm].self, from: savedAlarms)
            } catch {
                print("Failed to load alarms")
            }
        }
    }
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
                    viewModel.save()
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
        .onAppear {
            viewModel.load()
        }
        
    }
}






