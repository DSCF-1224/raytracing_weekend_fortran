module raytracing_vec3

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: operator(+)
    public  :: operator(-)
    public  :: operator(*)
    public  :: operator(/)
    public  :: vec3_type



    type :: vec3_type

        real(real64), public :: x, y, z

    end type vec3_type



    interface operator(+)

        module pure elemental function add_vec3( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs, rhs

            type(vec3_type) :: new_vec3

        end function add_vec3

    end interface operator(+)



    interface operator(-)

        module pure elemental function sub_vec3( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs, rhs

            type(vec3_type) :: new_vec3

        end function sub_vec3

    end interface operator(-)



    interface operator(*)

        module pure elemental function mul_real64_vec3( lhs, rhs ) result( new_vec3 )

            real(real64), intent(in) :: lhs

            type(vec3_type), intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function mul_real64_vec3



        module pure elemental function mul_vec3_real64( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs

            real(real64), intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function mul_vec3_real64

    end interface operator(*)



    interface operator(/)

        module pure elemental function div_vec3_integer( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs

            integer, intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function div_vec3_integer



        module pure elemental function div_vec3_real64( lhs, rhs ) result( new_vec3 )

            type(vec3_type), intent(in) :: lhs

            real(real64), intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function div_vec3_real64

    end interface operator(/)

end module raytracing_vec3
