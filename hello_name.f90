program fortrantut
	implicit none !makes me declare all variables 
	character*20 :: name !creates a variable named name
	character (len=20) :: f_name, l_name
    print *, "What's your name?" !prints
	read *, f_name, l_name !reads and stores the variable you put as name
	print *, "Hello ",trim(f_name), " ", trim(l_name) !prints the variable 
end program fortrantut