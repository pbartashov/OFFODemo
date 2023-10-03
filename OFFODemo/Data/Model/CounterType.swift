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

extension CounterType {
    var title: String {
        switch self {
            case .unknown:
                "unknown".localized
            case .coldWater:
                "coldWater".localized
            case .hotWater:
                "hotWater".localized
            case .electric:
                "electric".localized
            case .heat:
                "heat".localized
                //            case .gas:
                //                "gas".localized
        }
    }

    var shortTitle: String {
        switch self {
            case .unknown:
                "shortUnknown".localized
            case .coldWater:
                "shortColdWater".localized
            case .hotWater:
                "shortHotWater".localized
            case .electric:
                "shortElectric".localized
            case .heat:
                "shortHeat".localized
                //            case .gas:
                //                "gas".localized
        }
    }
}
