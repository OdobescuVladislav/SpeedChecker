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

    func serverList(for selectedServers: [SpeedTestServer]) -> AnyPublisher<[ServerModel], ServerError> {
        return serverRepository.serverList()
            .map { serverEntities in
                if selectedServers.isEmpty {
                    return serverEntities.compactMap { serverEntity in
                        return ServerModel(
                            name: serverEntity.name,
                            host: serverEntity.host,
                            paths: serverEntity.paths
                        )
                    }
                }
                return serverEntities.compactMap { serverEntity in
                    if let serverEnum = SpeedTestServer.allCases.first(where: { $0.details.name == serverEntity.name }),
                       selectedServers.contains(serverEnum) {
                        return ServerModel(
                            name: serverEntity.name,
                            host: serverEntity.host,
                            paths: serverEntity.paths
                        )
                    }
                    return nil
                }
            }
            .mapError { _ in ServerError.unknown }
            .eraseToAnyPublisher()
    }

    enum ServerError: Error {
        case unknown
    }
}
