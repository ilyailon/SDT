//
//  Message.swift
//  myChat
//
//  Created by Sunrise on 24/04/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

class Message {
    
    private var _message: String!
    
    private var _sender: String!
    
    private var _messageKey: String!
    
    private var _messageRef: DatabaseReference
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var message: String {
        return _message
    }
    
    var sender: String {
        return _sender
    }
    
    var messageKey: String {
    
        return _messageKey
    }
    
    init(message: String, sender: String ) {
        _message = message
        
        _sender = sender
        
        _messageRef = Database.database().reference().child("messages").child(_messageKey)
    }
    
    init(messageKey: String, postData: Dictionary<String, AnyObject>) {
        _messageKey = messageKey
        
        if let message = postData["message"] as? String {
            _message = message
        }
        
        if let sender = postData["sender"] as? String{
            _sender = sender
        }
        
        _messageRef = Database.database().reference().child("messages").child(_messageKey)
    }
}
