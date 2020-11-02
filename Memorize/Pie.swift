//
//  Pie.swift
//  Memorize
//
//  Created by Razvan Litianu on 02/11/2020.
//

import SwiftUI

struct Pie: Shape {
    let startAngle: Angle
    let endAngle: Angle
    var clockwise: Bool = false


    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        return p
    }


}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: .degrees(-90), endAngle: .degrees(110-90), clockwise: true)
            .fill(Color.orange)
            .opacity(0.4)
            .padding()
    }
}
