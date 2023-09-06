program playing
    use module_translate_numbers 
    implicit none

    integer(kind=8), allocatable :: array(:), copied_array(:)
    integer(kind=8) :: num_value

    print*,'this program is called playing!'
    call flush(6)  ! Flush the standard output buffer
    print*,'now I''m using the functions from module_translate_numbers'
    call flush(6)  ! Flush the standard output buffer

    allocate(array(9))
    array = (/6,7,8,9,16,78,65,43,22/)
    print *, 'this array', array 
    call flush(6)  ! Flush the standard output buffer

    num_value = ids_to_number(array) 
    print *, 'number= ', num_value
    call flush(6)  ! Flush the standard output buffer

    allocate(copied_array(9))
    call get_ids_from_number(num_value, copied_array)

    print *, 'copied array', copied_array
    call flush(6)  ! Flush the standard output buffer

    ! Deallocate arrays to free memory
    deallocate(array, copied_array)
    
end program playing

!this array                    3                    4                    5                    6                    3                    2                    7                    4                    2
!number=                  8188
!copied array                    2                    3                    4                    5                    6                    7                    8                    9                   10                   11                   12
