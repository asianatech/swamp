//
//  PublishedSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 01/09/2016.
//
//

import Foundation

/// [PUBLISHED, requestId|number, options|dict, topic|String, args|list?, kwargs|dict?]
class PublishedSwampMessage: SwampMessage {
    
    let requestId: Int64
    let publication: Int64
    
    init(requestId: Int64, publication: Int64) {
        self.requestId = requestId
        self.publication = publication
    }
    
    // MARK: SwampMessage protocol
    required init(payload: [Any]) {
        self.requestId = payload[0] as! Int64
        self.publication = payload[1] as! Int64
    }
    
    func marshal() -> [Any] {
        let marshalled: [Any] = [SwampMessages.published.rawValue, self.requestId, self.publication]
        return marshalled
    }
}
