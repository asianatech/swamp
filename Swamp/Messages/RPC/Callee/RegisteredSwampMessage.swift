//
//  RegisteredSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [REGISTERED, requestId|number, registration|number]
class RegisteredSwampMessage: SwampMessage {
    
    let requestId: Int64
    let registration: Int64
    
    init(requestId: Int64, registration: Int64) {
        self.requestId = requestId
        self.registration = registration
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! Int64
        self.registration = payload[1] as! Int64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.registered.rawValue, self.requestId, self.registration]
    }
}
