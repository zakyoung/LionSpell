//
//  letterButtonShapes.swift
//  LionSpell
//
//  Created by Zak Young on 1/28/24.
//

import SwiftUI
struct letterButtonShapes: Shape {
    var factors: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2) // Starting at the center of the given rectangle
        let radius = min(rect.size.height, rect.size.width)/8 // 8 appears to be a good size based on the button size.
        let corns : [CGPoint] = cornerPoints(center: center, radius: radius, factor: factors)
        path.move(to: corns[0])
        for corner in corns.dropFirst(){
            path.addLine(to: corner)
        }
        path.closeSubpath()
        return path
    }
}
func cornerPoints(center: CGPoint, radius: CGFloat,factor:CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
            let angle = CGFloat.pi / factor * CGFloat(i)
            let point = CGPoint(x: center.x + radius * cos(angle),y: center.y + radius * sin(angle))
            points.append(point)
        }
        return points
    }
#Preview {
    letterButtonShapes(factors:2.5)
}
