//
//  DelegateProtocol.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/14/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import Foundation
protocol DelegateProtocol: class {
    func sendNames() -> [String]
}
