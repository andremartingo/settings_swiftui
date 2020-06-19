//
//  ViewModel.swift
//  settings_bug
//
//  Created by Andre Martingo on 19.06.20.
//  Copyright © 2020 Andre Martingo. All rights reserved.
//

import Foundation
import Combine
import StoreKit

class ViewModel: ObservableObject {
    
    @Published
    var state: State = .init(info: [], app: "")
    
    init() {
        makeCells()
    }
    
    func makeCells() {
        
        let star = InfoViewModel(imageName: "star", title: "Upgrade to Pro")
        
        let source = InfoViewModel(imageName: "rectangle.on.rectangle", title: "Sources")
        
        let report = InfoViewModel(imageName: "ant", title: "Report")
        
        self.state = .init(info: [.init(cells: [star]), .init(cells:[source, report])], app: "1.0")
    }
}

extension ViewModel {
    struct Sections: Identifiable {
        let id = UUID()
        let cells: [InfoViewModel]
    }
    
    struct State {
        let info: [Sections]
        let app: String
    }
}


struct InfoViewModel: Hashable, Identifiable {
    
    let id = UUID()
    let imageName: String
    let title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(imageName)
    }
    
    static func == (lhs: InfoViewModel, rhs: InfoViewModel) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.title == rhs.title
    }
}



