submodule (raytracing_hittable_list_item) imp_hit

    implicit none



    contains



    module procedure hit_hittable_list_item

        hit_stat = allocated( self%object )

        if ( hit_stat ) then

            call self%object%hit( &!
                ray        = ray        , &!
                ray_t      = ray_t      , &!
                hit_stat   = hit_stat   , &!
                hit_record = hit_record   &!
            )

        end if

    end procedure hit_hittable_list_item

end submodule imp_hit
