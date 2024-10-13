module raytracing_vec3

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: operator(+)
    public  :: operator(-)
    public  :: operator(*)
    public  :: operator(/)
    public  :: dot_product
    public  :: length
    public  :: length_squared
    public  :: vec3_type
    public  :: unit_vector



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

        module pure elemental function mul_integer_vec3( lhs, rhs ) result( new_vec3 )

            integer, intent(in) :: lhs

            type(vec3_type), intent(in) :: rhs

            type(vec3_type) :: new_vec3

        end function mul_integer_vec3



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



    interface dot_product

        module pure elemental function dot_product_vec3( lhs, rhs )

            type(vec3_type), intent(in) :: lhs, rhs

            real(real64) :: dot_product_vec3

        end function dot_product_vec3

    end interface dot_product



    interface length

        module pure elemental function length_vec3( vec3 )

            type(vec3_type), intent(in) :: vec3

            real(real64) :: length_vec3

        end function length_vec3

    end interface length



    interface length_squared

        module pure elemental function length_squared_vec3( vec3 )

            type(vec3_type), intent(in) :: vec3

            real(real64) :: length_squared_vec3

        end function length_squared_vec3

    end interface length_squared



    interface unit_vector

        module pure elemental function unit_vector_vec3( vec3 )

            type(vec3_type), intent(in) :: vec3

            type(vec3_type) :: unit_vector_vec3

        end function unit_vector_vec3

    end interface unit_vector

end module raytracing_vec3
