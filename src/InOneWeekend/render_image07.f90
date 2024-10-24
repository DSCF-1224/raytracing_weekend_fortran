submodule (raytracing_in_one_weekend) imp_render_image07

    use, non_intrinsic :: raytracing_camera
    use, non_intrinsic :: raytracing_color
    use, non_intrinsic :: raytracing_hit_record
    use, non_intrinsic :: raytracing_hittable_list
    use, non_intrinsic :: raytracing_interval
    use, non_intrinsic :: raytracing_ppm_image
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_sphere
    use, non_intrinsic :: raytracing_vec3



    implicit none



    type(color_type), parameter :: color_red = color_type( red = 1.0_real64, green = 0.0_real64, blue = 0.0_real64 )

    type(interval_type), parameter :: ray_t = interval_type( min = 0.0_real64, max = huge( 0.0_real64 ) )



    contains



    function ray_color( ray, world ) result( color )

        type(ray_type), intent(in) :: ray

        type(hittable_list_type), intent(in) :: world

        type(color_type) :: color



        logical :: hit_stat

        real(real64) :: a

        type(hit_record_type) :: hit_record

        type(vec3_type) :: unit_direction



        call world%hit( &!
            ray        = ray        , &!
            ray_t      = ray_t      , &!
            hit_stat   = hit_stat   , &!
            hit_record = hit_record   &!
        )



        if ( hit_stat ) then

            color%red   = hit_record%normal%x + 1.0_real64
            color%green = hit_record%normal%y + 1.0_real64
            color%blue  = hit_record%normal%z + 1.0_real64
            color       = 0.5_real64 * color

            return

        end if



        unit_direction = unit_vector( ray%direction )
        a              = 0.5_real64 * ( unit_direction%y + 1.0_real64 )

        color &!
            = ( 1.0_real64 - a ) * color_type( red = 1.0_real64, green = 1.0_real64, blue = 1.0_real64 ) &!
            +                a   * color_type( red = 0.5_real64, green = 0.7_real64, blue = 1.0_real64 )

    end function ray_color



    module procedure render_image07

        type(camera_type) :: camera

        type(hittable_list_type) :: world



        allocate( world%item( 2 ) )



        call world%item( 1 )%allocate( &!
            sphere_type( &!
                center = vec3_type( x = 0.0_real64, y = 0.0_real64, z = -1.0_real64 ) , &!
                radius = 0.5_real64                                                     &!
            ) &!
        )

        call world%item( 2 )%allocate( &!
            sphere_type( &!
                center = vec3_type( x = 0.0_real64, y = -100.5_real64, z = -1.0_real64 ) , &!
                radius = 100.0_real64                                                      &!
            ) &!
        )



        call camera%initialize( &!
            image_width       = 400                      , &!
            aspect_ratio      = 16.0_real64 / 9.0_real64 , &!
            samples_per_pixel = 100                        &!
        )



        call camera%render( &!
            file      = 'image07.ppm', &!
            world     = world        , &!
            ray_color = ray_color      &!
        )

    end procedure render_image07

end submodule imp_render_image07
