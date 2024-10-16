//
//  TestViewModel.swift
//


import Foundation
import Combine

public class TestViewModel: ObservableObject {
    @Published
    private(set) var download = 0.0

    @Published
    private(set) var downloadLimit = 100.0

    @Published
    private(set) var upload = 0.0

    @Published
    private(set) var uploadLimit = 100.0

    @Published
    private(set) var ping = 0.0

    @Published
    private(set) var jitter = 0.0

    private let serverModel: ServerModel

    private var testCancelBag = CancelBag()
    private let lifetimeCancelBag = CancelBag()

    init(serverModel: ServerModel) {
        self.serverModel = serverModel

        serverModel.$download
            .receive(on: DispatchQueue.main)
            .assign(to: \.download, on: self)
            .cancelled(by: lifetimeCancelBag)

        serverModel.$upload
            .receive(on: DispatchQueue.main)
            .assign(to: \.upload, on: self)
            .cancelled(by: lifetimeCancelBag)

        serverModel.$ping
            .receive(on: DispatchQueue.main)
            .assign(to: \.ping, on: self)
            .cancelled(by: lifetimeCancelBag)

        serverModel.$jitter
            .receive(on: DispatchQueue.main)
            .assign(to: \.jitter, on: self)
            .cancelled(by: lifetimeCancelBag)
    }

    func test(onTestComplete: @escaping () -> Void) {
        testCancelBag = CancelBag()

        serverModel.reset()

        serverModel.testPing()
            .append(
                self.serverModel.testDownload()
                    .append(self.serverModel.testUpload())
            )
            .sink(receiveCompletion: { _ in
                onTestComplete()
            }, receiveValue: { _ in })
            .cancelled(by: testCancelBag)
    }
}
