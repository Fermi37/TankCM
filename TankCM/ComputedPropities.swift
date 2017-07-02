//
//  ComputedPropities.swift
//  TankCM
//
//  Created by Yuri Bulavin on 01.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct ComputedPropities: PropertyComputing
{
    var volume: Double
    var momentOfVolumeY: Double

    var centerOfMassY: Double {
        return momentOfVolumeY / volume
    }
}

extension ComputedPropities
{
    init(cylinder: Cylinder) {
        volume = Volume(cylinder: cylinder).value()
        momentOfVolumeY = MomentOfVolumeY(cylinder: cylinder).value()
    }

    init(tankBottom: TankBottom) {
        volume = Volume(tankBottom: tankBottom).value()
        momentOfVolumeY = MomentOfVolumeY(tankBottom: tankBottom).value()
    }

    init(cisterna: Cisterna) {
        volume = cisterna.volume
        momentOfVolumeY = cisterna.momentOfVolumeY
    }
}

extension ComputedPropities: Serializable
{
    func serialaize() -> Serialization {
        return [Key.volume.rawValue: volume, Key.momentOfVolumeY.rawValue: momentOfVolumeY, Key.centerOfMassY.rawValue: centerOfMassY]
    }

    enum Key: String, SerializationKey {
        case volume, momentOfVolumeY, centerOfMassY
    }
}





