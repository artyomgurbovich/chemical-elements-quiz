//
//  ViewController.swift
//  ChemicalElementsQuiz
//
//  Created by Artyom Gurbovich on 11/17/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    @IBOutlet weak var elementView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var elements = [Element]()
    var correctAnswer = ""
    var wins = 0
    var games = 0
    var moreThanOneAttempt = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elements = createElements()
        elementView.layer.cornerRadius = 30
        for button in buttons {
            button.layer.cornerRadius = 17
            button.layer.borderWidth = 2
            button.titleLabel?.textAlignment = .center
        }
        newRound()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == correctAnswer{
            if !moreThanOneAttempt {
                wins += 1
            }
            games += 1
            updateScoreLabel()
            newRound()
        } else {
            moreThanOneAttempt = true
            sender.shake()
        }
    }
    
    @IBAction func startOverTapped(_ sender: UIButton) {
        wins = 0
        games = 0
        updateScoreLabel()
    }
    
    func newRound() {
        let element = elements.randomElement()!
        symbolLabel.text = element.symbol
        atomicNumberLabel.text = String(element.atomicNumber)
        elementView.backgroundColor = element.color.value
        correctAnswer = element.name
        moreThanOneAttempt = false
        let correctAnswerIndex = Int.random(in: 0..<4)
        buttons[correctAnswerIndex].setTitle(correctAnswer, for: .normal)
        var wrongAnswers = [String]()
        for i in 0..<4 {
            if i != correctAnswerIndex {
                var wrongAnswer: String
                repeat {
                    wrongAnswer = elements.randomElement()!.name
                } while wrongAnswers.contains(wrongAnswer) || wrongAnswer == correctAnswer
                wrongAnswers.append(wrongAnswer)
                buttons[i].setTitle(wrongAnswer, for: .normal)
            }
            buttons[i].layer.borderColor = element.color.value.cgColor
            buttons[i].layer.backgroundColor = element.color.background.cgColor
        }
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "     \(wins) / \(games)"
    }
    
    func createElements() -> [Element] {
        var elements = [Element]()
        elements.append(Element(name: "Hydrogen", symbol: "H", atomicNumber: 1, color: .purple))
        elements.append(Element(name: "Helium", symbol: "He", atomicNumber: 2, color: .yellow))
        elements.append(Element(name: "Lithium", symbol: "Li", atomicNumber: 3, color: .red))
        elements.append(Element(name: "Beryllium", symbol: "Be", atomicNumber: 4, color: .blue))
        elements.append(Element(name: "Boron", symbol: "B", atomicNumber: 5, color: .teal))
        elements.append(Element(name: "Carbon", symbol: "C", atomicNumber: 6, color: .purple))
        elements.append(Element(name: "Nitrogen", symbol: "N", atomicNumber: 7, color: .purple))
        elements.append(Element(name: "Oxygen", symbol: "O", atomicNumber: 8, color: .purple))
        elements.append(Element(name: "Fluorine", symbol: "F", atomicNumber: 9, color: .pink))
        elements.append(Element(name: "Neon", symbol: "Ne", atomicNumber: 10, color: .yellow))
        elements.append(Element(name: "Sodium", symbol: "Na", atomicNumber: 11, color: .red))
        elements.append(Element(name: "Magnesium", symbol: "Mg", atomicNumber: 12, color: .blue))
        elements.append(Element(name: "Aluminum", symbol: "Al", atomicNumber: 13, color: .green))
        elements.append(Element(name: "Silicon", symbol: "Si", atomicNumber: 14, color: .teal))
        elements.append(Element(name: "Phosphorus", symbol: "P", atomicNumber: 15, color: .purple))
        elements.append(Element(name: "Sulfur", symbol: "S", atomicNumber: 16, color: .purple))
        elements.append(Element(name: "Chlorine", symbol: "Cl", atomicNumber: 17, color: .pink))
        elements.append(Element(name: "Argon", symbol: "Ar", atomicNumber: 18, color: .yellow))
        elements.append(Element(name: "Potassium", symbol: "K", atomicNumber: 19, color: .red))
        elements.append(Element(name: "Calcium", symbol: "Ca", atomicNumber: 20, color: .blue))
        elements.append(Element(name: "Scandium", symbol: "Sc", atomicNumber: 21, color: .orange))
        elements.append(Element(name: "Titanium", symbol: "Ti", atomicNumber: 22, color: .orange))
        elements.append(Element(name: "Vanadium", symbol: "V", atomicNumber: 23, color: .orange))
        elements.append(Element(name: "Chromium", symbol: "Cr", atomicNumber: 24, color: .orange))
        elements.append(Element(name: "Manganese", symbol: "Mn", atomicNumber: 25, color: .orange))
        elements.append(Element(name: "Iron", symbol: "Fe", atomicNumber: 26, color: .orange))
        elements.append(Element(name: "Cobalt", symbol: "Co", atomicNumber: 27, color: .orange))
        elements.append(Element(name: "Nickel", symbol: "Ni", atomicNumber: 28, color: .orange))
        elements.append(Element(name: "Copper", symbol: "Cu", atomicNumber: 29, color: .orange))
        elements.append(Element(name: "Zink", symbol: "Zn", atomicNumber: 30, color: .orange))
        elements.append(Element(name: "Gallium", symbol: "Ga", atomicNumber: 31, color: .green))
        elements.append(Element(name: "Germanium", symbol: "Ge", atomicNumber: 32, color: .teal))
        elements.append(Element(name: "Arsenic", symbol: "As", atomicNumber: 33, color: .teal))
        elements.append(Element(name: "Selenium", symbol: "Se", atomicNumber: 34, color: .purple))
        elements.append(Element(name: "Bromine", symbol: "Br", atomicNumber: 35, color: .pink))
        elements.append(Element(name: "Krypton", symbol: "Kr", atomicNumber: 36, color: .yellow))
        elements.append(Element(name: "Rubidium", symbol: "Rb", atomicNumber: 37 , color: .red))
        elements.append(Element(name: "Strontium", symbol: "Sr", atomicNumber: 38 , color: .blue))
        elements.append(Element(name: "Yttrium", symbol: "Y", atomicNumber: 39 , color: .orange))
        elements.append(Element(name: "Zirconium", symbol: "Zr", atomicNumber: 40 , color: .orange))
        elements.append(Element(name: "Niobium", symbol: "Nb", atomicNumber: 41 , color: .orange))
        elements.append(Element(name: "Molybdenum", symbol: "Mo", atomicNumber: 42 , color: .orange))
        elements.append(Element(name: "Technetium", symbol: "Tc", atomicNumber: 43 , color: .orange))
        elements.append(Element(name: "Ruthenium", symbol: "Ru", atomicNumber: 44 , color: .orange))
        elements.append(Element(name: "Rhodium", symbol: "Rh", atomicNumber: 45 , color: .orange))
        elements.append(Element(name: "Palladium", symbol: "Pd", atomicNumber: 46 , color: .orange))
        elements.append(Element(name: "Silver", symbol: "Ag", atomicNumber: 47 , color: .orange))
        elements.append(Element(name: "Cadmium", symbol: "Cd", atomicNumber: 48 , color: .orange))
        elements.append(Element(name: "Indium", symbol: "In", atomicNumber: 49 , color: .green))
        elements.append(Element(name: "Tin", symbol: "Sn", atomicNumber: 50 , color: .green))
        elements.append(Element(name: "Antimony", symbol: "Sb", atomicNumber: 51 , color: .teal))
        elements.append(Element(name: "Tellurium", symbol: "Te", atomicNumber: 52 , color: .teal))
        elements.append(Element(name: "Iodine", symbol: "I", atomicNumber: 53 , color: .pink))
        elements.append(Element(name: "Xenon", symbol: "Xe", atomicNumber: 54 , color: .yellow))
        elements.append(Element(name: "Cesium", symbol: "Cs", atomicNumber: 55 , color: .red))
        elements.append(Element(name: "Barium", symbol: "Ba", atomicNumber: 56 , color: .blue))
        elements.append(Element(name: "Lanthanum", symbol: "La", atomicNumber: 57 , color: .yellowGreen))
        elements.append(Element(name: "Cerium", symbol: "Ce", atomicNumber: 58 , color: .yellowGreen))
        elements.append(Element(name: "Praseodymium", symbol: "Pr", atomicNumber: 59 , color: .yellowGreen))
        elements.append(Element(name: "Neodymium", symbol: "Nd", atomicNumber: 60 , color: .yellowGreen))
        elements.append(Element(name: "Promethium", symbol: "Pm", atomicNumber: 61 , color: .yellowGreen))
        elements.append(Element(name: "Samarium", symbol: "Sm", atomicNumber: 62 , color: .yellowGreen))
        elements.append(Element(name: "Europium", symbol: "Eu", atomicNumber: 63 , color: .yellowGreen))
        elements.append(Element(name: "Gadolinium", symbol: "Gd", atomicNumber: 64 , color: .yellowGreen))
        elements.append(Element(name: "Terbium", symbol: "Tb", atomicNumber: 65 , color: .yellowGreen))
        elements.append(Element(name: "Dysprosium", symbol: "Dy", atomicNumber: 66 , color: .yellowGreen))
        elements.append(Element(name: "Holmium", symbol: "Ho", atomicNumber: 67 , color: .yellowGreen))
        elements.append(Element(name: "Erbium", symbol: "Er", atomicNumber: 68 , color: .yellowGreen))
        elements.append(Element(name: "Thulium", symbol: "Tm", atomicNumber: 69 , color: .yellowGreen))
        elements.append(Element(name: "Ytterbium", symbol: "Yb", atomicNumber: 70 , color: .yellowGreen))
        elements.append(Element(name: "Lutetium", symbol: "Lu", atomicNumber: 71 , color: .yellowGreen))
        elements.append(Element(name: "Hafnium", symbol: "Hf", atomicNumber: 72 , color: .orange))
        elements.append(Element(name: "Tantalum", symbol: "Ta", atomicNumber: 73 , color: .orange))
        elements.append(Element(name: "Tungsten", symbol: "W", atomicNumber: 74 , color: .orange))
        elements.append(Element(name: "Rhenium", symbol: "Re", atomicNumber: 75 , color: .orange))
        elements.append(Element(name: "Osmium", symbol: "Os", atomicNumber: 76 , color: .orange))
        elements.append(Element(name: "Iridium", symbol: "Ir", atomicNumber: 77 , color: .orange))
        elements.append(Element(name: "Platinum", symbol: "Pt", atomicNumber: 78 , color: .orange))
        elements.append(Element(name: "Gold", symbol: "Au", atomicNumber: 79 , color: .orange))
        elements.append(Element(name: "Mercury", symbol: "Hg", atomicNumber: 80 , color: .orange))
        elements.append(Element(name: "Thallium", symbol: "Tl", atomicNumber: 81 , color: .green))
        elements.append(Element(name: "Lead", symbol: "Pb", atomicNumber: 82 , color: .green))
        elements.append(Element(name: "Bismuth", symbol: "Bi", atomicNumber: 83 , color: .green))
        elements.append(Element(name: "Polonium", symbol: "Po", atomicNumber: 84 , color: .teal))
        elements.append(Element(name: "Astatine", symbol: "At", atomicNumber: 85 , color: .pink))
        elements.append(Element(name: "Radon", symbol: "Rn", atomicNumber: 86 , color: .yellow))
        elements.append(Element(name: "Francium", symbol: "Fr", atomicNumber: 87 , color: .red))
        elements.append(Element(name: "Radium", symbol: "Ra", atomicNumber: 88 , color: .blue))
        elements.append(Element(name: "Actinium", symbol: "Ac", atomicNumber: 89 , color: .purplePink))
        elements.append(Element(name: "Thorium", symbol: "Th", atomicNumber: 90 , color: .purplePink))
        elements.append(Element(name: "Protactinium", symbol: "Pa", atomicNumber: 91 , color: .purplePink))
        elements.append(Element(name: "Uranium", symbol: "U", atomicNumber: 92 , color: .purplePink))
        elements.append(Element(name: "Neptunium", symbol: "Np", atomicNumber: 93 , color: .purplePink))
        elements.append(Element(name: "Plutonium", symbol: "Pu", atomicNumber: 94 , color: .purplePink))
        elements.append(Element(name: "Americium", symbol: "Am", atomicNumber: 95 , color: .purplePink))
        elements.append(Element(name: "Curium", symbol: "Cm", atomicNumber: 96 , color: .purplePink))
        elements.append(Element(name: "Berkelium", symbol: "Bk", atomicNumber: 97 , color: .purplePink))
        elements.append(Element(name: "Californium", symbol: "Cf", atomicNumber: 98 , color: .purplePink))
        elements.append(Element(name: "Einsteinium", symbol: "Es", atomicNumber: 99 , color: .purplePink))
        elements.append(Element(name: "Fermium", symbol: "Fm", atomicNumber: 100, color: .purplePink))
        elements.append(Element(name: "Mendelevium", symbol: "Md", atomicNumber: 101, color: .purplePink))
        elements.append(Element(name: "Nobelium", symbol: "No", atomicNumber: 102, color: .purplePink))
        elements.append(Element(name: "Lawrencium", symbol: "Lr", atomicNumber: 103, color: .purplePink))
        elements.append(Element(name: "Rutherfordium", symbol: "Rf", atomicNumber: 104, color: .orange))
        elements.append(Element(name: "Dubnium", symbol: "Db", atomicNumber: 105, color: .orange))
        elements.append(Element(name: "Seaborgium", symbol: "Sg", atomicNumber: 106, color: .orange))
        elements.append(Element(name: "Bohrium", symbol: "Bh", atomicNumber: 107, color: .orange))
        elements.append(Element(name: "Hassium", symbol: "Hs", atomicNumber: 108, color: .orange))
        elements.append(Element(name: "Meitnerium", symbol: "Mt", atomicNumber: 109, color: .orange))
        elements.append(Element(name: "Darmstadtium", symbol: "Ds", atomicNumber: 110, color: .orange))
        elements.append(Element(name: "Roentgenium", symbol: "Rg", atomicNumber: 111, color: .orange))
        elements.append(Element(name: "Copernicium", symbol: "Cn", atomicNumber: 112, color: .orange))
        elements.append(Element(name: "Nihonium", symbol: "Nh", atomicNumber: 113, color: .green))
        elements.append(Element(name: "Flerovium", symbol: "Fl", atomicNumber: 114, color: .green))
        elements.append(Element(name: "Moscovium", symbol: "Mc", atomicNumber: 115, color: .green))
        elements.append(Element(name: "Livermorium", symbol: "Lv", atomicNumber: 116, color: .green))
        elements.append(Element(name: "Tennessine", symbol: "Ts", atomicNumber: 117, color: .pink))
        elements.append(Element(name: "Oganesson", symbol: "Og", atomicNumber: 118, color: .yellow))
        return elements
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.5
        animation.values = [-12.0, 12.0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0]
        layer.add(animation, forKey: "shake")
    }
}
