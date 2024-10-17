//
//  ServerService.swift
//  SpeedChecker
//

import Foundation
import Combine

final class ServerService {
    private let serverRepository: ServerRepository

    init(serverRepository: ServerRepository) {
        self.serverRepository = serverRepository
    }

    func serverList() -> AnyPublisher<[ServerModel], ServerError> {
        return serverRepository.serverList()
            .map { serverEntities in
                return serverEntities.compactMap { serverEntity in
                    return ServerModel(
                        name: serverEntity.name,
                        host: serverEntity.host,
                        paths: serverEntity.paths
                    )
                }
            }
            .mapError { _ in ServerError.unknown }
            .eraseToAnyPublisher()
    }

    enum ServerError: Error {
        case unknown
    }
}
