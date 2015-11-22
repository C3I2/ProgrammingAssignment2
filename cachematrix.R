## You create a matrix object that can cash its own inverse, 
## and when solving for the inverse you check for a saved cashe and use that if it exist


## creates a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {

  m<-NULL ## Creates an emty "matrix"
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)  
}


## Return a matrix that is the inverse of 'x' if already calculated from cashe, else it calculates the inverse using solve()

cacheSolve <- function(x, ...) {
        
  m = x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
