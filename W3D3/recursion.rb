##muteable datatypes within shallow dupes will change
##immutable databtypes will not change

def range(min, max) 
    return [] if max <= min 

    return range(min, max-1) << max-1
end

def 