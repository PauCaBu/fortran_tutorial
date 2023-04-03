program fortrantut
    implicit none

    !integer arrays 
    integer, dimension(1:5) :: a1, a2, a3
    
    !real number arrays
    real, dimension(1:50) :: aR1

    integer, dimension(5,5) :: a4 

    integer :: n, m, x, y 

    !integer array with dimension set on runtime
    integer, dimension(:), allocatable :: a5
    integer :: num_vals  = 0 
    integer, dimension(1:9) :: a6 = (/1,2,3,4,5,6,7,8,/) 

end program fortrantut