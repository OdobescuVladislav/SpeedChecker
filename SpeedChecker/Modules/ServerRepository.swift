//
//  ServerRepository.swift
//

import Foundation
import Combine

final class ServerRepository {
    func serverList() -> Future<[ServerEntity], ServerError> {
        guard let serverListUrl = Bundle.main.url(forResource: "ServerList", withExtension: "json") else {
            print("ERROR: Failed to fetch server list from file.")
            return .failure(.fileNotFound)
        }

        do {
            let fileData = try Data(contentsOf: serverListUrl, options: .mappedIfSafe)
            let serverEntities = try JSONDecoder().decode([ServerEntity].self, from: fileData)
            return .success(serverEntities)
        } catch {
            return .failure(.readFailed)
        }
    }

    enum ServerError: Error {
        case unknown
        case fileNotFound
        case readFailed
    }
}

struct ServerEntity: Decodable {
    var name: String
    var host: String
    var paths: [String: String]

    struct Paths: Decodable {
        var download: String
        var upload: String
        var ping: String?
        var ip: String
    }
}
