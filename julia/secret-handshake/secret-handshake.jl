function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bv = BitVector(digits(code, base=2, pad=16)[1:5])
    actions[bv[1:4]] |> (x -> bv[5] ? reverse(x) : x)
end
