//
//  OrderDetailsViewModel.swift
//  Foolder
//
//  Created by Umashankar Buddi on 12/10/21.
//

import Foundation

final class OrderDetailsViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var orderSource: String = ""
    @Published var dropPoint: String = ""
    @Published var message: String = "Message for your neighbour"
    
    
    var dropPoints: [String] {
        return ["Gate 2", "Gate 3", "Church street entrance"]
    }
    
    var orderingOptions: [String] {
        return ["Open in browser", "Google maps", "Doordash", "Uber Eats", "Postmates"]
    }
}
