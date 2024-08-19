//
//  NavigationLinkedList.swift
//  
//
//  Created by Oleksandr Balabanov on 19/08/2024.
//

import Foundation

final class NavigationLinkedList {
    var head: NavigationNode?
    var tail: NavigationNode?
    
    func append(_ node: NavigationNode) {
        if head == nil && tail == nil {
            head = node;
            tail = node
            
            trackAppearance()
            return
        }
        
        // skip pop case
        if head?.previousNode == node { return }
        
        // Assign a new head and track appearance
        let newHead = node
        head?.nextNode = newHead
        newHead.previousNode = head
        head = newHead
        
        trackAppearance()
    }
    
    func remove(_ node: NavigationNode) {
        // Tracking modal dismiss
        if head == node {
            let newHead = head?.previousNode
            head = newHead
            head?.nextNode = nil
            trackAppearance()
        }
    }
    
    func trackAppearance() {
        print("logging screen appear: \(NavigationTracker.shared.navigationList.head!.screenName)")
    }
}

final class NavigationNode: Equatable {
    let screenName: String
    let screenID: UUID
    var previousNode: NavigationNode? = nil
    var nextNode: NavigationNode? = nil
    
    init(screenName: String, screenID: UUID, previousNode: NavigationNode? = nil, nextNode: NavigationNode? = nil) {
        self.screenName = screenName
        self.screenID = screenID
        self.previousNode = previousNode
        self.nextNode = nextNode
    }
    
    static func == (lhs: NavigationNode, rhs: NavigationNode) -> Bool {
        lhs.screenID == rhs.screenID
    }
}
