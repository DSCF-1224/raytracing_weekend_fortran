module raytracing_interval

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: interval_type



    type :: interval_type

        real(real64), public :: max = - huge( 0.0_real64 )
        real(real64), public :: min =   huge( 0.0_real64 )

    end type interval_type

end module raytracing_interval
