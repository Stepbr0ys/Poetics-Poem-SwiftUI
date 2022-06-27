//
//  Data.swift
//  Poems
//
//  Created by Борис Ларионов on 23.01.2022.
//

import SwiftUI

enum showView: String {
    case explore
    case start
}

struct Poem: Identifiable {
    var id = UUID()
    var text: String
    var author: String
}

var poems = [
Poem(text: "The Big Baboon is found upon\nThe plains of Cariboo;\nHe goes about with nothing on\n(A shocking thing to do.)\nBut if he dressed respectably\nAnd let his whiskers grow\nHow like this Big Baboon would be\nTo Mister So-and-So!", author: "Hilaire Belloc"),
Poem(text: "I heard a horseman\nRide over the hill;\nThe moon shone clear,\nThe night was still;\nHis helm was silver,\nAnd pale was he;\nAnd the horse he rode\nWas of ivory.", author: "Walter de la Mare"),
Poem(text: "Sun of the sleepless! melancholy star! Whose tearful beam glows tremulously far,\nThat show’st the darkness thou canst not dispel,\nHow like art thou to Joy remember’d well!\n\nSo gleams the past, the light of other days,\nWhich shines, but warms not with its powerless rays;\nA night-beam Sorrow watcheth to behold,\nDistinct, but distant – clear, but oh, how cold!", author: "George Gordon Byron"),
Poem(text: "It nods and curtseys and recovers\nWhen the wind blows above,\nThe nettle on the graves of lovers\nThat hanged themselves for love.\nThe nettle nods, the wind blows over,\nThe man, he does not move,\nThe lover of the grave, the lover\nThat hanged himself for love.", author: "Alfred Edward Housman"),
Poem(text: "Hide and seek, says the Wind,\nIn the shade of the woods;\nHide and seek, says the Moon,\nTo the hazel buds;\nHide and seek, says the Cloud,\nStar on to star;\nHide and seek, says the Wave\nAt the harbour bar;\nHide and seek, says I,\nTo myself, and step\nOut of the dream of Wake\nInto the dream of Sleep.", author: "Walter de la Mare"),
]
