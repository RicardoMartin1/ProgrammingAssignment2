## This function creates a special "matrix" object that can cache its inverse.
## Assume that the matrix supplied is always invertible.


makeCacheMatrix <- function(x = matrix()) {
        <- matrix()
        set <- function(y) {
                x <<- y
                m <<- matrix()
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get, 
         setinverse = setinverse,
         getinverse = getinverse)

}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.matrix(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
