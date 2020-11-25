//
//  HomeView.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack{
            CustomColor.bgColor
            VStack{
                ZStack{
                    CustomColor.bgColor
                    RoundedBackground()
                    ProgressBar()
                }
                .frame(width: UIScreen.main.bounds.width, height: 250)
                .edgesIgnoringSafeArea(.top)
                DateSelectionVIew()
                GoalList()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
