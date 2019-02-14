//
//  UnregisteredSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [UNREGISTERED, requestId|number]
class UnregisteredSwampMessage: SwampMessage {
    
    let requestId: Int64
    
    init(requestId: Int64) {
        self.requestId = requestId
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! Int64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unregistered.rawValue, self.requestId]
    }
}
