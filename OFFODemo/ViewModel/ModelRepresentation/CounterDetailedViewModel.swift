//
//  CounterDetailedViewModel.swift
//  OFFODemo
//
//  Created by Павел Барташов on 02.10.2023.
//

import Foundation

struct CounterDetailedViewModel {
    
    // MARK: - Properties


    var type: CounterType
    var serialNumber: String
    var account: String




    var selectableTypes: [CounterType] {
        [
            .coldWater,
            .hotWater,
            .electric,
            .heat
        ]
    }

    // MARK: - LifeCicle



    init(counter: Counter) {
//        self.id = counter.id
        self.type = counter.type
        self.serialNumber = counter.serialNumber
        self.account = counter.account
    }
    
    // MARK: - Metods
}

extension CounterDetailedViewModel {
    static var emptyCounterVM: CounterDetailedViewModel {
        CounterDetailedViewModel(counter: Counter.emptyCounter)
    }
}

extension CounterType {
    var shortTitle: String {
        switch self {
            case .unknown:
                "shortUnknown"
            case .coldWater:
                "shortColdWater"
            case .hotWater:
                "shortHotWater"
            case .electric:
                "shortElectric"
            case .heat:
                "shortHeat"
                //            case .gas:
                //                "gas".localized
        }
    }
}
