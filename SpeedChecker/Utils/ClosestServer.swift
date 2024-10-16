//
//  ClosesServer.swift
//  SpeedChecker
//

import Foundation
import Combine

func closestServer(from servers: [ServerEntity]) -> AnyPublisher<ServerModel?, ServerError> {
    return Publishers.MergeMany(servers.map { serverEntity in
        pingServer(serverEntity)
            .map { (serverEntity.name, $0) }
            .catch { _ in Just((serverEntity.name, Double.greatestFiniteMagnitude)) }
    })
    .collect()
    .map { results in
        results.min(by: { $0.1 < $1.1 })
    }
    .flatMap { serverInfo in
        guard let fastestServerName = serverInfo?.0 else {
            return Just<ServerModel?>(nil).eraseToAnyPublisher()
        }
        if let serverEntity = servers.first(where: { $0.name == fastestServerName }) {
            let serverModel = ServerModel(name: serverEntity.name, host: serverEntity.host, paths: serverEntity.paths)
            return Just(serverModel).eraseToAnyPublisher()
        } else {
            return Just<ServerModel?>(nil).eraseToAnyPublisher()
        }
    }
    .mapError { _ in ServerError.unknown }
    .eraseToAnyPublisher()
}

func pingServer(_ serverEntity: ServerEntity) -> AnyPublisher<Double, Error> {
    let startTime = Date()
    guard let url = URL(string: serverEntity.host) else {
        return Fail(error: ServerError.unknown).eraseToAnyPublisher()
    }
    
    return Future { promise in
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            let latency = Date().timeIntervalSince(startTime)
            if let error = error {
                promise(.failure(error))
            } else {
                promise(.success(latency))
            }
        }
        task.resume()
    }
    .eraseToAnyPublisher()
}

enum ServerError: Error {
    case unknown
}
