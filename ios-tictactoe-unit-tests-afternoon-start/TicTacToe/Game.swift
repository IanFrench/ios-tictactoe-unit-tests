//
//  Game.swift
//  TicTacToe
//
//  Created by Ian French on 7/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
    case active(GameBoard.Mark)
    case cat
    case won(GameBoard.Mark)
}

struct Game {

    private(set) var board: GameBoard = GameBoard()

    var activePlayer: GameBoard.Mark? = .x
    var gameOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil

    var state: GameState {
        if let winningPlayer = winningPlayer {
            return .won(winningPlayer)
        } else if gameOver {
            return .cat
        } else {
            return .active(activePlayer!)
        }
    }

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameOver = false
        winningPlayer = nil

    }

    mutating internal func makeMark(at coordinate: Coordinate) throws {

        guard let activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)

        if game(board: board, isWonBy: activePlayer) {
            gameOver = true
            winningPlayer = activePlayer

        } else if board.isFull {
            gameOver = true
            winningPlayer = nil

        } else {
            if activePlayer == .x {
                self.activePlayer = .o

            } else {
                self.activePlayer = .x
            }
        }
    }
}
