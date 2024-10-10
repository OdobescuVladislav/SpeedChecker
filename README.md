# SpeedChecker v2.0
**How to get list of servers:**

        ...
        let serverService = ServerService(serverRepository: ServerRepository())
        
        serverService.serverList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { serverList in
                // You handle list here
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
        

