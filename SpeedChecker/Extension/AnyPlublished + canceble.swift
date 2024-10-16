//
//  AnyPlublished + canceble.swift

import Foundation
import Combine

extension AnyCancellable {
    func cancelled(by cancelBag: CancelBag) {
        cancelBag.add(cancellable: self)
    }
}
