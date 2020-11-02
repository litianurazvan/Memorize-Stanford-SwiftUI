//
//  Array+Only.swift
//  Memorize
//
//  Created by Razvan Litianu on 02/11/2020.
//

import Foundation

extension Array {
    var firstIfOnly: Element? {
        count == 1 ? first : nil
    }
}
