module raytracing_hittable

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_interval
    use, non_intrinsic :: raytracing_ray



    implicit none



    private
    public  :: hittable_class



    type, abstract :: hittable_class

        contains

        procedure( hit_abstract ), deferred, pass, public :: hit

    end type hittable_class



    interface

        module subroutine hit_abstract( self, ray, ray_t, hit_stat, hit_record )

            class(hittable_class), intent(in) :: self

            type(ray_type), intent(in) :: ray

            type(interval_type), intent(in) :: ray_t

            logical, intent(out) :: hit_stat

            type(hit_record_type), intent(out) :: hit_record

        end subroutine hit_abstract

    end interface

end module raytracing_hittable
