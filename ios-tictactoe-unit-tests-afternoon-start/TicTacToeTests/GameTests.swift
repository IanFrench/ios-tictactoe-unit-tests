//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ian French on 7/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe



class GameTests: XCTestCase {


func testRestart() throws {
        let board = GameBoard()
        let game = Game()


        XCTAssertTrue(board.isEmpty)

        XCTAssertEqual(game.activePlayer, .x)
    }

    func testmakeMark() throws {
        var game = Game()


        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.board[(0, 0)], .x)

        try game.makeMark(at: (0, 1))
        XCTAssertEqual(game.board[(0, 1)], .o)
    }

}
