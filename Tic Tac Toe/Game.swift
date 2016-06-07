//
//  Game.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/14/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import Foundation
class Game: NSObject, NSCoding {
    static var key: String = "Games"
    static var schema: String = "gameList"
    var objective: TicTacToeGame
    var createdAt: NSDate
    // use this init for creating a new Game
    init(obj: TicTacToeGame) {
        objective = obj
        createdAt = NSDate()
    }
    // MARK: - NSCoding protocol
    // used for encoding (saving) objects
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(objective, forKey: "objective")
        aCoder.encodeObject(createdAt, forKey: "createdAt")
    }
    // used for decoding (loading) objects
    required init?(coder aDecoder: NSCoder) {
        objective = aDecoder.decodeObjectForKey("objective") as! TicTacToeGame
        createdAt = aDecoder.decodeObjectForKey("createdAt") as! NSDate
        super.init()
    }
    // MARK: - Queries
    static func all() -> [Game] {
        var Games = [Game]()
        let path = Database.dataFilePath("theList")
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                Games = unarchiver.decodeObjectForKey(Game.key) as! [Game]
                unarchiver.finishDecoding()
            }
        }
        return Games
    }
    
    static func last() -> Game? {
        var Games = [Game]()
        let path = Database.dataFilePath("theList")
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                Games = unarchiver.decodeObjectForKey(Game.key) as! [Game]
                unarchiver.finishDecoding()
            }
        }
        if Games.count == 0 {
            return nil
        } else {
            return Games[Games.count - 1]
        }
    }
    
    func save() {
        var GamesFromStorage = Game.all()
        var exists = false
        for var i = 0; i < GamesFromStorage.count; ++i {
            if GamesFromStorage[i].createdAt == self.createdAt {
                GamesFromStorage[i] = self
                exists = true
            }
        }
        if !exists {
            GamesFromStorage.append(self)
        }
        Database.save(GamesFromStorage, toSchema: Game.schema, forKey: Game.key)
    }
}