//
//  ThankyouNotesView.swift
//  Foodler
//
//  Created by Umashankar Buddi on 28/10/21.
//

import SwiftUI

struct ThankyouNotesView: View {
    
    private var notes = [ThankYouNote(image: "note1", message: "You are the best!", username: "Del Silva", address: "NEMA Resident", userImage: "user1"),
                         ThankYouNote(image: "note2", message: "You are the best!", username: "Del Silva", address: "NEMA Resident", userImage: "user2"),
                         ThankYouNote(image: "note1", message: "You are the best!", username: "Del Silva", address: "NEMA Resident", userImage: "user1"),
                                              ThankYouNote(image: "note2", message: "You are the best!", username: "Del Silva", address: "NEMA Resident", userImage: "user2")]
    
    @State private var singleSelection : UUID?
    var body: some View {
        List(selection: $singleSelection){
            ForEach(notes) { note in
                VStack {
                    HStack {
                        Image(note.userImage)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(note.username)
                                .font(.system(size: 16, weight: .bold, design: .default))
                            HStack {
                                Text(note.address)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .foregroundColor(.gray1)
                                Rectangle()
                                    .frame(width: 8, height: 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(4)
                                    .foregroundColor(.lightGray)
                                Text("03/11")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .foregroundColor(.gray1)
                            }
                            
                        }
                        Spacer()
                    }
                    ZStack {
                        VStack {
                            Image(note.image)
                            Text(note.message)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                        }
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 64, leading: 0, bottom: 64, trailing: 0))
                    .background(Color.lightGrayBG2)
                }
                
                
            }
        }
        
    }
}

struct ThankyouNotesView_Previews: PreviewProvider {
    static var previews: some View {
        ThankyouNotesView()
    }
}

struct ThankYouNote: Identifiable {
    let id = UUID()
    let image: String
    let message: String
    let username: String
    let address: String
    let userImage: String
}
