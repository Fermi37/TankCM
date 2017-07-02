//
//  Task.swift
//  TankCM
//
//  Created by Yuri Bulavin on 01.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Task
{
    let tanks: [ComplexGeometricShapeType & Serializable]
}

extension Task
{
    var result: [Serialization] {
        return tanks.map {$0.serialaize()}
    }
}

