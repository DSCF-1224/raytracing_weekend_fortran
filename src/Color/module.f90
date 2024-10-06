module raytracing_color

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: color_type



    type :: color_type

        real(real64), public :: red, green, blue

    end type color_type

end module raytracing_color
