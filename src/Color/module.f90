module raytracing_color

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: color_type
    public  :: operator(+)
    public  :: operator(*)
    public  :: white_point
    public  :: write(formatted)



    type :: color_type

        real(real64), public :: red, green, blue

    end type color_type



    integer, parameter :: white_point = 255



    interface operator(+)

        module pure elemental function add_color( lhs, rhs ) result( new_color )

            type(color_type), intent(in) :: lhs, rhs

            type(color_type) :: new_color

        end function add_color

    end interface operator(+)



    interface operator(*)

        module pure elemental function mul_real64_color( lhs, rhs ) result( new_color )

            real(real64), intent(in) :: lhs

            type(color_type), intent(in) :: rhs

            type(color_type) :: new_color

        end function mul_real64_color

    end interface operator(*)



    interface write(formatted)

        module subroutine write_color( color, unit, iotype, arglist, iostat, iomsg )

            class(color_type), intent(in) :: color

            integer, intent(in) :: unit

            character(*), intent(in) :: iotype

            integer, intent(in), dimension(:) :: arglist

            integer, intent(out) :: iostat

            character(*), intent(inout) :: iomsg

        end subroutine write_color

    end interface write(formatted)

end module raytracing_color
