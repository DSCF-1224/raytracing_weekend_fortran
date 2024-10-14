module raytracing_hit_record

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_vec3



    implicit none



    private
    public  :: hit_record_type



    type :: hit_record_type

        logical, public :: front_face

        real(real64), public :: t

        type(vec3_type), public :: point
        type(vec3_type), public :: normal



        contains



        procedure, pass, public :: set_face_normal

    end type hit_record_type



    interface

        module subroutine set_face_normal( hit_record, ray, outer_normal )

            class( hit_record_type ), intent(out) :: hit_record

            type(ray_type), intent(in) :: ray

            type(vec3_type), intent(in) :: outer_normal

        end subroutine set_face_normal

    end interface

end module raytracing_hit_record
