//
//  DataSerializator.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 04.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Serializator
{
    let datas: [[ResultColumn: Double]]
}

extension Serializator
{
    init(task: Task) {
        let results = task.tanks.map {[ResultColumn.volume: $0.volume, ResultColumn.center_of_mass_y: $0.centerOfMassY]}
        datas = results
    }
}

extension Serializator
{
    var  savingLine: String {
        let fileLine = header + "\n" + resultLine
        return fileLine
    }

    private var header: String {
        let keys = datas[0].keys
        let str = keys.reduce("") {$0 + $1.rawValue + "\t"}
        return str
    }

    private func valuesLine(data: [ResultColumn: Double]) -> String {
        let str = data.reduce("") {$0 + "\($1.value)" + "\t"}
        return str
    }

    private var resultLine:  String {
        let strs = datas.map {valuesLine(data: $0)}
        let line = strs.reduce("") {$0 + $1 + "\n"}
        return line
    }
}






