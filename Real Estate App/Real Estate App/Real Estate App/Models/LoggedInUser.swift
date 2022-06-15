//
//  LoggedInUser.swift
//  Real Estate App
//
//  Created by arifashraf on 31/12/21.
//

import Foundation
import CoreData

class LoggedInUser {
    
    var currentUser: User?
    var fetch = User.fetchRequest()
    static let shared = LoggedInUser()
    
    private init(){
        
    }
}
