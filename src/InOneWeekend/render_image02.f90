submodule (raytracing_in_one_weekend) imp_render_image02

    use, non_intrinsic :: raytracing_vec3



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

        real(real64)    , parameter :: focal_length    = 1.0_real64
        real(real64)    , parameter :: viewport_height = 2.0_real64
        real(real64)    , parameter :: viewport_width  = viewport_height * aspect_ratio
        type(vec3_type) , parameter :: camera_center   = vec3_type( x = 0.0_real64, y = 0.0_real64, z = 0.0_real64 )

        type(vec3_type) , parameter :: viewport_u      = vec3_type( x = viewport_width , y =   0.0_real64      , z = 0.0_real64 )
        type(vec3_type) , parameter :: viewport_v      = vec3_type( x = 0.0_real64     , y = - viewport_height , z = 0.0_real64 )



        integer :: write_unit
        !! the unit number to save the rendered image

        type(vec3_type) :: pixel00_loc
        type(vec3_type) :: pixel_delta_u
        type(vec3_type) :: pixel_delta_v
        type(vec3_type) :: viewport_upper_left



        pixel_delta_u = viewport_u / image_width
        pixel_delta_v = viewport_v / image_height

        viewport_upper_left &!
            = camera_center                                                 &!
            - vec3_type( x = 0.0_real64, y = 0.0_real64, z = focal_length ) &!
            - viewport_u / 2                                                &!
            - viewport_v / 2

        pixel00_loc &!
            = viewport_upper_left &!
            + 0.5_real64 * ( pixel_delta_u + pixel_delta_v )



        open( &!
            newunit = write_unit    , &!
            file    = 'image02.ppm' , &!
            action  = 'write'       , &!
            form    = 'formatted'   , &!
            status  = 'unknown'       &!
        )



        close( write_unit )

    end procedure render_image02

end submodule imp_render_image02
