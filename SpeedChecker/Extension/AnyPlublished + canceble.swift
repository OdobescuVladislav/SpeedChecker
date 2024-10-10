//
//  AnyPlublished + canceble.swift
//  FastFrameDigitPro
//
//  Created by Vladislav Odobescu on 08.10.2024.
//

import Foundation
import Combine

extension AnyCancellable {
    func cancelled(by cancelBag: CancelBag) {
        cancelBag.add(cancellable: self)
    }
}
