## My version for Assignment 2 -R Programming course

## This function allows to create an object which handles with matrixs that can be inverted.
## It returns a public list  of four methods. 

makeCacheMatrix <- function(x=matrix()) {
        mat_inv <- NULL                                       # Cleanning environment
        set <- function(y) {                                  # Establishing new data
                x <<- y
                mat_inv <<- NULL
        }
        get <- function() x                                   # Just returns what's gotten
        setInverse <- function(x_inv) mat_inv <<- x_inv       # Overwrites the variable with the new given value 
        getInverse <- function() mat_inv                      # Just returns what's gotten 
        list(set = set, get = get,                            # Returns public methods
             setInverse = setInverse,
             getInverse = getInverse)
}

## This funciont carries on with the asked bussiness logic.
## Obteins the inverse matrix, if the result exists, gets it from the cahe instead of calculating.

cacheSolve <- function(x) {

        mat_inv <- x$getInverse()                             # Gets the result previously stored 
        if(!is.null(mat_inv)) {                               # Checks if it's necesary to calculate
                message("getting cached data")
                return(mat_inv)                               # Returns the value stored in the global environment
        }
        mat_inv  <- x$setInverse(solve(x$get()))              # Calculate the inverse of the given matrix                  
        return(mat_inv)
}
