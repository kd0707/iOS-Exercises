//
//  Logable.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 24/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
protocol Loggable {
//    func isValidUserName(username:String) -> Bool
//    func isValidPassword(password:String) -> Bool
    func isLoggedIn() -> Bool
    func logout()
}

extension Loggable {
    
    func isLoggedIn() -> Bool{
        let status = UserDefaults.standard.bool(forKey: "LOGIN_STATUS") ?? false
        return status
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "LOGIN_STATUS")
    }
}
