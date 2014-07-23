## Put comments here that give an overall description of what your
## functions do

## This function allows to create an object type matrix with four methods for manipuling it.

makeCacheMatrix <- function(x = matrix()) {
        mat_inv <- NULL
        set <- function(y) {
                x <<- y
                mat_inv <<- NULL
        }
        get <- function() x
        setsolve <- function(x_inv) mat_inv <<- x_inv
        getsolve <- function() mat_inv
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This funciont carries on with the bussiness logic: if the result existes, get it from the cahe instead of calculating.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        mat_inv <- x$getsolve()
        if(!is.null(mat_inv)& x$mat_old == x$get()) {
                message("getting cached data")
                return(mat_inv)
        }
        x$mat_old <- x$get()
        mat_inv  <- x$setsolve(solve(x$get()))
        
}
