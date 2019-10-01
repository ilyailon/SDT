//
//  MessagesCell.swift
//  myChat
//
//  Created by Sunrise on 24/04/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var recievedMessageLbl: UILabel!
    
    @IBOutlet weak var recievedMessageView: UIView!
    
    @IBOutlet weak var sentMessageLbl: UILabel!
    
    @IBOutlet weak var sentMessageView: UIView!
    
    var message: Message!
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configCell(message: Message) {
        self.message = message
        
        if message.sender == currentUser {
            
            sentMessageView.isHidden = false
            
            sentMessageLbl.text = message.message
            
            recievedMessageLbl.text = ""
            
            recievedMessageLbl.isHidden = true
        } else {
            
            sentMessageView.isHidden = true
            
            sentMessageLbl.text = ""
            
            recievedMessageLbl.text =  message.message
            
            recievedMessageLbl.isHidden = false
            
            
        }
        
    }
}

