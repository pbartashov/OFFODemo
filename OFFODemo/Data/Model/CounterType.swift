//
//  CounterType.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

enum CounterType {
    case unknown
    case coldWater
    case hotWater
    case electric
    case heat
//    case gas
}

extension CounterType: Hashable { }

extension CounterType: Codable { }

extension CounterType: Identifiable {
    var id: Self {
        self
    }
}

//extension CounterType {
//    var title: String {
//        switch self {
//            case .unknown:
//                "unknown"
//            case .coldWater:
//                "coldWater"
//            case .hotWater:
//                "hotWater"
//            case .electric:
//                "electric"
//            case .heat:
//                "heat"
//                //            case .gas:
//                //                "gas".localized
//        }
//    }
//
//    var shortTitle: String {
//        switch self {
//            case .unknown:
//                "shortUnknown"
//            case .coldWater:
//                "shortColdWater"
//            case .hotWater:
//                "shortHotWater"
//            case .electric:
//                "shortElectric"
//            case .heat:
//                "shortHeat"
//                //            case .gas:
//                //                "gas".localized
//        }
//    }
//}
