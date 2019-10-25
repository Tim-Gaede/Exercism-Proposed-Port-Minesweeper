""" Tests for the minesweeper exercise

Implementation note:
The board function must validate its input and raise a
ValueError with a *meaningful* error message if the
input turns out to be malformed.
"""

using Test

include("minesweeper.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.1.0

println("\n"^2, "-"^50, "\n"^3)

@testset "No rows" begin
    @test annotate([]) == []
end
println()

@testset "No columns" begin
    @test annotate([""]) == [""]
end
println()

@testset "No mines" begin
    minefield = ["   ",
                 "   ",
                 "   "]
    out = ["   ",
           "   ",
           "   "]
    @test annotate(minefield) == out
end
println()

@testset "Annotate with only mines" begin
    minefield = ["***",
                 "***",
                 "***"]
    out = ["***",
           "***",
           "***"]
    @test annotate(minefield) == out
end
println()

@testset "Mine surrounded by spaces" begin
    minefield = ["   ",
                 " * ",
                 "   "]
    out = ["111",
           "1*1",
           "111"]
    @test annotate(minefield) == out
end
println()

@testset "Space surrounded by mines" begin
    minefield = ["***",
                 "* *",
                 "***"]
    out = ["***",
           "*8*",
           "***"]
    @test annotate(minefield) == out
end
println()

@testset "Horizontal line" begin
    minefield = [" * * "]
    out = ["1*2*1"]
    @test annotate(minefield) == out
end
println()

@testset "Horizontal line mines at edges" begin
    minefield = ["*   *"]
    out = ["*1 1*"]
    @test annotate(minefield) == out
end
println()

@testset "Vertical line" begin
    minefield = [" ",
                 "*",
                 " ",
                 "*",
                 " "]
    out = ["1",
           "*",
           "2",
           "*",
           "1"]
    @test annotate(minefield) == out
end
println()

@testset "Vertical line mines at edges" begin
    minefield = ["*",
                 " ",
                 " ",
                 " ",
                 "*"]
    out = ["*",
           "1",
           " ",
           "1",
           "*"]
    @test annotate(minefield) == out
end
println()

@testset "Cross" begin
    minefield = ["  *  ",
                 "  *  ",
                 "*****",
                 "  *  ",
                 "  *  "]
    out = [" 2*2 ",
           "25*52",
           "*****",
           "25*52",
           " 2*2 "]
    @test annotate(minefield) == out
end
println()

@testset "Large annotate" begin
    minefield = [" *  * ",
                 "  *   ",
                 "    * ",
                 "   * *",
                 " *  * ",
                 "      "]
    out = ["1*22*1",
           "12*322",
           " 123*2",
           "112*4*",
           "1*22*2",
           "111111"]
    @test annotate(minefield) == out
end
println()

# Additional test for this track
@testset "Annotate9" begin
    minefield = ["     ",
                 "   * ",
                 "     ",
                 "     ",
                 " *   "]
    out = ["  111",
           "  1*1",
           "  111",
           "111  ",
           "1*1  "]
    @test annotate(minefield) == out
end
println()

@testset "Different lengths" begin
    minefield = [" ",
                 "*  ",
                 "  "]
    @test_throws DomainError annotate(minefield)
end
println()

@testset "Invalid Char" begin
    minefield = ["X  * "]
    @test_throws DomainError annotate(minefield)
end
println()
