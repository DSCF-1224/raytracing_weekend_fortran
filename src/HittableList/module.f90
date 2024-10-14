module raytracing_hittable_list

    use, non_intrinsic :: raytracing_hittable_list_item



    implicit none



    private
    public  :: hittable_list_type



    type :: hittable_list_type

        type(hittable_list_item_type), allocatable, dimension(:), public :: item

    end type hittable_list_type

end module raytracing_hittable_list
