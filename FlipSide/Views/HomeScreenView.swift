//
//  HomeScreenView.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/12/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    let tealColor = #colorLiteral(red: 0, green: 0.6784313725, blue: 0.7098039216, alpha: 1)
   @State private var tabSelection:Int = 0
    var body: some View {
        ZStack{
         
            TabView(selection: $tabSelection){
                
                GameView()
                    .tabItem {
                        Image(systemName: "house")
                        .tag(0)
                    }
          
                SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .tag(1)
                    }
         
            }
                .accentColor(Color("OnboardingColor"))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
