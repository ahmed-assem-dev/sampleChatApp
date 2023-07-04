//
//  ChatViewModel.swift
//  sampleChatApp
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI

struct ChatViewModel: View {
    @State var chat:Chat
    @State var messageText:String
    var body: some View {
        VStack {
            List(chat.messages) { message in
                if(message.type == .Sent){
                    HStack{
                        Spacer()
                        Text(message.text)
                            .padding(20)
                            .background(.green)
                            .cornerRadius(20)
                    }
                }else{
                    HStack{
                        Text(message.text)
                            .padding(20)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            
                    HStack {
                        TextField("Type a message", text: $messageText)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(.horizontal)
                        Button(action: sendMessage) {
                            Text("Send")
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                HStack{
                    Button(action: {print("video")}){
                        Image(uiImage: UIImage(systemName: "video")!)
                    }
                    Button(action: {print("call")}){
                        Image(uiImage: UIImage(systemName: "phone")!)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {print("View Detials")}){
                    Image(uiImage: UIImage(systemName: chat.person.imgString)!)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .padding(5)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 1))
                    Text(chat.person.name)
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
            }
        }.padding(5)
        
    }
    func sendMessage(){
        let message = Message(messageText, type: .Sent)
        chat.messages.append(message)
        messageText = ""
    }
    
    
    struct ChatViewModel_Previews: PreviewProvider {
        static var previews: some View {
            ChatViewModel(chat: Chat.sampleChat[0], messageText: "")
        }
    }
}
