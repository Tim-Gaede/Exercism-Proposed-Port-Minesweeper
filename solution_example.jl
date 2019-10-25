function annotate(minefield)

    inequality_found = false
    r = 1
    while !inequality_found  &&  r < length(minefield)
        if length(minefield[r]) != length(minefield[r+1])
            throw(DomainError("The rows are not of equal span."))
        end

        r += 1
    end


    ann = String[] # annotated
    for r = 1 : length(minefield)
        ann_row = ""
        for c = 1 : length(minefield[r])
            if minefield[r][c] == ' '
                cnt = 0
                for rₜ  = r-1 : r+1 # test rows
                    if rₜ in range(1,  stop=length(minefield))
                        for cₜ = c-1 : c+1 # test cols
                            if cₜ in range(1, stop=length(minefield[r]))
                                if minefield[rₜ][cₜ] == '*'
                                    cnt += 1
                                end
                            end
                        end
                    end
                end

                cnt > 0    ?    ann_row *= string(cnt)    :    ann_row *= ' '

            elseif minefield[r][c] == '*'
                ann_row *= '*'
            else
                throw(DomainError("Unknown character in minefield."))
            end
        end
        push!(ann, ann_row)
    end

    ann # returned
end
