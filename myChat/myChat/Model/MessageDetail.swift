//
//  File.swift
//  myChat
//
//  Created by Sunrise on 22/04/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

    import Foundation
    import Firebase
    import FirebaseDatabase
    import FirebaseStorage
    import SwiftKeychainWrapper

    class MessageDetail {
    

        private var _recipient: String!

    
        private var _messageKey: String!
        
        private var _messageRef: DatabaseReference!
        
        var currentUser = KeychainWrapper.standard.string(forKey: "uid")
        
        var recipient: String {
            
            return _recipient
        }
        
        var messageKey: String {
            
            return _messageKey
        }
        
        var messageRef: DatabaseReference {
            
            return _messageRef
            
        }
        
        init(recipient: String){
            _recipient = recipient
        }
        
        init(messageKey: String, messageData: Dictionary<String, AnyObject>) {
            
            _messageKey = messageKey
            
            if let recipient = messageData["recipient"] as? String {
                
                _recipient = recipient
            }
            
            _messageRef = Database.database().reference().child("recipient").child(_messageKey)
        }
        

}
