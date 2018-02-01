//
//  GraphDataViewModel.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import Foundation
import UIKit

class GraphDataViewModel {
    var graph: Graph!
    
    init(graph: Graph) {
        self.graph = graph
    }
    
    var cashPlusValue:  Double   {
        let t = Double(graph.months) / 12.0
        let prt = Double(graph.principleAmount) * Double(cashPlusPercentage) * t
        return Double(graph.principleAmount) + prt
        }
    
    var taxReliefValue: Double   {
        let t = Double(graph.months) / 12.0
        let prt = Double(graph.principleAmount) * Double(taxReliefPercentage) * t
         return Double(graph.principleAmount) + prt
    }
    
    // The cash Plus Data and taxRelief Data are estimated randomly for example purpose
    var cashPlusData:   [Double] {
        var estimatedData = [Double]()
        switch graph.months {
        case 3:  data.forEach { estimatedData.append(Double($0) * 0.07 + Double($0))}
        case 6:  data.forEach { estimatedData.append(Double($0) * 0.06 + Double($0))}
        case 36: data.forEach { estimatedData.append(Double($0) * 0.8 + Double($0))}
        case 60: data.forEach { estimatedData.append(Double($0) * 0.5 + Double($0))}
        default: data.forEach { estimatedData.append(Double($0) * 0.9 + Double($0))}
        }
        return estimatedData
    }
    
    var taxReliefData:  [Double] {
        var estimatedData = [Double]()
        switch graph.months {
        case 3:  data.forEach { estimatedData.append(Double($0) - Double($0) * 0.559)}
        case 6:  data.forEach { estimatedData.append(Double($0) - Double($0) * 0.643)}
        case 36: data.forEach { estimatedData.append(Double($0) - Double($0) * 0.890)}
        case 60: data.forEach { estimatedData.append(Double($0) - Double($0) * 0.99)}
        default: data.forEach { estimatedData.append(Double($0) * 0.19 + Double($0))}
        }
        return estimatedData
    }
}

struct Graph {
    var months: Int! // e.g 12 months means 1 year here
    var principleAmount: Int!
}
