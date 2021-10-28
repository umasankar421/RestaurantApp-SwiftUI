//
//  ContentView.swift
//  Foolder
//
//  Created by Umashankar Buddi on 11/10/21.
//

import SwiftUI

struct OrderDetailsView: View {
    
    @StateObject private var viewModel = OrderDetailsViewModel()
    
    @State private var showOrderingOptions = false
    @State private var showDropPointOptions = false
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "lock.fill")
                    .frame(width: 8, height: 8, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(.aquaGreen)
                Text("Delivery locked-in")
                    .font(.system(size: 12))
                    .foregroundColor(.aquaGreen)
                    
            }.frame(maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
                .background(Color.aqua)
            
            HStack{
                Text("STEP 2/2")
                    .font(.system(size: 10))
                    .foregroundColor(.aquaGreen)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 8))
            HStack {
                Text("Submit your order details")
                    .font(.system(size: 20))
                Spacer()
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 8))
            TextInputView(title: "Pickup from", defaultValue: "Tony", type: .textOnly)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            TextInputView(title: "Order name", defaultValue: viewModel.name, placeholder: "Please enter order name")
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            TextInputView(title: "Ordered using", defaultValue: viewModel.orderSource, type:.picker, placeholder: "Please select ordered using")
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                .onTapGesture {
                    self.showOrderingOptions = true
                }
                .actionSheet(isPresented: $showOrderingOptions) {
                    ActionSheet(title: Text("Select Drop Point"), message: Text(""), buttons: self.viewModel.orderingOptions.map({ element in
                        ActionSheet.Button.default(Text(element)) {
                            self.showOrderingOptions = false
                            self.viewModel.orderSource = element
                        }
                    }))
                }
            
            TextInputView(title: "Drop Point", defaultValue: viewModel.dropPoint, type: .picker, placeholder: "Please select drop point")
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                .onTapGesture {
                    self.showDropPointOptions = true
                }
                .actionSheet(isPresented: $showDropPointOptions) {
                    ActionSheet(title: Text("Select Drop Point"), message: Text(""), buttons: self.viewModel.dropPoints.map({ element in
                        ActionSheet.Button.default(Text(element)) {
                            self.showDropPointOptions = false
                            self.viewModel.dropPoint = element
                        }
                    }))
                }
            
            VStack {
                TextEditor(text: $viewModel.message)
                    .border(Color.gray1, width: 0.5)
                    .font(.system(size: 16))
                    .foregroundColor(.gray1)
            }
            .frame(height: 150, alignment: .topLeading)
            .padding()
            Text("Order number if any, special instructions, etc.")
                .font(.system(size: 10))
                .foregroundColor(.gray1)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 48, trailing: 0))
            
            
            
            Button("SUBMIT DETAILS") {
                
            }
            .padding(EdgeInsets(top: 16, leading: 64, bottom: 16, trailing: 64))
            .foregroundColor(.white)
            .background(Color.pineGreen)
            .font(.system(size: 12))
            .cornerRadius(10)
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Order Details")
                            .font(.system(size: 14))
                            .bold()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "list.bullet")
                    }
                }
            }
    }
        
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}




