func findEvenOddNumber (for userNumber : String?) {
    var number = ""
    var intNum = 1

    if userNumber != nil {
        number = userNumber!

        Int(number) != nil ? intNum = Int(number)! : print("Вы ввели дробное число или текст")

        intNum = intNum % 2
        if intNum == 0 && Int(number) != nil {
            print("Введеное четное число")
        }  else if intNum == 1 && Int(number) != nil {
            print("Введеное нечетное число")
        }
    } else {
        print("Вы ничего не ввели")
    }
}

let userNum: String? = readLine()
findEvenOddNumber(for : userNum)
let otherUserNumber: String? = nil
findEvenOddNumber(for : otherUserNumber)
print("----------------")


func divisionOn3 (for userNumber : String?) {
    var number = ""
    var intNum = 1

    if userNumber != nil {
        number = userNumber!

        Int(number) != nil ? intNum = Int(number)! : print("Вы ввели дробное число или текст")

        intNum = intNum % 3
        switch intNum {
        case 0 where Int(number) != nil:
            print("Число делится на 3 без остатка")
        case 1...2 where Int(number) != nil:
            print("Число делится на 3 с остатком")
        default:
            print("Повторите еще раз")
        }
    } else {
        print("Вы ничего не ввели")
    }
}

let userNumber: String? = readLine()
divisionOn3(for: userNumber)
let anotherUserNumber: String? = nil
divisionOn3(for: anotherUserNumber)
print("----------------")




import Darwin

var randomArray = [Int]()
var maxValue = 0

for _ in 0...99 {
    randomArray.append(Int(arc4random_uniform(100)))
}

for i in 1..<randomArray.count {
    if randomArray[i-1] > randomArray[i] {
        maxValue = randomArray[i-1]
        randomArray[i-1] = randomArray[i]
        randomArray[i] = maxValue
    }
        for i in 1..<randomArray.count {
            if randomArray[i-1] > randomArray[i] {
                maxValue = randomArray[i-1]
                randomArray[i-1] = randomArray[i]
                randomArray[i] = maxValue
        }
    }
}

var resultArray = [Int]()
for i in 0..<randomArray.count {
    if randomArray[i] % 2 != 0 && randomArray[i] % 3 == 0  {
        resultArray.append(randomArray[i])
    }
}
print(resultArray)
print("----------------")

//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func newValueFibonachy (userArray : inout [Int]) {
    switch userArray.count {
    case 0:
        userArray.append(1)
        userArray.append(userArray[0] + userArray[0])
    case 1:
        userArray.append(userArray[0] + userArray[0])
    default:
        userArray.append(userArray[userArray.count - 2] + userArray[userArray.count - 1])
    }
}

var testArray = [Int]()
for _ in 1...50 {
    newValueFibonachy(userArray: &testArray)
    if testArray.count > 50 {
        testArray.removeLast()
    }
}

print(testArray.count)
print(testArray)
print("----------------")


/* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно. */

var numbersArray = [Int](2...650)

for divider in numbersArray  {
    for element in numbersArray {
        if element % divider == 0 && element != divider {
            numbersArray.remove(at: numbersArray.firstIndex(of: element)!)
        }
    }
    
    if numbersArray.count > 100 {
        numbersArray.removeLast()
    }
}

print(numbersArray)
print(numbersArray.count)
