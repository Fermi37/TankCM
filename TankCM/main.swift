//
//  main.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

let diameter = Diameter<Cylinder>(value: 3)
let cylinder = Cylinder(lc: 10.9 - 2 * (0.66 - 0.08), diameter: diameter, liquidLevel: 0.1)
let tankBottom = TankBottom(ho: 0.66 - 0.08, diameter: diameter, liquidLevel: 0.1)


let levels = (0.2 ..< 1).linspace(numIntervals: 20)
let taskController = TaskController(cylinder: cylinder, tankBottom: tankBottom, luquidLevels: levels)
print(taskController.results)

