//
//  TaskController.swift
//  TankCM
//
//  Created by Yuri Bulavin on 02.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

class TaskController
{
    let task: Task
    let storageController = StorageController()

    init(cylinder: Cylinder, tankBottom: TankBottom, luquidLevels: [Double]) {
        let cisterns = luquidLevels.map {Cisterna(cylinder: cylinder, tankBottom: tankBottom, liquidLevel: $0)}
        task = Task(tanks: cisterns)
    }
}

extension TaskController
{
    var results: String {
        return task.result.csvLine
    }

    func saveToFile() {
        try! storageController.saveLine(savingLine: results, fileName: "result")
    }
}
