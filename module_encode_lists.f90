module module_encode_lists

    implicit none

    contains

    subroutine EncodeList(list, encodedString)
    
        integer(kind=8), dimension(:), intent(in) :: list
        character(2000), intent(out) :: encodedString
        integer :: i, n
    
        ! Determine the number of elements in the list
        n = size(list)
    
        ! Initialize the encoded string
        encodedString = ""
        ! Check if the list is empty
        if (n == 0) then
            return  ! Return an empty string if the list is empty
        end if

        ! Encode the list elements as a comma-separated string
        do i = 1, n
          write(encodedString, "(A,I0)") trim(encodedString), list(i)
          if (i /= n) encodedString = trim(encodedString) // ","
        end do
        encodedString = trim(encodedString)
        !print*,'Encoded string', encodedString
    end subroutine EncodeList
    
    subroutine DecodeList(encodedString, list)
        character(2000), intent(in) :: encodedString
        integer(kind=8), dimension(:), intent(out) :: list
        integer(kind=8) :: i, j, numItems, ios
  
        numItems = 0
        i = 1
        j = 1
        print*,'encodedString: ', trim(encodedString)

        if (len_trim(encodedString) > 1) then
            do i = 1, len_trim(encodedString)
                ! Check for the comma separator or the end of the string
                if (encodedString(i:i) == ',' .or. i == len_trim(encodedString)) then
                ! Parse the substring between commas (or until the end of the string) into an integer
                    if (i == len_trim(encodedString)) then 
                        read(encodedString(j:i), *, iostat=ios) list(numItems + 1)
                    else
                        read(encodedString(j:i-1), *, iostat=ios) list(numItems + 1)
                    end if
                numItems = numItems + 1
                j = i + 1
                end if
            end do
        end if
        if (len_trim(encodedString) == 1) then
            !allocate(list(1))
            !print*,'encodedString length =1', ICHAR(trim(encodedString))
            read(encodedString(1:1), *, iostat=ios) list(numItems + 1)
            !print*,'encodedString length =1', ICHAR(trim(encodedString))
            !return
            return
        else
            return 
        !    list(1) = -1
        end if
    end subroutine DecodeList

end module module_encode_lists