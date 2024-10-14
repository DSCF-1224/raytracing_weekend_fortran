module raytracing_hittable

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_ray



    implicit none



    private
    public  :: hittable_class



    type, abstract :: hittable_class
    end type hittable_class

end module raytracing_hittable
