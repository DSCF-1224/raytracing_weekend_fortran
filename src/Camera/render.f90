submodule (raytracing_camera) imp_render

    implicit none



    contains



    module procedure render

        integer :: iter_h
        !! A support variable for this `SUBROUTINE`

        integer :: iter_h_max
        !! A support variable for this `SUBROUTINE`

        integer :: iter_w
        !! A support variable for this `SUBROUTINE`

        integer :: iter_w_max
        !! A support variable for this `SUBROUTINE`

        integer :: write_unit
        !! the unit number to save the rendered image



        open( &!
            newunit = write_unit  , &!
            file    = file        , &!
            action  = 'write'     , &!
            form    = 'formatted' , &!
            status  = 'unknown'     &!
        )



        call write_ppm_image_header( &!
            unit         = write_unit           , &!
            image_width  = camera%image_width_  , &!
            image_height = camera%image_height_   &!
        )



        iter_h_max = camera%image_height_ - 1
        iter_w_max = camera%image_width_  - 1



        do iter_h = 0, iter_h_max

            ! Write progress bar

            write( unit = output_unit, fmt = '(A,A,I3,A)', advance = 'no' ) &!
                char(13)                                                , &!
                'Scan lines remaining: '                                , &!
                floor( 100 * real( iter_h_max - iter_h ) / iter_h_max ) , &!
                '%'

            flush( unit = output_unit )



            do iter_w = 0, iter_w_max
            block

                integer :: iter_s

                type(color_type) :: color
                type(ray_type)   :: ray
                type(vec3_type)  :: pixel_center
                type(vec3_type)  :: ray_direction



                color%red   = 0.0_real64
                color%green = 0.0_real64
                color%blue  = 0.0_real64



                do iter_s = 1, camera%samples_per_pixel_

                    pixel_center &!
                        = camera%pixel00_loc_                &!
                        + ( iter_w * camera%pixel_delta_u_ ) &!
                        + ( iter_h * camera%pixel_delta_v_ )

                    ray_direction = pixel_center - camera%center_

                    ray%origin    = camera%center_
                    ray%direction = ray_direction

                    color = &!
                    color + ray_color( ray, world )

                end do



                write( unit = write_unit, fmt = * ) camera%pixel_samples_scale_ * color

            end block
            end do

        end do



        write( unit = output_unit, fmt = '(/,A)', advance = 'yes' ) 'DONE !'



        close( write_unit )

    end procedure render

end submodule imp_render
