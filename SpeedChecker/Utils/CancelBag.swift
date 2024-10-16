//
//  CancelBag.swift

import Foundation
import Combine

final class CancelBag {
    private var cancellables: Set<AnyCancellable> = []

    func add(cancellable: AnyCancellable) {
        cancellables.insert(cancellable)
    }
    
    func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
