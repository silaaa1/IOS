import Darwin

enum CarError: Error {
    case activeHandBreak
    case lowCoolant
    case unactiveEngine
}

class Car {
    var isActiveHandBreak: Bool
    var levelOfCoolant: Double
    var km: Double
    var isActiveEngine: Bool
    
    func switchHandBreakState() {
        switch isActiveHandBreak {
        case true:
            isActiveHandBreak = false
        case false:
            isActiveHandBreak = true
        }
    }
    func switchEngineState() {
        switch isActiveEngine {
        case true:
            isActiveEngine = false
        case false:
            isActiveEngine = true
        }
    }
    func addKm(_ km: Double) throws {
        guard isActiveEngine else {
            throw CarError.unactiveEngine
        }
        guard isActiveHandBreak == false else {
            throw CarError.activeHandBreak
        }
        guard levelOfCoolant > 2 else {
            throw CarError.lowCoolant
        }
        self.km += km
        self.levelOfCoolant -= 0.01 * km
    }
    func dashboard() {
        if isActiveEngine {
            print("Пробег: \(km)\nУровень охлаждающей жидкости: \(levelOfCoolant)\nГорит лампочка ручного тормоза: \(isActiveHandBreak)\n")
        } else {
            print("Панель не активна")
        }
    }
    
    init?(isActiveHandBreak: Bool, levelOfCoolant: Double, km: Double) {
        guard km >= 0 && levelOfCoolant >= 0 else {
            return nil
        }
        self.levelOfCoolant = levelOfCoolant
        self.km = km
        self.isActiveHandBreak = isActiveHandBreak
        self.isActiveEngine = false
    }
}

let car = Car(isActiveHandBreak: true, levelOfCoolant: 2.1, km: 450)
car!.dashboard()
car?.switchEngineState()
car!.dashboard()
car?.switchHandBreakState()
do {
    try car?.addKm(50)
} catch CarError.unactiveEngine {
    print("Заведите двигатель")
} catch CarError.activeHandBreak {
    print("Уберите ручной тормоз")
} catch CarError.lowCoolant {
    print("Долейте охлаждающую жидкость")
}
car!.dashboard()


