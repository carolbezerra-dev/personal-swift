//### 1 - Using the operator &&
//Create a function called `compareTrue` that, when receiving two booleans
//- Return `true` if both values are true;
//- Return `false` if one or both parameters are false.

func compareTrue(boolA: Bool, boolB: Bool) -> Bool {
    boolA && boolB
}

compareTrue(boolA: true, boolB: true) //true
compareTrue(boolA: true, boolB: false) //false
compareTrue(boolA: false, boolB: true) //false
compareTrue(boolA: false, boolB: false) //false

//### 2 - Triangle area
//Write a function named `calcArea` that receives a base value (called `base`) and a height value (called `height`) of a triangle and returns the calculation of its area.
//Remember that the area of a triangle is calculated using the following formula: (base * height) / 2.

func calcArea(base: Float, height: Float) -> Float {
    (base * height) / 2
}

calcArea(base: 12, height: 8) //48
calcArea(base: 18, height: 12) //108

//### 3 - Dividing the sentence
//Write a function with the name `splitSentence`, which will receive a string and return an array of strings separated by each space in the original string.
//Example: if the function receives the string `"go Trybe"`, the return should be `['go', 'Trybe']`.

func splitSentence(_ setence: String) -> [String] {
    setence.split(separator: " ").map(String.init)
    // split returns String.SubSequence, to have [String] it needs to use map
}

splitSentence("go Trybe") //["go", "Trybe"]
splitSentence("Mobile iOS Dev") //["Mobile", "iOS", "Dev"]

//### 4 - String concatenation
//Write a function with the name `concatName` that, upon receiving an array of strings, returns a string with the format `'LAST ITEM, FIRST ITEM'`, regardless of the size of the array.
//Example: if the parameter passed to `concatName` is Array ['Lucas', 'Cassiano', 'Ferraz', 'Paolillo'], the function should return `Paolillo, Lucas`.

func concatName(_ names: [String]) -> String {
    "\(names[names.count - 1]), \(names[0])"
    // first and last return Optional value
}

concatName(["Lucas", "Cassiano", "Ferraz", "Paolillo"]) // "Paolillo, Lucas"
concatName(["Dev", "Mobile", "iOS"]) // "iOS, Dev"

//### 5 - Points in football
//Write a function with the name `footballPoints` that receives the number of wins (this parameter should be called `wins`) and the number of ties (this parameter should be called `ties`) and return the number of points that the team scored in a championship.
//Therefore, consider that each victory is worth 3 points and each draw is worth 1 point.

func footballPoints(wins: Int, ties: Int) -> Int {
    let victoryPoints = wins * 3
    return victoryPoints + ties
}

footballPoints(wins: 1, ties: 1) //4
footballPoints(wins: 4, ties: 1) //13

//### 6 - Repetition of the largest number
//Write a function called `highestCount` that, upon receiving an array of numbers, returns the number of times the largest of them is repeated.
//Example: if the parameter of `highestCount` is an array with values `[9, 1, 2, 3, 9, 5, 7]`, the function should return `2`, which is the number of times that the number `9` (highest number of the array) is repeated.

func highestCount(numbers: [Int]) -> Int {
    var counts: [String: Int] = [:]
    var highest = 0

    for item in numbers {
        counts[String(item)] = (counts[String(item)] ?? 0) + 1
    }

    for (_, value) in counts {
        if value > highest {
            highest = value
        }
    }

    return highest
}

highestCount(numbers: [9, 1, 2, 3, 9, 5, 7])
highestCount(numbers: [9, 1, 9, 3, 9, 5, 9])

//### 7 - Mouse Hunt
//Imagine that there are two cats, which we will call `cat1` and `cat2`, and that both are after a mouse called `mouse`. Imagine that each of the three animals is in a position represented by a number.
//Knowing this, create a function called `catAndMouse` that, upon receiving the position of `mouse`, `cat1` and` cat2`, **in that order**, calculate the distances between the mouse and the cats and return which of the felines will reach the mouse first (the one that will be closest).
//Example: if the cat `cat2` is 2 units away from the mouse, and `cat1` is 3 units away, its function should return `'cat2'`.
//If the cats are at the same distance from the mouse, the function should return the string `"cats bump and the mouse runs away"`.

func catAndMouse(_ mouse: Float, _ cat1: Float, _ cat2: Float) -> String {
    let distanceMousetoCat1 = abs(mouse - cat1)
    let distanceMousetoCat2 = abs(mouse - cat2)

    switch true {
    case distanceMousetoCat1 > distanceMousetoCat2:
        return "cat2"
    case distanceMousetoCat1 < distanceMousetoCat2:
        return "cat1"
    default:
        return "cats bump and the mouse runs away"
    }
}

catAndMouse(0, 1, 2) //"cat1"
catAndMouse(1, 3, 2) //"cat2"
catAndMouse(2, 2, 2) //"cats bump and the mouse runs away"

//### 8 - FizzBuzz
//Create a function called `fizzBuzz` that receives an array of numbers and returns an array as follows:
//- For each Array number that is divisible by only 3, present a string `"fizz "`;
//- For each Array number that is divisible by only 5, present a string `"buzz"`;
//- If the number is divisible by 3 and 5, return the string `"fizzBuzz"`;
//- If the number cannot be divided by 3 or 5, return the string `"bug!"`;
//Example: if the parameter is [2, 15, 7, 9, 45], your function should return `["bug!","fizzBuzz","bug!","fizz","fizzBuzz"]`.

func fizzBuzz(numbers: [Int]) -> [String] {
    var result: [String] = []

    for i in numbers {
        switch true {
        case i % 3 == 0 && i % 5 == 0:
            result.append("fizzBuzz")
        case i % 3 == 0 && i % 5 != 0:
            result.append("fizz")
        case i % 3 != 0 && i % 5 == 0:
            result.append("buzz")
        default:
            result.append("bug!")
        }
    }

    return result
}

fizzBuzz(numbers: [2, 15, 7, 9, 45]) //["bug!","fizzBuzz","bug!","fizz","fizzBuzz"]
fizzBuzz(numbers: [20, 81, 15, 77, 405]) //["buzz!","fizz","fizzBuzz","bug!","fizzBuzz"]

//### 9 - Encode and Decode
//Create two functions: the first should be called `encode` and, when receiving a string as a parameter, you should replace all lowercase vowels with numbers, according to the following format:
//a -> 1 \
//e -> 2 \
//i -> 3 \
//o -> 4 \
//u -> 5
//That is, if the `encode` parameter is `"hi there!"`, The return should be `"h3 th2r2!"`.
//The second function should be called `decode` and does the opposite of `encode` - that is, it receives a string containing numbers instead of lowercase letters and will return a string with lowercase vowels instead of numbers (so, if the parameter of `decode` is `"h3 th2r2!"`, the return should be `"hi there!"`).

func encode(phrase: String) -> String {
    let code = [
        "a": 1,
        "e": 2,
        "i": 3,
        "o": 4,
        "u": 5
    ]
    var phraseEnconded = ""
    var justKeys = [""]

    for (key, _) in code {
        justKeys.append(key)
    }

    for i in phrase {
        var turnString = String(i)

        if justKeys.contains(turnString) {
            guard let letter = code[turnString] else { return "" }
            phraseEnconded += String(letter)
        } else {
            phraseEnconded += turnString
        }
    }

    return phraseEnconded
}

encode(phrase: "hi there!") //"h3 th2r2!"
encode(phrase: "dev mobile ios") //"d2v m4b3l2 34s"

//### 10 - List of technologies
//Create a function that receives an array of technology names that you want to learn. This function must also receive a second parameter called `name` with a name.
//For each technology in the array, create an object with the following structure:
//`` [ tech: "NomeTech", name: name ] ``
//These objects must be inserted in a new list in ascending order from the `tech` field in the object.
//The output of your function should be a list of objects ordered by the `tech` field of the objects with the format above.
//Example: `` Function inputs: ["CSS", "HTML"], "Lucas"
// Output: [ [tech: "CSS", name: "Lucas"], [tech: "HTML", name: "Lucas"] ``
//If the array comes empty, its function should return 'Empty!'

func listOfTechnologies(techs: [String], name: String) -> [[String: String]] {
    if techs.isEmpty {
        return [["tech": "", "name": "Empty!"]]
    }

    var dictionaryFromList = [["tech": "", "name": ""]]

    for i in techs {
        dictionaryFromList.append(["tech": String(i), "name": name])
    }

    dictionaryFromList.removeFirst()
    return dictionaryFromList
}

listOfTechnologies(techs: ["CSS", "HTML"], name: "Lucas")
//[ [tech: "CSS", name: "Lucas"], [tech: "HTML", name: "Lucas"]
listOfTechnologies(techs: ["SwiftUI", "ViewCode"], name: "Carol")
//[ [tech: "SwiftUI", name: "ViewCode"], [tech: "HTML", name: "Carol"]
