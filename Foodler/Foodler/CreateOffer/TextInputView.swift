//
//  TextInputView.swift
//  Foolder
//
//  Created by Umashankar Buddi on 11/10/21.
//

import SwiftUI

struct TextInputView: View {
    
    @State var title: String = ""
    private let height: CGFloat = 36
    @State var defaultValue: String = "Somevalue"
    var keyboardType: UIKeyboardType = .emailAddress
    var type: TextInputViewType = .textField
    var placeholder: String = ""
    var values: [String] = [String]()
    
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 12))
                        .foregroundColor(.gray1)
                    TextField(placeholder, text: $defaultValue)
                        .disabled(type != .textField)
                        .keyboardType(keyboardType)
                        .foregroundColor(type == .textOnly ? .gray1: .black)
                    Spacer()
                }
                if type == .picker {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
            .background(type == .textOnly ? Color.lightGrayBG : Color.white)
            
        }
        .cornerRadius(2)
        .border(Color.gray, width: 0.5)
    }
}

enum TextInputViewType {
    case textOnly
    case textField
    case picker
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
