# SpeedChecker v2.0
**How to get list of servers:**

        ...
        @State var serverList: [ServerModel] = []
        @State var lifetimeCancelBag: CancelBag = CancelBag()
    
        let serverService = ServerService(serverRepository: ServerRepository())
        
        serverService.serverList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { serverList in
                        self.serverList = serverList // <-- return full list of valid servers from json, list can be modified
                }
            )
            .cancelled(by: lifetimeCancelBag)
        ...

**Use static servers from enum instead of listing:**

        ...
        enum SpeedTestServer: CaseIterable {
            case amsterdamNetherlandsClouvider
            case chicagoUSClouvider
            case frankfurtGermanyClouvider
        ...
        let server = amsterdamNetherlandsClouvider.serverModel
        
        // take extra care since it returns Optional(ServerModel?) 

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

**What does this class contains:**

        ...
            @Published
            private(set) var download = 0.0

            @Published
            private(set) var downloadLimit = 100.0

            @Published
            private(set) var upload = 0.0

            @Published
            private(set) var uploadLimit = 100.0

            @Published
            private(set) var ping = 0.0 // multiply by 1000 when display for usual format of represintaion

            @Published
            private(set) var jitter = 0.0
        ...

        //There are no stop function, call test() again to restart


