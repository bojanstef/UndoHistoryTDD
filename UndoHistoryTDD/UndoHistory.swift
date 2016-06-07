//
//  UndoHistory.swift
//  UndoHistoryTDD
//
//  Created by Bojan Stefanovic on 2016-06-06.
//  Copyright © 2016 Bojan Stefanovic. All rights reserved.
//

import Foundation

internal struct UndoHistory<A> {
    private let initialValue: A
    private var history: [A] = []

    init(initialValue: A) {
        self.initialValue = initialValue
    }
}

extension UndoHistory {
    var currentItem: A {
        get {
            return history.last ?? initialValue
        }
        set {
            history.append(newValue)
        }
    }

    mutating func undo() {
        guard !history.isEmpty else { return }
        history.removeLast()
    }
}
