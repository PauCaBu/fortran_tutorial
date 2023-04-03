program fortrantut
    implicit none
    integer :: n=0, m=1
    integer :: secret_num = 7

    ! start, finish, step
    do n=1, 10, 2
        print "(i2)", n
    end do

    do while(m<20)
        if (mod(m,2)==0) then 
            print "(i1)", m
            m = m+1
            cycle !jumps back to the do while, is equal to continue!
        end if 
        m = m+1
        if (m > 10) then 
            exit 
        end if 
    end do 
    
end program fortrantut