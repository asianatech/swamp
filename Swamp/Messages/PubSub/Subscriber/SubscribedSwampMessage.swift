//
//  SubscribedSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 24/08/2016.
//
//

import Foundation

/// [SUBSCRIBED, requestId|number, subscription|number]
class SubscribedSwampMessage: SwampMessage {
    
    let requestId: Int64
    let subscription: Int64
    
    init(requestId: Int64, subscription: Int64) {
        self.requestId = requestId
        self.subscription = subscription
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.requestId = payload[0] as! Int64
        self.subscription = payload[1] as! Int64
    }
    
    func marshal() -> [Any] {
        return [SwampMessages.subscribed.rawValue, self.requestId, self.subscription]
    }
}
