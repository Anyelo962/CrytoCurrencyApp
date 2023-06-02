//
//  AllCoinsView.swift
//  CrytoCurrencyApp
//
//  Created by Anyelo Vinzen on 25/5/23.
//

import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        VStack(alignment: .leading){
            Text("All coins view")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coins")
                
                Spacer()
                
                Text("Prices")
                
            }.foregroundColor(.gray)
                .font(.caption)
                .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}
//
//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
