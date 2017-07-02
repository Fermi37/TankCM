//
//  ComplexGeometricFigureType.swift
//  TankCM
//
//  Created by Yuri Bulavin on 01.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

protocol ComplexGeometricShapeType: PropertyComputing
{
    var sructure: Tree<Box<ComputedPropities>> {get}
}
