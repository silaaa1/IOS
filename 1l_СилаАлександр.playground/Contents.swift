import UIKit

let a: Float = 1
let b: Float = 2
let c: Float = -8

var D: Float = (b * b) - (4 * a * c)
var x: Float
var x1: Float
var x2: Float

if D < 0 {
  print("уравнение не имеет решений")
} else if D == 0 {
    x = (-1 * b) / (2 * a)
    print(x)
} else {
    x1 = ((-1 * b) + D.squareRoot()) / (2 * a)
    x2 = ((-1 * b) - D.squareRoot()) / (2 * a)
    print(x1)
    print(x2)
}



let leg1: Float = 21.9
let leg2: Float = 26
let S: Float = leg1 * leg2 / 2
let hyp: Float = (leg1 * leg1 + leg2 * leg2).squareRoot()
let P = hyp + leg1 + leg2

print("Периметр треугольника = \(P)",
      "Площадь треугольника = \(S)",
      "Гипотенуза = \(hyp)")



var dep: Float = 50000
let pct: Float = 8
let years = 5
for _ in 1...years * 12 {
    dep = dep + dep * (pct / 100 / 12)
}
print("Вклад за \(years) равен \((dep * 100).rounded() / 100)")
