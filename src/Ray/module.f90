module raytracing_ray

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_vec3



    implicit none



    private
    public  :: ray_type



    type :: ray_type

        type(vec3_type), public :: direction, origin

        contains

        procedure, pass, public :: at

    end type ray_type



    interface

        module pure elemental function at( ray, t )

            class(ray_type), intent(in) :: ray

            real(real64), intent(in) :: t

            type(vec3_type) :: at

        end function at

    end interface

end module raytracing_ray
