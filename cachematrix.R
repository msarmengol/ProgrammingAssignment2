## My version for Assignment 2 -R Programming course

## This function allows to create an object which handles with matrixs that can be inverted.
## It returns a public list  of four methods. 

makeCacheMatrix <- function(x=matrix()) {
        mat_inv <- NULL                                       # Cleanning environment
        set <- function(y) {                                  # Establish new data
                x <<- y
                mat_inv <<- NULL
        }
        get <- function() x                                   # Just return what is gotten
        setInverse <- function(x_inv) mat_inv <<- x_inv       # Overwrite in the global envirnment tha value is given
        getInverse <- function() mat_inv                      # Just return what is gotten 
        list(set = set, get = get,                            # Return public methods
             setInverse = setInverse,
             getInverse = getInverse)
}

## This funciont carries on with the asked bussiness logic.
## Obtein the inverse matrix, if the result existes, get it from the cahe instead of calculating.

cacheSolve <- function(x) {

        mat_inv <- x$getInverse()                             # Gets the result stored in globla environment
        if(!is.null(mat_inv)) {                               # Checks if it's necesary to calculate
                message("getting cached data")
                return(mat_inv)                               # Return the value stored in the global environment
        }
        mat_inv  <- x$setInverse(solve(x$get()))              # Calculate the inverse of the given matrix                  
        return(mat_inv)
}
