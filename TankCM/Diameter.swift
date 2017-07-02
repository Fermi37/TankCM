//
//  Diameter.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 06.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Diameter<T>
{
    var value: Double

    var radius: Double {
        return value / 2.0
    }
}
