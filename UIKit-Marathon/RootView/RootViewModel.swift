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
    
    init(items: [TaskItem]) {
        self.items = items
    }
}
