class Car {
    let brand: Brand
    let color: Color
    let transmission: Transmission
    let engineType: EngineType
    let yearOfIssue: Int
    var engineState: CarEngineState
    var windowState: CarWindowState
    var km: Double {
        didSet {
            var milage: Double = 0
            milage = milage + km
            print("Новый километраж \(milage)")
        }
    }
    
    final func addKm(km : Double) {
        self.km += km
    }
    final func startEngine(action: CarEngineState) {
        switch action {
        case .on:
            self.engineState = .on
        case .off:
            self.engineState = .off
        }
    }
    func specialAction() {
        print("В этой машине нет специальных действий")
    }
    func description() {
        print("""
    Автомобиль \(brand) \(yearOfIssue) года выпуска, цвет \(color),
    коробка передач \(transmission.rawValue), тип двигателя \(engineType),
    состояние двигателя \(engineState.rawValue), окна \(windowState.rawValue),
    километраж \(km).
""")
    }
    
    init? (brand: Brand, yearOfIssue: Int, color: Color,
           transmission: Transmission, engineType: EngineType,
           engineState: CarEngineState, windowState: CarWindowState, km: Double) {
        guard yearOfIssue > 1900 && km >= 0 else {
            return nil
        }
        self.yearOfIssue = yearOfIssue
        self.km = km
        self.brand =  brand
        self.color = color
        self.transmission = transmission
        self.engineType = engineType
        self.engineState = engineState
        self.windowState = windowState
        
    }
    init(brand: Brand) {
        self.brand = brand
        self.color = .white
        self.transmission = .manual
        self.engineType = .fuelGas
        self.yearOfIssue = 2022
        self.engineState = .off
        self.windowState = .closed
        self.km = 0.0
    }
    
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
        case on = "Сейчас двигатель заведен"
        case off = "Сейчас двигатель заглушен"
    }
    enum CarWindowState: String {
        case opened = "открыты"
        case closed = "закрыты"
    }
}

var car = Car(brand: .lada)
car.description()
car.startEngine(action: .on)
car.addKm(km: 23)
car.specialAction()
print("--------------------")


class SportCar: Car {
    var hydraulicSuspensionState: HydraulicSuspensionState {
        didSet {
            print("Состояние гидравлической подвески поменялось на \(hydraulicSuspensionState)")
        }
    }
    var bottomIlluminationState: BottomIlluminationState {
        didSet {
            print(bottomIlluminationState.rawValue)
        }
    }
    
    init?(brand: Car.Brand, yearOfIssue: Int, color: Car.Color, transmission: Car.Transmission,
          engineType: Car.EngineType, engineState: Car.CarEngineState, windowState: Car.CarWindowState,
          km: Double, hydraulicSuspensionState: HydraulicSuspensionState, bottomIlluminationState: BottomIlluminationState) {
        self.bottomIlluminationState = bottomIlluminationState
        self.hydraulicSuspensionState = hydraulicSuspensionState
        super.init(brand: brand, yearOfIssue: yearOfIssue, color: color, transmission: transmission, engineType: engineType,
                   engineState: engineState, windowState: windowState, km: km)
    }
    override init(brand: Brand) {
        self.hydraulicSuspensionState = .allLow
        self.bottomIlluminationState = .off
        super.init(brand: brand)
    }
    
    override func description() {
        print("""
    Автомобиль \(brand) \(yearOfIssue) года выпуска, цвет \(color),
    коробка передач \(transmission.rawValue), тип двигателя \(engineType),
    состояние двигателя \(engineState.rawValue), окна \(windowState.rawValue),
    \(bottomIlluminationState.rawValue),
    гидравлическая подвеска в состоянии \(hydraulicSuspensionState), километраж \(km).
""")
    }
    func specialAction(for action: HydraulicSuspensionState) {
        switch action {
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
    func bottomIlluminationSwitch() {
        switch bottomIlluminationState {
        case .off:
            bottomIlluminationState = .on
        case .on:
            bottomIlluminationState = .off
        }
    }
    
    enum BottomIlluminationState: String {
        case on = "Подсветка включена"
        case off = "Подсветка выключена"
    }
    enum HydraulicSuspensionState {
        case allLow
        case frontUp
        case backUp
        case rightSideUp
        case leftSideUp
    }
}


var sportCar = SportCar(brand: .toyota)
sportCar.description()
sportCar.specialAction(for: .rightSideUp)
sportCar.bottomIlluminationSwitch()
sportCar.addKm(km: 30.5)
print("--------------------")


class TrunkCar: Car {
    var trunkState: TrunkState
    var trunkLoadingKg: Double
    let trunkVolumeKg: Double
    
    enum TrunkState: String {
        case empty = "пуст"
        case full = "места нет"
        case haveSomeSpace = "неполная загрузка"
    }
    
    func specialAction(switchKgInTrunk kg : Double) {
        switch trunkState {
        case .empty:
            kg <= trunkVolumeKg ? trunkLoadingKg = kg : print("Слишком большой груз")
        case .full:
            print("Для груза нет места")
        case .haveSomeSpace:
            kg + trunkLoadingKg <= trunkVolumeKg ? trunkLoadingKg += kg : print("Слишком большой груз")
        }
    }
    override func description() {
        switch trunkLoadingKg {
        case 0.0:
            trunkState = .empty
        case _ where trunkLoadingKg > 0 && trunkLoadingKg < trunkVolumeKg:
            trunkState = .haveSomeSpace
        case _ where trunkLoadingKg == trunkVolumeKg:
            trunkState = .full
        default:
            print("Слишком большой груз")
        }
        print("""
    Автомобиль \(brand) \(yearOfIssue) года выпуска, цвет \(color),
    коробка передач \(transmission.rawValue), тип двигателя \(engineType),
    состояние двигателя \(engineState.rawValue), окна \(windowState.rawValue),
    состояние багажника \(trunkState.rawValue), объем багажника \(trunkVolumeKg),
    загруженность багажника \(trunkLoadingKg), километраж \(km).
""")
    }
    
    init?(brand: Car.Brand, yearOfIssue: Int, color: Car.Color, transmission: Car.Transmission,
          engineType: Car.EngineType, engineState: Car.CarEngineState, windowState: Car.CarWindowState,
          km: Double, trunkVolumeKg: Double, trunkLoadingKg: Double, trunkState: TrunkState) {
        guard trunkVolumeKg >= trunkLoadingKg else {
            return nil
        }
        self.trunkVolumeKg = trunkVolumeKg
        self.trunkLoadingKg = trunkLoadingKg
        self.trunkState = trunkState

        super.init(brand: brand, yearOfIssue: yearOfIssue, color: color, transmission: transmission, engineType: engineType, engineState: engineState, windowState: windowState, km: km)
    }
    override init(brand: Brand) {
        self.trunkState = .empty
        self.trunkVolumeKg = 500.0
        self.trunkLoadingKg = 0.0
        super.init(brand: brand)
    }
}


var trunkCar = TrunkCar(brand: .ford)
trunkCar.description()
trunkCar.specialAction(switchKgInTrunk: 600)
trunkCar.specialAction(switchKgInTrunk: 450)
trunkCar.startEngine(action: .on)
trunkCar.addKm(km: 24.3)
print("--------------------")
trunkCar.description()
trunkCar.startEngine(action: .off)
trunkCar.specialAction(switchKgInTrunk: 0)
print("--------------------")
trunkCar.description()
