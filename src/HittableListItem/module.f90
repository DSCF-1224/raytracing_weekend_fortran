module raytracing_hittable_list_item

    use, non_intrinsic :: raytracing_hittable



    implicit none



    private
    public  :: hittable_list_item_type



    type :: hittable_list_item_type

        class(hittable_class), private, allocatable :: object

    end type hittable_list_item_type

end module raytracing_hittable_list_item
