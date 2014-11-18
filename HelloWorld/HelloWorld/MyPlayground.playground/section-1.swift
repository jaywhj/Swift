// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let label = "The width is "
let width = 94
var widthLabel = label + String(width)  //Swift不支持隐式类型转换，需要显式类型转换
widthLabel += "!"
println(widthLabel)



import UIKit
import GLKit
import OpenGLES

let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
class TriangleView: GLKView {
    override func drawRect(dirtyRect: CGRect) {
        glClearColor(0.0, 0.0, 0.1, 1.0)
    }
}