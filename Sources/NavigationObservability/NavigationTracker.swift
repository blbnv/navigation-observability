//
//  NavigationTracker.swift
//  
//
//  Created by Oleksandr Balabanov on 19/08/2024.
//

import Foundation

final class NavigationTracker {
    static let shared: NavigationTracker = .init()
    
    let navigationList: NavigationLinkedList
    
    init() {
        self.navigationList = .init()
    }
    
    func handleOnAppear(_ screenName: String, screenID: UUID) {
        let node = NavigationNode(screenName: screenName, screenID: screenID)
        navigationList.append(node)
    }
    
    func handleOnDisappear(_ screenName: String, screenID: UUID) {
        let node = NavigationNode(screenName: screenName, screenID: screenID)
        navigationList.remove(node)
    }
}
