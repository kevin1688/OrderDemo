//
//  extentionCode.swift
//  OrderDemo
//
//  Created by kai wen chen on 2022/1/4.
//
import Foundation

extension DemoData{
    func help() {
        print("debug")
    }
}

extension Double {
    func rounding(toDecimal decimal: Int) -> Double {
        let numberOfDigits = pow(10.0, Double(decimal))
        return (self * numberOfDigits).rounded(.toNearestOrAwayFromZero) / numberOfDigits
    }
}

extension Double {
    func rounding(toInteger integer: Int) -> Double {
        let integer = integer - 1
        let numberOfDigits = pow(10.0, Double(integer))
        return (self / numberOfDigits).rounded(.toNearestOrAwayFromZero) * numberOfDigits
    }
}

extension Double {
    func floor(toDecimal decimal: Int) -> Double {
        let numberOfDigits = pow(10.0, Double(decimal))
        return (self * numberOfDigits).rounded(.towardZero) / numberOfDigits
    }
}
