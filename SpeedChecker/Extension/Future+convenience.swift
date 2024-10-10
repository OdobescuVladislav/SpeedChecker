//
//  Future+convenience.swift
//

import Foundation
import Combine

extension Future {
    static func success(_ output: Output) -> Future<Output, Failure> {
        return .init({ $0(.success(output)) })
    }

    static func failure(_ error: Failure) -> Future<Output, Failure> {
        return .init({ $0(.failure(error)) })
    }
}
