//
//  ContentView.swift
//  sampleChatApp
//
//  Created by Assem on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let chats = Chat.sampleChat
        NavigationView{
            List{
                ForEach(chats){chat in
                    
                    NavigationLink(destination:{
                        ChatViewModel(chat: chat, messageText: "")
                    }){
                        
                        ChatRow(chat: chat)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("edit")
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
