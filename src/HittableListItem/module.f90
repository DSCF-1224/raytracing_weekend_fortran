module raytracing_hittable_list_item

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_hittable
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_sphere



    implicit none



    private
    public  :: hittable_list_item_type



    type, extends( hittable_class ) :: hittable_list_item_type

        class(hittable_class), private, allocatable :: object



        contains



        procedure, pass, private :: allocate_object
        procedure, pass, public  :: hit             => hit_hittable_list_item



        generic, public :: allocate => allocate_object

    end type hittable_list_item_type



    interface

        module subroutine allocate_object( self, source )

            class(hittable_list_item_type), intent(inout) :: self

            class(hittable_class), intent(in) :: source

        end subroutine allocate_object



        module subroutine hit_hittable_list_item( self, ray, t_min, t_max, hit_stat, hit_record )

            class(hittable_list_item_type), intent(in) :: self

            type(ray_type), intent(in) :: ray

            real(real64), intent(in) :: t_min, t_max

            logical, intent(out) :: hit_stat

            type(hit_record_type), intent(out) :: hit_record

        end subroutine hit_hittable_list_item

    end interface

end module raytracing_hittable_list_item
