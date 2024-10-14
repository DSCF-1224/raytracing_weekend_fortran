module raytracing_hit_record

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_vec3



    implicit none



    private
    public  :: hit_record_type



    type :: hit_record_type

        real(real64), public :: t

        type(vec3_type), public :: point
        type(vec3_type), public :: normal

    end type hit_record_type

end module raytracing_hit_record
