module raytracing_color

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: color_type
    public  :: white_point
    public  :: write(formatted)



    type :: color_type

        real(real64), public :: red, green, blue

    end type color_type



    integer, parameter :: white_point = 255



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
