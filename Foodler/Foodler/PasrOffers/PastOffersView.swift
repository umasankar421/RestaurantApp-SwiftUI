//
//  PastOffersView.swift
//  Foodler
//
//  Created by Umashankar Buddi on 28/10/21.
//

import SwiftUI

struct PastOffersView: View {
    @State private var selectedTab: Int = 1
    var body: some View {
        VStack {
            HStack {
                Text("Past Offers")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding()
                Spacer()
            }
            
            
            Picker("", selection: $selectedTab) {
                Text("Completed Offers").tag(0)
                Text("ThankYou notes").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            switch(selectedTab) {
            case 0: CompletedOffersView()
            case 1: ThankyouNotesView()
            default: Text("Nothing")
                
            }
            
            Spacer()
        }
    }
}

struct PastOffersView_Previews: PreviewProvider {
    static var previews: some View {
        PastOffersView()
    }
}
