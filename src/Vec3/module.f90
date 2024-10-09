module raytracing_vec3

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: vec3_type



    type :: vec3_type

        real(real64), public :: x, y, z

    end type vec3_type

end module raytracing_vec3
