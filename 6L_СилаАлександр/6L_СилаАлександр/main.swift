struct Queue <N: Equatable> {
    var elements: [N] = []

    mutating func push(element: N) {
        elements.append(element)
    }
    mutating func pop() {
        elements.removeFirst()
    }
    mutating func reverse() {
        self.elements = elements.reversed()
    }
    mutating func filter(element: N) -> [N]? {
        var filteredElements = [N]()
        for _ in 0..<elements.count {
            for i in 0..<elements.count {
            if elements[i] == element {
                filteredElements.append(element)
                 }
            }
            return filteredElements
        }
        return nil
    }
    
    subscript(index: UInt) -> N? {
        index < elements.count ? elements[Int(index)] : nil
    }
}

var array = Queue<Int>()
print(array[0])
array.push(element: 5)
array.push(element: 4)
array.push(element: 7)
array.push(element: 3)
array.push(element: 1)
array.push(element: 1)
array.push(element: 1)
array.push(element: 7)
array.push(element: 7)
array.push(element: 1)
print(array)
array.reverse()
print(array)
print(array[1])
var newArray = array.filter(element: 7)
print(newArray ?? "")
newArray = array.filter(element: 1)
print(newArray ?? "")

print("------------")

var someArray = Queue<String>()
print(someArray[0])
someArray.push(element: "Maks")
someArray.push(element: "Vlad")
someArray.push(element: "Patric")
someArray.push(element: "Maks")
someArray.push(element: "Petr")
someArray.push(element: "Kolya")
someArray.push(element: "Maks")
print(someArray)
print(someArray[5])
var newSomeArray = someArray.filter(element: "Maks")
print(newSomeArray ?? "")
