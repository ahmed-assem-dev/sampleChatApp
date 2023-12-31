//
//  ChatRow.swift
//  sampleChatApp
//
//  Created by Assem on 03/07/2023.
//

import SwiftUI

struct ChatRow: View {
    let chat:Chat
    var body: some View {
        HStack(spacing: 20){
            let image = UIImage(systemName: chat.person.imgString)
            Image(uiImage: image!)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(chat.person.name)
                            .bold()
                        Spacer()
                        Text(chat.messages.last?.date.description ?? "")
                    }
                    HStack{
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray )
                            .lineLimit(2)
                            .frame(height: 50,alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing,40)
                    }
                }
                Circle()
                    .foregroundColor(chat.hashUnreadMessage ? .blue : .clear)
                    .frame(width: 20,height: 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(height: 80)
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
