submodule (raytracing_in_one_weekend) imp_render_image02

    implicit none



    contains



    module procedure render_image02

        ! Image

        real(real64) , parameter :: aspect_ratio = 16.0_real64 / 9.0_real64
        integer      , parameter :: image_width  = 400;

        integer, parameter :: image_height_ini = int( image_width / aspect_ratio )
        !! calculated image height

        integer, parameter :: image_height_min = 1

        integer, parameter :: image_height = &!
            merge( &!
                tsource =                       image_height_min , &!
                fsource = image_height_ini                       , &!
                mask    = image_height_ini .lt. image_height_min   &!
            )
        !! calculated image height (ensured that it's at least 1)



        ! Camera

        real(real64), parameter :: focal_length    = 1.0_real64
        real(real64), parameter :: viewport_height = 2.0_real64
        real(real64), parameter :: viewport_width  = viewport_height * aspect_ratio


    end procedure render_image02

end submodule imp_render_image02
