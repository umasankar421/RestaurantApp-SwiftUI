//
//  SelectRestaurantView.swift
//  Foodler
//
//  Created by Umashankar Buddi on 24/10/21.
//

import SwiftUI

struct SelectRestaurantView: View {
    
    @State var searchText: String = ""
    @State private var isEditing = false
    
    private var restaurants = [Restaurant(image: "photo-1", name: "Amarin Thai", address: "231 Franklin St"),
                               Restaurant(image: "photo-2", name: "Auntie Anne's", address: "2nd St"),
                               Restaurant(image: "sushi", name: "Ototo Sushi", address: "1355 Market St"),
                               Restaurant(image: "photo-1", name: "Amarin Thai", address: "231 Franklin St"),
                               Restaurant(image: "photo-2", name: "Auntie Anne's", address: "2nd St")]
    
    @State private var restaurantSections: [RestaurantSection] = [RestaurantSection]()
    @State private var singleSelection : UUID?
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                HStack {
                    Text("Select a Restaurant")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding()
                SearchBarView(text: $searchText)
                    .padding(.top, -16)
            }
            List(selection: $singleSelection){
                ForEach(restaurantSections) { section in
                    Section(header: HStack {
                        Text(section.title)
                            .foregroundColor(.gray1)
                            .font(.system(size: 14))
                        Spacer()
                    },
                    footer: Button(action: {
                        if let index = restaurantSections.firstIndex(where: { $0.id == section.id}) {
                            restaurantSections[index].isExpand.toggle()
                        }
                    }) {
                        HStack {
                            if section.isExpand {
                                //TODO: Change this title as per the requirement
                                Text("HIDE")
                                    .foregroundColor(.pineGreen)
                                    .font(.system(size: 12))
                                    .bold()
                                Spacer()
                            } else {
                                Text("SEE ALL")
                                    .foregroundColor(.pineGreen)
                                    .font(.system(size: 12))
                                    .bold()
                                Spacer()
                            }
                            
                        }
                    }) {
                        if section.isExpand {
                            ForEach(section.restaurants) { restaurant in
                                NavigationLink(
                                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                                    label: {
                                        RestaurantListItemView(restaurant: restaurant)
                                    })
                            }
                        } else {
                            //TODO: Make this as dynamic condition
                            // When there is only one restaurant or 2 restaurants this would fail
                            // handle accordingly.
                            ForEach(0...2, id: \.self) { index in
                                NavigationLink(
                                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                                    label: {
                                        RestaurantListItemView(restaurant: section.restaurants[index])
                                    })
                            }
                        }
                        
                    }
                }
            }
        }
        .onAppear(perform: {
            restaurantSections = [RestaurantSection(restaurants: restaurants, title: "RECENT"),
                                  RestaurantSection(restaurants: restaurants, title: "YOUR FAVORITES"),
                                  RestaurantSection(restaurants: restaurants, title: "COMMUNITY FAVORITES"),
                                  RestaurantSection(restaurants: restaurants, title: "TRENDING")]
        })
    }
}

struct SelectRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRestaurantView()
    }
}


struct RestaurantSection: Identifiable {
    let id = UUID()
    let restaurants: [Restaurant]
    let title: String
    var isExpand: Bool = false
}

struct Restaurant: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let address: String
}
