submodule (raytracing_hittable_list) imp_hit

    implicit none



    contains



    module procedure hit_hittable_list

        hit_stat = allocated( self%item )



        if ( .not. hit_stat ) return



        block

            logical :: temp_hit_stat

            integer :: iter_item

            real(real64) :: closest_so_far

            type(hit_record_type) :: temp_hit_record



            temp_hit_stat = .false.

            closest_so_far    = t_max



            do iter_item = 1, size( self%item(:) )

                call self%item( iter_item )%hit( &!
                    ray        = ray             , &!
                    t_min      = t_min           , &!
                    t_max      = closest_so_far  , &!
                    hit_stat   = temp_hit_stat   , &!
                    hit_record = temp_hit_record   &!
                )

                if ( temp_hit_stat ) then
                    hit_stat       = .true.
                    closest_so_far = temp_hit_record%t
                    hit_record     = temp_hit_record
                end if

            end do

        end block

    end procedure hit_hittable_list

end submodule imp_hit
