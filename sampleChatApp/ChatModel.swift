//
//  ChatModel.swift
//  sampleChatApp
//
//  Created by Assem on 03/07/2023.
//

import Foundation

struct Chat: Identifiable{
    var id: UUID{ person.id }
    let person:Person
    var messages: [Message]
    var hashUnreadMessage = false
}

struct Person: Identifiable{
    let id = UUID()
    let name:String
    let imgString:String
    
}

struct Message: Identifiable{
    enum messageType{
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: messageType
    
    init(_ text: String, type: messageType, date: Date) {
        self.date = date
        self.text = text
        self.type = type
    }
    init(_  text: String, type: messageType) {
        self.init(text, type:type, date:Date())
    }
}

func sendMessage(_ text:String, in chat:Chat) -> Message?{
    var chats = Chat.sampleChat
    if let index = chats.firstIndex(where: {$0.id == chat.id}){
        let message = Message(text, type: .Sent)
        chats[index].messages.append(message)
        return message
    }
    return nil
}
extension Chat{
    
    static let sampleChat = [
        Chat(person: Person(name: "Ahmed", imgString: "person"), messages: [Message("Hey!", type: .Sent, date: Date()),Message("Hey!", type: .Received, date: Date()),Message("How are you?", type: .Sent, date: Date()),Message("Good and you?", type: .Received, date: Date())],hashUnreadMessage: true),
        Chat(person: Person(name: "Abdullah", imgString: "person"), messages: [Message("Great Job!", type: .Received, date: Date())],hashUnreadMessage: false),
        Chat(person: Person(name: "Amr", imgString: "person"), messages: [Message("Okay, meet you tonight!", type: .Received, date: Date())],hashUnreadMessage: true)
        ,
        Chat(person: Person(name: "Maryam", imgString: "person"), messages: [Message("Check my latest work here: Https://latestwork.com", type: .Received, date: Date())],hashUnreadMessage: true),
        Chat(person: Person(name: "Hassan", imgString: "person"), messages: [Message("How Are You?", type: .Received, date: Date())],hashUnreadMessage: true),
        Chat(person: Person(name: "Hussin", imgString: "person"), messages: [Message("I created the account!", type: .Received, date: Date())],hashUnreadMessage: false)
        ,
        Chat(person: Person(name: "0112993849", imgString: "person"), messages: [Message("lrem ipson traeo ops opsom ipsom lorem opasp trial pop test plom ipsom lorem opsa trial", type: .Received, date: Date())],hashUnreadMessage: false),
        Chat(person: Person(name: "Ali", imgString: "person"), messages: [Message("lrem ipson traeo ops opsom ipsom lorem opasp trial pop test plom ipsom lorem opsa trial", type: .Received, date: Date())],hashUnreadMessage: false),
        Chat(person: Person(name: "Moo", imgString: "person"), messages: [Message("lrem ipson traeo ops opsom ipsom lorem opasp trial pop test plom ipsom lorem opsa trial", type: .Received, date: Date())],hashUnreadMessage: false)
        
        
        
    ]
}


