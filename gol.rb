#!/usr/bin/env ruby

require_relative 'lib/game'

game = Game.new
game.generate_seed(10, 10)
game.start(10)
