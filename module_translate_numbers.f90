module module_translate_numbers

    implicit none 

    contains

    subroutine get_ids_from_number(number, ids_trimmed)
        integer(kind=8), intent(in)               :: number
        integer(kind=8), intent(out), allocatable :: ids_trimmed(:)
        integer(kind=8), allocatable              :: ids(:)
        integer(kind=8)                           :: i, id_count, bit_size_number
        id_count = 0
        bit_size_number = bit_size(number)
        
        ! Allocate the ids array based on the maximum possible size
        allocate(ids(bit_size_number))
    
        do i = 0, bit_size_number - 1
            if (btest(number, i)) then
                id_count = id_count + 1
                ids(id_count) = i
            end if
        end do
    
        ! Trim the ids array to the actual size
        allocate(ids_trimmed(id_count)) 
        ids_trimmed = ids(1:id_count)
        !allocate(ids(1:id_count), source=ids(1:id_count))
    
    end subroutine get_ids_from_number

    integer(kind=8) function ids_to_number(ids)
        integer(kind=8), intent(in)  :: ids(:)
        integer(kind=8)              :: nber, i
        nber = 0_8  ! Initialize nber with kind=8
        do i = 1, size(ids)
            nber = ior(nber, shiftl(1_8, ids(i)))  ! Ensure both operands have kind=8
        end do
        ids_to_number = nber
    end function ids_to_number

    integer(kind=8) function bset(number, bit_position)
        integer(kind=8), intent(in) :: number
        integer(kind=8), intent(in) :: bit_position
        integer(kind=8) :: mask
        mask = iachar('1', kind=kind(bit_position))
        bset = ior(number, shiftl(mask, bit_position))
    end function bset

end module module_translate_numbers 
