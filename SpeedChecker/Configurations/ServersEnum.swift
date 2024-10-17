//
//  ServersEnum.swift
//  SpeedChecker
//

import Foundation

enum SpeedTestServer: CaseIterable {
    case amsterdamNetherlandsClouvider
    case chicagoUSClouvider
    case frankfurtGermanyClouvider
    case londonUKClouvider
    case miamiUSAVultr
    case mumbaiIndiaDigitalOcean
    case newYorkUSClouvider
    case osloNorwayLemuriaAPS
    case romeItalyGARR
    case singaporeDigitalOcean
    case sydneyAustraliaDigitalOcean
    case turinItalyGARR
    case poznanPolandKamilSzczepanski
    case dallasUSClouvider
    case losAngelesUSClouvider
    case singaporeClouvider
    case melbourneAustraliaDigitalOcean
    case newarkUSADigitalOcean
    case saoPauloBrazilVultr
    
    var serverModel: ServerModel? {
        switch self {
        case .amsterdamNetherlandsClouvider:
            return ServerModel(
                name: "Amsterdam, Netherlands (Clouvider)",
                host: "https://ams.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .chicagoUSClouvider:
            return ServerModel(
                name: "Chicago, USA (Clouvider)",
                host: "https://chi.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .frankfurtGermanyClouvider:
            return ServerModel(
                name: "Frankfurt, Germany (Clouvider)",
                host: "https://fra.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .londonUKClouvider:
            return ServerModel(
                name: "London, UK (Clouvider)",
                host: "https://lon.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .miamiUSAVultr:
            return ServerModel(
                name: "Miami, USA (Vultr)",
                host: "https://fl-us-ping.vultr.com/",
                paths: self.defaultPaths)
        case .mumbaiIndiaDigitalOcean:
            return ServerModel(
                name: "Mumbai, India (DigitalOcean)",
                host: "https://in1.backend.librespeed.org/",
                paths: self.defaultPaths)
        case .newYorkUSClouvider:
            return ServerModel(
                name: "New York, USA (Clouvider)",
                host: "https://nyc.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .osloNorwayLemuriaAPS:
            return ServerModel(
                name: "Oslo, Norway (Lemuria ApS)",
                host: "https://librespeed.apidev.eu/",
                paths: self.defaultPaths)
        case .romeItalyGARR:
            return ServerModel(
                name: "Rome, Italy (GARR)",
                host: "https://st-be-rm1.infra.garr.it/",
                paths: self.defaultPaths)
        case .singaporeDigitalOcean:
            return ServerModel(
                name: "Singapore (DigitalOcean)",
                host: "https://sgp.backend.librespeed.org/",
                paths: self.defaultPaths)
        case .sydneyAustraliaDigitalOcean:
            return ServerModel(
                name: "Sydney, Australia (DigitalOcean)",
                host: "https://au1.backend.librespeed.org/",
                paths: self.defaultPaths)
        case .turinItalyGARR:
            return ServerModel(
                name: "Turin, Italy (GARR)",
                host: "https://st-be-to1.infra.garr.it/",
                paths: self.defaultPaths)
        case .poznanPolandKamilSzczepanski:
            return ServerModel(
                name: "Poznan, Poland (Kamil Szczepanski)",
                host: "https://speedtest.kamilszczepanski.com/",
                paths: self.defaultPaths)
        case .dallasUSClouvider:
            return ServerModel(
                name: "Dallas, USA (Clouvider)",
                host: "https://dal.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .losAngelesUSClouvider:
            return ServerModel(
                name: "Los Angeles, USA (Clouvider)",
                host: "https://lax.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .singaporeClouvider:
            return ServerModel(
                name: "Singapore (Clouvider)",
                host: "https://sgp.speedtest.clouvider.net/backend/",
                paths: self.defaultPaths)
        case .melbourneAustraliaDigitalOcean:
            return ServerModel(
                name: "Melbourne, Australia (DigitalOcean)",
                host: "https://mel1.backend.librespeed.org/",
                paths: self.defaultPaths)
        case .newarkUSADigitalOcean:
            return ServerModel(
                name: "Newark, USA (DigitalOcean)",
                host: "https://nwk.backend.librespeed.org/",
                paths: self.defaultPaths)
        case .saoPauloBrazilVultr:
            return ServerModel(
                name: "São Paulo, Brazil (Vultr)",
                host: "https://saopaulo.speedtest.vultr.com/",
                paths: self.defaultPaths)
        }
    }
    
    var defaultPaths: [String: String] {
        return [
            "download": "garbage.php",
            "upload": "empty.php",
            "ping": "empty.php",
            "ip": "getIP.php"
        ]
    }
}
