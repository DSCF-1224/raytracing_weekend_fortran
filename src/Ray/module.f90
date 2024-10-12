module raytracing_ray

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_vec3



    implicit none



    private
    public  :: ray_type



    type :: ray_type

        type(vec3_type), public :: direction, origin

    end type ray_type

end module raytracing_ray
