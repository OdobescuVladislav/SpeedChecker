# SpeedChecker v2.0
**How to get list of servers:**

        ...
        @State var serverList: [ServerModel] = []
        @State var lifetimeCancelBag: CancelBag = CancelBag()
    
        let serverService = ServerService(serverRepository: ServerRepository())
        
        serverService.serverList(for: []) // <-- modify array for specific servers, [] means all of them
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { serverList in
                        self.serverList = serverList
                }
            )
            .cancelled(by: lifetimeCancelBag)
        ...
**How to get fastest/closest server near to the user:**
        
        ...
        // let's asume you stored servers into an array called serverList

        closestServer(from: serverList)
        .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { closestServer in
                // Use the closest server by region
            })
        ...

**How to create ViewModel with Speed checker:**

        class MySpeedChecker: TestViewModel {
            ...
        }
        let speedChecker = MySpeedChecker(serverModel: server)
        speedChecker.test {
                print("test done")
        }


