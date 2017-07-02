//
//  ComplexGeometricFigureProtocol.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 13.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

protocol PropertyComputing
{
    var volume: Double {get}
    var momentOfVolumeY: Double {get}
    var centerOfMassY: Double {get}
}

protocol SerializationKey {
    var stringValue: String { get }
}

protocol SerializationValue {}

protocol Serializable
{
    func serialaize() -> Serialization
}
