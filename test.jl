include("board.jl")
include("mcts.jl")
include("simulate.jl")
using Game2048: move, initbboard, Dirs
discount_factor = 0.9

TR(s, a) = move(s, a)
P_2048 = MDP_mcts(0.9,nothing,  instances(Dirs),nothing, nothing, TR )
println(P_2048.𝒜)
println([Integer(a) for a in P_2048.𝒜])

U(s) = simulate_game(s)



mcts_struct = MonteCarloTreeSearch(
    P_2048, 
    Dict(),
    Dict(),
    3, 
    500, 
    0.1, 
    U, 
)

function play()
    init_board = initbboard()
    possible = possible_moves(init_board)


    curr_board = init_board
    while (length(possible)>0)
        action_to_take = mcts_struct(curr_board)
        curr_board = move(curr_board, action_to_take)
        curr_board = add_tile(curr_board)
        possible = possible_moves(curr_board)
    end
    display(curr_board)
    println(get_value(curr_board))
        

end
play()
