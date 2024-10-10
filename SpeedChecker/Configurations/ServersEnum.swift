//
//  ServersEnum.swift
//  SpeedChecker
//
//  Created by Vladislav Odobescu on 10.10.2024.
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
    
    var details: (name: String, host: String, paths: Paths) {
        switch self {
        case .amsterdamNetherlandsClouvider:
            return ("Amsterdam, Netherlands (Clouvider)", "https://ams.speedtest.clouvider.net/backend", Paths())
        case .chicagoUSClouvider:
            return ("Chicago, USA (Clouvider)", "https://chi.speedtest.clouvider.net/backend", Paths())
        case .frankfurtGermanyClouvider:
            return ("Frankfurt, Germany (Clouvider)", "https://fra.speedtest.clouvider.net/backend", Paths())
        case .londonUKClouvider:
            return ("London, UK (Clouvider)", "https://lon.speedtest.clouvider.net/backend", Paths())
        case .miamiUSAVultr:
            return ("Miami, USA (Vultr)", "https://fl-us-ping.vultr.com/", Paths())
        case .mumbaiIndiaDigitalOcean:
            return ("Mumbai, India (DigitalOcean)", "https://in1.backend.librespeed.org/", Paths())
        case .newYorkUSClouvider:
            return ("New York, USA (Clouvider)", "https://nyc.speedtest.clouvider.net/backend", Paths())
        case .osloNorwayLemuriaAPS:
            return ("Oslo, Norway (Lemuria ApS)", "https://librespeed.apidev.eu/", Paths())
        case .romeItalyGARR:
            return ("Rome, Italy (GARR)", "https://st-be-rm1.infra.garr.it", Paths())
        case .singaporeDigitalOcean:
            return ("Singapore (DigitalOcean)", "https://sgp.backend.librespeed.org/", Paths())
        case .sydneyAustraliaDigitalOcean:
            return ("Sydney, Australia (DigitalOcean)", "https://au1.backend.librespeed.org/", Paths())
        case .turinItalyGARR:
            return ("Turin, Italy (GARR)", "https://st-be-to1.infra.garr.it", Paths())
        case .poznanPolandKamilSzczepanski:
            return ("Poznan, Poland (Kamil Szczepanski)", "https://speedtest.kamilszczepanski.com/", Paths())
        case .dallasUSClouvider:
            return ("Dallas, USA (Clouvider)", "https://dal.speedtest.clouvider.net/backend", Paths())
        case .losAngelesUSClouvider:
            return ("Los Angeles, USA (Clouvider)", "https://lax.speedtest.clouvider.net/backend", Paths())
        case .singaporeClouvider:
            return ("Singapore (Clouvider)", "https://sgp.speedtest.clouvider.net/backend", Paths())
        case .melbourneAustraliaDigitalOcean:
            return ("Melbourne, Australia (DigitalOcean)", "https://mel1.backend.librespeed.org/", Paths())
        case .newarkUSADigitalOcean:
            return ("Newark, USA (DigitalOcean)", "https://nwk.backend.librespeed.org/", Paths())
        case .saoPauloBrazilVultr:
            return ("São Paulo, Brazil (Vultr)", "https://saopaulo.speedtest.vultr.com/", Paths())
        }
    }
    
    struct Paths {
        let download = "garbage.php"
        let upload = "empty.php"
        let ping = "empty.php"
        let ip = "getIP.php"
    }
}
