//
//  UnsubscribedSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 24/08/2016.
//
//

import Foundation

/// [UNSUBSCRIBED, requestId|number]
class UnsubscribedSwampMessage: SwampMessage {
    
    let requestId: Int64
    
    init(requestId: Int64) {
        self.requestId = requestId
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! Int64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.unsubscribed.rawValue, self.requestId]
    }
}
