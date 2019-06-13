program main
    use functions
    use rectangle
    use trapezoid

    implicit none
    real(kind = 8) :: ibeg
    real(kind = 8) :: iend
    real(kind = 8) :: ilen
    real(kind = 8), codimension[*] :: result_poly
    real(kind = 8), codimension[*] :: result_cosine
    real(kind = 8), codimension[*] :: result_exponential
    real(kind = 8) :: sum
    procedure(fun_int), pointer :: my_fun
    integer(kind = 4) :: p, i

    ibeg = -1.0
    iend = 1.0

    ilen = abs(iend - ibeg) / num_images()

    p = 1

    open(19, file='res/results', status='unknown')

    if(this_image() == 1) then
        write(*, *) "Testing integration for:"
        write(*, *) "y(x) = x^2 + 2*x + 1 and y(x) = cos(x) and y(x) = e^x"
        write(*, *) "where x from -1.0 to 1.0"
        write(*, *) "with rectangle rule."

        write(19, *) "Testing integration for:"
        write(19, *) "y(x) = x^2 + 2*x + 1 and y(x) = cos(x) and y(x) = e^x"
        write(19, *) "where x from -1.0 to 1.0"
        write(19, *) "with rectangle rule."
    end if

    my_fun => poly

    result_poly[this_image()] = rectangle_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    syncall()

    my_fun => cosine

    result_cosine[this_image()] = rectangle_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    syncall()

    my_fun => exponential

    result_exponential[this_image()] = rectangle_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    if (this_image() == 1) then
        sum = 0.0
        do i=1,num_images()
            sum = sum + result_poly[i]
        end do

        write(*, *) "Result for y = 2x^2 + 2*x + 1", sum
        write(19, *) "Result for y = 2x^2 + 2*x + 1", sum

        sum = 0.0

        do i=1,num_images()
            sum = sum + result_cosine[i]
        end do

        write(*, *) "Result for y = cos(x)", sum
        write(19, *) "Result for y = cos(x)", sum

        sum = 0.0

        do i=1,num_images()
            sum = sum + result_exponential[i]
        end do

        write(*, *) "Result for y = e^x", sum
        write(19, *) "Result for y = e^x", sum
    end if

    syncall()

    if(this_image() == 1) then
        write(*, *) "Testing integration for:"
        write(*, *) "y(x) = x^2 + 2*x + 1 and y(x) = cos(x) and y(x) = e^x"
        write(*, *) "where x from -1.0 to 1.0"
        write(*, *) "with trapezoid rule."

        write(19, *) "Testing integration for:"
        write(19, *) "y(x) = x^2 + 2*x + 1 and y(x) = cos(x) and y(x) = e^x"
        write(19, *) "where x from -1.0 to 1.0"
        write(19, *) "with trapezoid rule."
    end if

    my_fun => poly

    result_poly[this_image()] = trapezoid_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    syncall()

    my_fun => cosine

    result_cosine[this_image()] = trapezoid_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    syncall()

    my_fun => exponential

    result_exponential[this_image()] = trapezoid_i(ibeg + ((this_image() - 1) * ilen), ibeg + (this_image()) * ilen, my_fun, p)

    if (this_image() == 1) then
        sum = 0.0
        do i=1,num_images()
            sum = sum + result_poly[i]
        end do

        write(*, *) "Result for y = 2x^2 + 2*x + 1", sum
        write(19, *) "Result for y = 2x^2 + 2*x + 1", sum

        sum = 0.0

        do i=1,num_images()
            sum = sum + result_cosine[i]
        end do

        write(*, *) "Result for y = cos(x)", sum
        write(19, *) "Result for y = cos(x)", sum

        sum = 0.0

        do i=1,num_images()
            sum = sum + result_exponential[i]
        end do

        write(*, *) "Result for y = e^x", sum
        write(19, *) "Result for y = e^x", sum
    end if

    if(this_image() == 1) then
        write(*, *) "Expectations:"
        write(*, *) "y(x) = x^2 + 2*x + 1", 2.6667
        write(*, *) "y(x) = cos(x)", 1.6829
        write(*, *) "and y(x) = e^x", 2.3504

        write(19, *) "Expectations:"
        write(19, *) "y(x) = x^2 + 2*x + 1", 2.6667
        write(19, *) "y(x) = cos(x)", 1.6829
        write(19, *) "and y(x) = e^x", 2.3504
    end if

    close(19)

end program