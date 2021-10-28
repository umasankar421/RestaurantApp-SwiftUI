//
//  IntialScreenView.swift
//  Foolder
//
//  Created by Umashankar Buddi on 11/10/21.
//

import SwiftUI

struct IntialScreenView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Order Details", destination: SelectRestaurantView())
        }
    }
}

struct IntialScreenView_Previews: PreviewProvider {
    static var previews: some View {
        IntialScreenView()
    }
}
