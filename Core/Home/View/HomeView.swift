//
//  HomeView.swift
//  CrytoCurrencyApp
//
//  Created by Anyelo Vinzen on 25/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        @StateObject var viewModel = HomeViewModel()
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                //Top mover view
                
                TopMoversView(viewModel: viewModel)
            
                Divider()
                
                //All coin view
                AllCoinsView(viewModel : viewModel)
            }.navigationTitle("Live Prices")
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//
//    }
//}
