//
//  RestaurantListItemView.swift
//  Foodler
//
//  Created by Umashankar Buddi on 25/10/21.
//

import SwiftUI

struct RestaurantListItemView: View {
    @State var restaurant: Restaurant
    
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 60, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.gray1, width: 0.5)
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .bold()
                    .font(.system(size: 16))
                Text(restaurant.address)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct RestaurantListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListItemView(restaurant: Restaurant(image: "photo-1", name: "Restaurant Name", address: "Some Street"))
    }
}
