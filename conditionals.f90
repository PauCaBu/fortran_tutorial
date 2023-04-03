program fortrantut
    integer :: age = 16
    if ((age >= 5) .and. (age <= 6)) then
      print *, "Kindergarten"
    else if ((age >= 7) .and. (age <= 13)) then
      print *, "Middle School"
    else if ((age >= 14) .and. (age <= 18)) then
      print *, "High School"
    else
      print *, "Stay Home"
    end if
    
    print *, .true. .or. .false. ! True
    print *, .not. .true. ! False
    print *, 5 /= 9 ! True 
    
    ! another way to do conditionals

    select case(age)
    case(5)
        print *, "Kindergarden"
    case(6:13)
        print *, "Middle School"
    case(14,15,16,17,18)
        print *, "High School"
    case default 
        print *, "Stay home"
    end select
    
end program fortrantut 
