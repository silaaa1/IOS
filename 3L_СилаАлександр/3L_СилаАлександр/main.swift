enum Transmission: String {
    case manual = "Ручная"
    case auto = "Автоматическая"
}
enum Color {
    case black, white, blue, green, red, gray, orange, yellow,
    lightBlue, purple
}
enum EngineType {
    case electrical, diesel, fuelGas, hibrid
}
enum Brand {
    case honda, mazda, lada, bmv, mersedes, toyota, geely, opel,
    wolksVagen, skoda, kia, ford, lamborgini, landRover, maz, kamaz, volvo
}
enum CarEngineState: String {
    case on = "Двигатель заведен"
    case off = "Двигатель заглушен"
}
enum CarWindowState: String {
    case opened = "открыты"
    case closed = "закрыты"
}
enum CarTrunkState: String {
    case opened = "открыт"
    case closed = "закрыт"
}
enum CarTrunkСontent {
    case full
    case empty
    case some (kg : Double)
}

struct SportCar {
    
    let brand: Brand
    let color: Color
    let transmission: Transmission
    let engineType: EngineType
    let yearOfIssue: Int
    var carTrunkContent: CarTrunkСontent
    var engineState: CarEngineState
    var windowState: CarWindowState {
        willSet {
            if newValue == .opened {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        }
    }
    
    var km: Double {
        didSet {
            var milage: Double = 0
            milage = milage + km
            print("Новый километраж \(milage)")
        }
    }
    
    var trunkState: CarTrunkState
    
    
    mutating func addKm(km : Double) {
        self.km += km
    }
    mutating func startEngine(action: CarEngineState) {
        switch action {
        case .on:
            self.engineState = .on
        case .off:
            self.engineState = .off
        }
    }
    func description() {
        print("""
    Автомобиль \(brand) \(yearOfIssue) года выпуска, цвет \(color), коробка передач \(transmission.rawValue), тип двигателя \(engineType),
    состояние двигателя \(engineState.rawValue), окна \(windowState.rawValue), багажник \(carTrunkContent) \(trunkState.rawValue), километраж \(km).
""")
    }
    
    init? (brand: Brand, color: Color, transmission: Transmission, engineType: EngineType, yearOfIssue: Int,
          carTrunkContent: CarTrunkСontent, engineState: CarEngineState, windowState: CarWindowState, km: Double, trunkState: CarTrunkState) {
        guard yearOfIssue > 1900 && km >= 0 else {
            return nil
        }
        self.yearOfIssue = yearOfIssue
        self.km = km
        self.brand =  brand
        self.color = color
        self.transmission = transmission
        self.engineType = engineType
        self.carTrunkContent = carTrunkContent
        self.engineState = engineState
        self.windowState = windowState
        self.trunkState = trunkState
    }
    
    init() {
        self.brand =  .lada
        self.color = .black
        self.transmission = .manual
        self.engineType = .fuelGas
        self.yearOfIssue = 2022
        self.carTrunkContent = .empty
        self.engineState = .off
        self.windowState = .closed
        self.km = 0.0
        self.trunkState = .closed
    }
}

var carLamb = SportCar(brand: .lamborgini, color: .orange, transmission: .auto, engineType: .fuelGas, yearOfIssue: 2000, carTrunkContent: .empty, engineState: .off, windowState: .closed, km: 0.0, trunkState: .closed)!
print(carLamb.engineState)
carLamb.startEngine(action: .on)
print(carLamb.engineState)
carLamb.addKm(km: 1)
carLamb.addKm(km: 2)
carLamb.description()
print("--------------------")

var defoultCar = SportCar()
defoultCar.startEngine(action: .on)
defoultCar.windowState = .opened
defoultCar.trunkState = .opened
defoultCar.description()

print("--------------------")

struct TrunkCar {
    
    let brand: Brand
    let color: Color
    let transmission: Transmission
    let engineType: EngineType
    let yearOfIssue: Int
    var carTrunkContent: CarTrunkСontent
    var engineState: CarEngineState
    var windowState: CarWindowState {
        willSet {
            if newValue == .opened {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        }
    }
    
    var km: Double {
        didSet {
            var milage: Double = 0
            milage = milage + km
            print("Новый километраж \(milage)")
        }
    }
    
    var trunkState: CarTrunkState
    
    
    mutating func addKm(km : Double) {
        self.km += km
    }
    mutating func startEngine(action: CarEngineState) {
        switch action {
        case .on:
            self.engineState = .on
        case .off:
            self.engineState = .off
        }
    }
    func description() {
        print("""
    Автомобиль \(brand) \(yearOfIssue) года выпуска, цвет \(color), коробка передач \(transmission.rawValue), тип двигателя \(engineType),
    состояние двигателя \(engineState.rawValue), окна \(windowState.rawValue), багажник \(carTrunkContent) \(trunkState.rawValue), километраж \(km).
""")
    }
    
    init? (brand: Brand, color: Color, transmission: Transmission, engineType: EngineType, yearOfIssue: Int,
          carTrunkContent: CarTrunkСontent, engineState: CarEngineState, windowState: CarWindowState, km: Double, trunkState: CarTrunkState) {
        guard yearOfIssue > 1900 && km >= 0 else {
            return nil
        }
        self.yearOfIssue = yearOfIssue
        self.km = km
        self.brand =  brand
        self.color = color
        self.transmission = transmission
        self.engineType = engineType
        self.carTrunkContent = carTrunkContent
        self.engineState = engineState
        self.windowState = windowState
        self.trunkState = trunkState
    }
    init() {
        self.brand =  .kamaz
        self.color = .black
        self.transmission = .manual
        self.engineType = .diesel
        self.yearOfIssue = 2022
        self.carTrunkContent = .empty
        self.engineState = .off
        self.windowState = .closed
        self.km = 0.0
        self.trunkState = .closed
    }
}

var carVolvo = TrunkCar(brand: .volvo, color: .blue, transmission: .manual, engineType: .diesel, yearOfIssue: 2005, carTrunkContent: .full, engineState: .off, windowState: .opened, km: 43000, trunkState: .closed)!
carVolvo.startEngine(action: .on)
carVolvo.windowState = .closed
carVolvo.addKm(km: 2350)
carVolvo.description()
print("--------------------")

var defCar = TrunkCar()
defCar.description()
