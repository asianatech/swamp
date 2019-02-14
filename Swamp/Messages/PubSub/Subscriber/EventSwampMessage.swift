//
//  EventSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 24/08/2016.
//
//

import Foundation

/// [EVENT, subscription|number, publication|number, details|dict, args|list?, kwargs|dict?]
class EventSwampMessage: SwampMessage {
    
    let subscription: Int64
    let publication: Int64
    let details: [String: AnyObject]
    
    let args: [AnyObject]?
    let kwargs: [String: AnyObject]?
    
    init(subscription: Int64, publication: Int64, details: [String: AnyObject], args: [AnyObject]?=nil, kwargs: [String: AnyObject]?=nil) {
        self.subscription = subscription
        self.publication = publication
        self.details = details
        
        self.args = args
        self.kwargs = kwargs
    }
    
    // MARK: SwampMessage protocol
    
    required init(payload: [Any]) {
        self.subscription = payload[0] as! Int64
        self.publication = payload[1] as! Int64
        self.details = payload[2] as! [String: AnyObject]
        self.args = payload[safe: 3] as? [AnyObject]
        self.kwargs = payload[safe: 4] as? [String: AnyObject]
    }
    
    func marshal() -> [Any] {
        var marshalled: [Any] = [SwampMessages.event.rawValue, self.subscription, self.publication, self.details]
        
        if let args = self.args {
            marshalled.append(args)
            if let kwargs = self.kwargs {
                marshalled.append(kwargs)
            }
        } else {
            if let kwargs = self.kwargs {
                marshalled.append([])
                marshalled.append(kwargs)
            }
        }
        
        return marshalled
    }
}
