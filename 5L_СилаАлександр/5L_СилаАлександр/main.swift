enum Transmission: String {
    case manual = "Ручная"
    case auto = "Автоматическая"
}
enum CarEngineState: String {
    case on = "сейчас заведен"
    case off = "сейчас заглушен"
}
enum CarWindowState: String {
    case opened = "открыты"
    case closed = "закрыты"
}
enum Color {
    case black, white, blue, green, red, gray, orange, yellow,
    lightBlue, purple
}

protocol Car {
    var engineState: CarEngineState {get set}
    var transmission: Transmission {get}
    var color: Color {get set}
    var windowState: CarWindowState {get set}
    var yearOfIssue: Int {get}
    var brand: String {get}
    var km: Double {get set}
}

//MARK: Extention Car with new methods
extension Car {
    mutating func switchEngineState() {
        switch engineState {
        case .off:
            engineState = .on
        case .on:
            engineState = .off
        }
        print("Двигатель \(engineState.rawValue)")
    }
    mutating func switchWindowState() {
        switch windowState {
        case .closed:
            windowState = .opened
        case .opened:
            windowState = .closed
        }
        print("Окна сейчас \(windowState.rawValue)")
    }
    mutating func changeColor(color: Color) {
        self.color = color
        print("Перекрасили машину в \(color) цвет")
    }
    mutating func addKm(km : Double) {
        self.km += km
        print("Проехали \(km) км")
    }
}

//MARK: New class SportCar
class SportCar: Car {
    let transmission: Transmission
    let yearOfIssue: Int
    let brand: String
    var engineState: CarEngineState = .off
    var color: Color
    var windowState: CarWindowState = .closed
    var km: Double
    var hydraulicSuspensionState: HydraulicSuspensionState = .allLow {
        didSet {
            print("Состояние гидравлической подвески поменялось на \(hydraulicSuspensionState)")
        }
    }
    var bottomIlluminationState: BottomIlluminationState = .off {
        didSet {
            print("Нижняя подсветка \(bottomIlluminationState.rawValue)")
        }
    }
    
    
    func changeHydraulicState(position: HydraulicSuspensionState) {
        switch position {
        case .allLow:
            hydraulicSuspensionState = .allLow
        case .frontUp:
            hydraulicSuspensionState = .frontUp
        case .backUp:
            hydraulicSuspensionState = .backUp
        case .rightSideUp:
            hydraulicSuspensionState = .rightSideUp
        case .leftSideUp:
            hydraulicSuspensionState = .leftSideUp
        }
    }
    func switchBottomIllumination() {
        switch bottomIlluminationState {
        case .off:
            bottomIlluminationState = .on
        case .on:
            bottomIlluminationState = .off
        }
    }
    
    init?(brand: String, yearOfIssue: Int, transmission: Transmission, color: Color, km: Double) {
        guard yearOfIssue > 1950 && yearOfIssue < 2023 && km >= 0 else {
            return nil
        }
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.transmission = transmission
        self.color = color
        self.km = km
    }
    
    enum BottomIlluminationState: String {
        case on = "включена"
        case off = "выключена"
    }
    enum HydraulicSuspensionState {
        case allLow
        case frontUp
        case backUp
        case rightSideUp
        case leftSideUp
    }
}


//MARK: New class TunkCar
class TunkCar: Car {
    let transmission: Transmission
    let yearOfIssue: Int
    let brand: String
    var engineState: CarEngineState = .off
    var color: Color
    var windowState: CarWindowState = .closed
    var km: Double
    let tunkVolume: Double
    var tunkLoading: Double
    
    func addTunkLoading(quantity: Double) {
        switch tunkLoading {
        case _ where tunkLoading + quantity <= tunkVolume:
            tunkLoading += quantity
            print("В цистерну залили \(quantity) литров")
        default:
            print("В цистерне нет столько места")
        }
    }
    func decreaseTunkLoading(quantity: Double){
        switch tunkLoading {
        case _ where tunkLoading - quantity < 0:
            print("В цистрене нет столько жидкости")
        default:
            tunkLoading -= quantity
            print("Из цистерны слили \(quantity) литров, осталось \(tunkLoading) л.")
        }
    }
    
    init?(brand: String, yearOfIssue: Int, transmission: Transmission, color: Color, km: Double, tunkVolume: Double, tunkLoading: Double) {
        guard yearOfIssue > 1950 && yearOfIssue < 2023 && km >= 0 && tunkVolume >= 0 && tunkLoading >= 0 else {
            return nil
        }
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.transmission = transmission
        self.color = color
        self.km = km
        self.tunkVolume = tunkVolume
        self.tunkLoading = tunkLoading
    }
}

//MARK: Extension SportCar with CustomStringConvertible
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(brand) \(yearOfIssue) года выпуска\nЦвет \(color)\nКоробка передач \(transmission.rawValue)\nCостояние:\nдвигатель \(engineState.rawValue) | окна \(windowState.rawValue)\nПробег машины \(km) км\nГидравлическая подвеска в положении \(hydraulicSuspensionState)\nНижняя подсветка \(bottomIlluminationState.rawValue)\n"
    }
}


var sportCar = SportCar(brand: "Honda", yearOfIssue: 2021, transmission: .auto, color: .yellow, km: 2201)
sportCar?.switchEngineState()
sportCar?.switchBottomIllumination()
sportCar?.addKm(km: 24)
sportCar?.changeHydraulicState(position: .frontUp)
print(sportCar!.description)
print("------------------------")

//MARK: Extension TunkCar with CustomStringConvertible
extension TunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(brand) \(yearOfIssue) года выпуска\nЦвет \(color)\nКоробка передач \(transmission.rawValue)\nCостояние:\nдвигатель \(engineState.rawValue) | окна \(windowState.rawValue)\nПробег машины \(km) км\nЗаполненность цистерны: \(tunkLoading) л. из \(tunkVolume) л.\n"
    }
}

var tunkCar = TunkCar(brand: "Volvo", yearOfIssue: 2005, transmission: .manual, color: .orange, km: 36000, tunkVolume: 1000, tunkLoading: 0)
tunkCar?.addTunkLoading(quantity: 500)
tunkCar?.switchEngineState()
tunkCar?.addKm(km: 267)
tunkCar?.decreaseTunkLoading(quantity: 400)
print(tunkCar!.description)
