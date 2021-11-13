include("board.jl")
using Game2048: move, add_tile

function simulate_game(curr_board)
    while true
        possible = possible_moves(curr_board)
        if length(possible)==0
            break
        end
        curr_board = move(curr_board, possible[rand(1:length(possible))])
        curr_board = add_tile(curr_board)     
    end
    
    return get_value(curr_board)
end