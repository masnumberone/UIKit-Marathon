//
//  RootViewModel.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import Foundation

class RootViewModel {
    var items: [TaskItem]
    var onItemSelected: ((Int) -> Void)?
    var title: String
    var description: String
    
    init(items: [TaskItem], title: String, description: String) {
        self.items = items
        self.title = title
        self.description = description
    }
}
