module raytracing_vec3

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: operator(*)
    public  :: vec3_type



    type :: vec3_type

        real(real64), public :: x, y, z

    end type vec3_type



    interface operator(*)

        module pure elemental function mul_vec3_real64( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs

            real(real64), intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function mul_vec3_real64

    end interface operator(*)

end module raytracing_vec3
