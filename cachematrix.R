## The below functions will cache the inverse of the matrix 
## instead of repeated computation.

##  The function "makeCacheMatrix" creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y) {
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setsolve<-function(solve) m<<-solve
  getsolve<-function() m
  list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
  

} 


## The "cachesolve" function will compute the inverse of the matrix returned
## by the first function above. It it has already been calcuated 
## then cache solve will retreive it from cache.

cacheSolve <- function(x, ...) { 
   m <- x$getsolve()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setsolve(m)
m
  
        ## Return a matrix that is the inverse of 'x'
}
