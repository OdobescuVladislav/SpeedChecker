//
//  Constants.swift

import Foundation

struct Constants {
    static let bytesPerMegaByte = 1048576
    static let overheadCompensationFactor = 1.06

    struct Download {
        static let size = 100
    }

    struct Upload {
        static let size = 5
        static let sizeBytes = size * bytesPerMegaByte
        static let attempts = 1
        static let requestPadding = 0.0
    }

    struct Ping {
        static let attempts = 10
        static let requestPadding = 0.075
    }
}
