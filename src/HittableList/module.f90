module raytracing_hittable_list

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_hittable
    use, non_intrinsic :: raytracing_hittable_list_item
    use, non_intrinsic :: raytracing_interval
    use, non_intrinsic :: raytracing_ray



    implicit none



    private
    public  :: hittable_list_type



    type, extends( hittable_class ) :: hittable_list_type

        type(hittable_list_item_type), allocatable, dimension(:), public :: item



        contains



        procedure, pass, public :: hit => hit_hittable_list

    end type hittable_list_type



    interface

        module subroutine hit_hittable_list( self, ray, ray_t, hit_stat, hit_record )

            class(hittable_list_type), intent(in) :: self

            type(ray_type), intent(in) :: ray

            type(interval_type), intent(in) :: ray_t

            logical, intent(out) :: hit_stat

            type(hit_record_type), intent(out) :: hit_record

        end subroutine hit_hittable_list

    end interface

end module raytracing_hittable_list
