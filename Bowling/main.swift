func readInt() -> Int {
    
    while (true) {
        let input = readLine()
        if let stringInput = input {
            if let intInput = Int(stringInput) {
                return intInput
            }
        }
        print("invalid numeric input, try again")
    }
}

func getPlayersNames() -> [String] {
    print("How many players")
    let players = readInt()
    var names = [String]()
    for i in 1...players {
        print("Enter player \(i) name")
        names.append(readLine()!)
    }
    return names
}

var games = [Scorer]()
var names = getPlayersNames()
for _ in names {
    games.append(Scorer())
}

for frameNumber in 1...10 {
    
    for (i, player) in names.enumerated() {
        let game = games[i]
        if !game.complete(){
            print("Frame \(frameNumber): " + player + " bowling, enter number of pins")
            var frameComplete = game.addThrow(readInt())
            while (!frameComplete) {
                print("Add next throw")
                frameComplete = game.addThrow(readInt())
            }
        }
        print(game)
    }
}

print("\n")
for (i, player) in names.enumerated() {
    print(player + ": \(games[i].totalScore())")
}
