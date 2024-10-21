submodule (raytracing_camera) imp_initialize

    implicit none



    integer, parameter :: image_height_min = 1



    contains



    module procedure initialize_default

        real(real64) :: focal_length
        real(real64) :: viewport_height
        real(real64) :: viewport_width

        type(vec3_type) :: viewport_u
        type(vec3_type) :: viewport_upper_left
        type(vec3_type) :: viewport_v



        camera%image_height_ = int( camera%image_width_ / camera%aspect_ratio_ )

        camera%image_height_ = &!
            merge( &!
                tsource =                           image_height_min , &!
                fsource = camera%image_height_                       , &!
                mask    = camera%image_height_ .lt. image_height_min   &!
            )



        camera%pixel_samples_scale_ = 1.0_real64 / camera%samples_per_pixel_



        camera%center_%x = 0.0_real64
        camera%center_%y = 0.0_real64
        camera%center_%z = 0.0_real64



        ! Determine viewport dimensions.

        focal_length    = 1.0_real64
        viewport_height = 2.0_real64
        viewport_width  = viewport_height * camera%aspect_ratio_



        ! Calculate the vectors across the horizontal and down the vertical viewport edges.

        viewport_u%x =   viewport_width
        viewport_u%y =   0.0_real64
        viewport_u%z =   0.0_real64

        viewport_v%x =   0.0_real64
        viewport_v%y = - viewport_height
        viewport_v%z =   0.0_real64



        ! Calculate the horizontal and vertical delta vectors from pixel to pixel.

        camera%pixel_delta_u_ = viewport_u / camera%image_width_
        camera%pixel_delta_v_ = viewport_v / camera%image_height_



        ! Calculate the location of the upper left pixel.

        viewport_upper_left &!
            = camera%center_ &!
            - vec3_type( x = 0.0_real64, y = 0.0_real64, z = focal_length ) &!
            - viewport_u / 2 &!
            - viewport_v / 2

        camera%pixel00_loc_ &!
            = viewport_upper_left &!
            + 0.5_real64 * ( camera%pixel_delta_u_ + camera%pixel_delta_v_ )

    end procedure initialize_default



    module procedure initialize_manually

        camera%image_width_  = image_width
        camera%aspect_ratio_ = aspect_ratio

        call camera%initialize()

    end procedure initialize_manually

end submodule imp_initialize
