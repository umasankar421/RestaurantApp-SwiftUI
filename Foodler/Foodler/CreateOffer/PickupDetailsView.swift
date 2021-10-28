//
//  PickupDetailsView.swift
//  Foodler
//
//  Created by Umashankar Buddi on 25/10/21.
//

import SwiftUI

struct PickupDetailsView: View {
    
    
    @State private var nearDoorRestaurantsEnabled = true
    @State private var expire: Int = 15
    var body: some View {
        VStack {
            HStack {
                Text("Pickup details")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding()
            
            List {
                HStack {
                    Text("Restaurant")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                    Spacer()
                    Text("Otoro Sushi")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                HStack {
                    Text("Location")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                    Spacer()
                    Text("1355 Market St")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                HStack {
                    Text("Offer for")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                    Spacer()
                    Text("Parkmerced")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                HStack {
                    Text("Credits earned")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                    Spacer()
                    Text("+10")
                        .foregroundColor(.darkGreyText)
                        .font(.system(size: 16))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Toggle(isOn: $nearDoorRestaurantsEnabled) {
                    Text("Include restaunrants near door")
                        .font(.system(size: 16))
                    Image(systemName: "info.circle.fill")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Stepper(value: $expire, in: 15...60) {
                    Text("Offer expired in")
                        .font(.system(size: 16))
                    Image(systemName: "info.circle.fill")
                    Spacer()
                    Text("\(expire) mins")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Text("That means you should plan to be at the restaurant around 5:15pm")
                    .foregroundColor(.darkGreyText)
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 48, trailing: 0))
                
            }
            
            HStack {
                Spacer()
                Button("CREATE OFFER") {
                    
                }
                .padding(EdgeInsets(top: 16, leading: 64, bottom: 16, trailing: 64))
                .foregroundColor(.white)
                .background(Color.pineGreen)
                .font(.system(size: 12, weight: .bold, design: .default))
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct PickupDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PickupDetailsView()
    }
}

