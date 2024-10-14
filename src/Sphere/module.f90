module raytracing_sphere

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_hittable
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_vec3

    implicit none



    private
    public  :: sphere_type



    type, extends( hittable_class ) :: sphere_type

        real(real64), public :: radius

        type(vec3_type), public :: center



        contains



        procedure, pass, public :: hit => hit_sphere

    end type sphere_type



    interface

        module subroutine hit_sphere( self, ray, t_min, t_max, hit_stat, hit_record )

            class(sphere_type), intent(in) :: self

            type(ray_type), intent(in) :: ray

            real(real64), intent(in) :: t_min, t_max

            logical, intent(out) :: hit_stat

            type(hit_record_type), intent(out) :: hit_record

        end subroutine hit_sphere

    end interface

end module raytracing_sphere
