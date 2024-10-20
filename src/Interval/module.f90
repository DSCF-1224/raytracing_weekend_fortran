module raytracing_interval

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: interval_type



    type :: interval_type

        real(real64), public :: max = - huge( 0.0_real64 )
        real(real64), public :: min =   huge( 0.0_real64 )



        contains



        procedure, pass, public :: clamp
        procedure, pass, public :: surrounds

    end type interval_type



    interface

        module pure elemental function clamp( interval, x )

            class(interval_type), intent(in) :: interval

            real(real64), intent(in) :: x

            real(real64) :: clamp

        end function clamp



        module pure elemental function surrounds( interval, x )

            class(interval_type), intent(in) :: interval

            real(real64), intent(in) :: x

            logical :: surrounds

        end function surrounds

    end interface

end module raytracing_interval
