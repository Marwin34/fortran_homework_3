module functions
    interface
        function fun_int(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y
        end function fun_int
    end interface

    contains 

    function poly(x) result(y)
        implicit none
        real(kind = 8), intent(in) :: x
        real(kind = 8) :: y

        y = x**2 + 2 * x + 1
    end function poly

    function cosine(x) result(y)
        implicit none
        real(kind = 8), intent(in) :: x
        real(kind = 8) :: y

        y = cos(x)
    end function cosine

    function exponential(x)  result(y)
        implicit none
        real(kind = 8), intent(in) :: x
        real(kind = 8) :: y

        y = exp(x)
    end function exponential
end module