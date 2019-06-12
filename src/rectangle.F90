module rectangle

    use functions

    interface
        function integrate(ibeg, iend, my_fun, p) result (value)
            import :: fun_int
            implicit none
            ! beginning of integration interval
            real(kind = 8), intent(in) :: ibeg
            ! ending of integration interval
            real(kind=8), intent(in) :: iend
            ! function to be integrated
            procedure(fun_int), pointer :: my_fun
            ! polynomial order
            integer(kind = 4), intent(in) :: p
            ! result of integration
            real(kind = 8) :: value
        end function integrate   
    end interface 

    contains

    function rectangle_i(ibeg, iend, my_fun, p) result(value)
        implicit none
        real(kind = 8), intent(in) :: ibeg
        real(kind = 8), intent(in) :: iend
        procedure(fun_int), pointer :: my_fun
        integer(kind = 4), intent(in) :: p
        real(kind = 8) :: value

        value = my_fun((ibeg + iend) / 2) * abs(iend - ibeg)
    end function
end module