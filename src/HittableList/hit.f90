submodule (raytracing_hittable_list) imp_hit

    implicit none



    contains



    module procedure hit_hittable_list

        hit_stat = allocated( self%item )



        if ( .not. hit_stat ) return



        block

            logical :: hit_stat_item

            integer :: iter_item

            real(real64) :: closest_so_far

            type(hit_record_type) :: hit_record_item

            type(interval_type) :: interval_item



            hit_stat       = .false.
            closest_so_far = ray_t%max



            do iter_item = 1, size( self%item(:) )

                interval_item%min = ray_t%min
                interval_item%max = closest_so_far

                call self%item( iter_item )%hit( &!
                    ray        = ray             , &!
                    ray_t      = interval_item   , &!
                    hit_stat   = hit_stat_item   , &!
                    hit_record = hit_record_item   &!
                )

                if ( hit_stat_item ) then
                    hit_stat       = .true.
                    closest_so_far = hit_record_item%t
                    hit_record     = hit_record_item
                end if

            end do

        end block

    end procedure hit_hittable_list

end submodule imp_hit
