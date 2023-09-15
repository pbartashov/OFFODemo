//
//  CounterType.swift
//  OFFODemo
//
//  Created by Павел Барташов on 11.09.2023.
//

import Foundation

enum CounterType {
    case coldWater
    case hotWater
    case electric
    case gas
}

extension CounterType: Hashable { }
