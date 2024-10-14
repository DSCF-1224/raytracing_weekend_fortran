module raytracing_sphere

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_vec3

    implicit none



    private
    public  :: sphere_type



    type :: sphere_type

        real(real64), public :: radius

        type(vec3_type), public :: center

    end type sphere_type

end module raytracing_sphere
