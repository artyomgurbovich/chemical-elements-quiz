//
//  Element.swift
//  ChemicalElementsQuiz
//
//  Created by Artyom Gurbovich on 11/17/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

struct Element {
    let name: String
    let symbol: String
    let atomicNumber: Int
    let color: ElementColor
}

enum ElementColor {
    case purple, red, blue, orange, green, teal, pink, yellow, yellowGreen, purplePink
    
    var value: UIColor {
        switch self {
        case .purple:
            return #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.9490196078, green: 0.2509803922, blue: 0.2156862745, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.03529411765, green: 0.4901960784, blue: 0.9450980392, alpha: 1)
        case .orange:
            return #colorLiteral(red: 0.9482284331, green: 0.5912483171, blue: 0.03718542874, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.1882352941, green: 0.8196078431, blue: 0.3450980392, alpha: 1)
        case .teal:
            return #colorLiteral(red: 0.3729762151, green: 0.7832500518, blue: 0.9510893486, alpha: 1)
        case .pink:
            return #colorLiteral(red: 0.9490196078, green: 0.2039215686, blue: 0.3529411765, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.9529411765, green: 0.8, blue: 0.03921568627, alpha: 1)
        case .yellowGreen:
            return #colorLiteral(red: 0.5960784314, green: 0.831372549, blue: 0.1921568627, alpha: 1)
        case .purplePink:
            return #colorLiteral(red: 0.8745098039, green: 0.2862745098, blue: 0.662745098, alpha: 1)
        }
    }
    
    var background: UIColor {
        switch self {
        case .purple:
            return #colorLiteral(red: 0.1556879235, green: 0.07336080165, blue: 0.1972590444, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.1980083627, green: 0.05268575454, blue: 0.04503719622, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.007675495372, green: 0.1013165389, blue: 0.195725132, alpha: 1)
        case .orange:
            return #colorLiteral(red: 0.1953675176, green: 0.1218173933, blue: 0.007661471277, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.04527586288, green: 0.197138653, blue: 0.08300574861, alpha: 1)
        case .teal:
            return #colorLiteral(red: 0.07648525959, green: 0.1606190452, blue: 0.195037412, alpha: 1)
        case .pink:
            return #colorLiteral(red: 0.197815801, green: 0.04266615316, blue: 0.07369608273, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.1960827465, green: 0.1645557167, blue: 0.007689519471, alpha: 1)
        case .yellowGreen:
            return #colorLiteral(red: 0.1429357842, green: 0.1993578043, blue: 0.04607798306, alpha: 1)
        case .purplePink:
            return #colorLiteral(red: 0.199828906, green: 0.06541484367, blue: 0.1514398436, alpha: 1)
        }
    }
}
