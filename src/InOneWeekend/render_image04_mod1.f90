submodule (raytracing_in_one_weekend) imp_render_image04_mod1

    use, non_intrinsic :: raytracing_color
    use, non_intrinsic :: raytracing_ppm_image
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_sphere
    use, non_intrinsic :: raytracing_vec3



    implicit none



    type(color_type), parameter :: color_red = color_type( red = 1.0_real64, green = 0.0_real64, blue = 0.0_real64 )

    type(sphere_type), parameter :: sphere = &!
        sphere_type( &!
            center = vec3_type( 0.0_real64, 0.0_real64, -1.0_real64 ) , &!
            radius = 0.5_real64                                         &!
        )



    contains



    pure elemental function hit_sphere( sphere, ray )

        type(sphere_type), intent(in) :: sphere

        type(ray_type), intent(in) :: ray

        real(real64) :: hit_sphere



        real(real64) :: a, c, discriminant, h

        type(vec3_type) :: oc



        oc           = sphere%center - ray%origin
        a            = length_squared( ray%direction )
        h            = dot_product( ray%direction , oc )
        c            = length_squared( oc ) - sphere%radius * sphere%radius
        discriminant = h * h - a * c



        if ( discriminant .lt. 0.0_real64 ) then
            hit_sphere = -1.0_real64
        else
            hit_sphere = ( h - sqrt( discriminant ) ) / a
        end if

    end function hit_sphere



    pure elemental function ray_color( ray ) result( color )

        type(ray_type), intent(in) :: ray

        type(color_type) :: color



        real(real64) :: a, t

        type(vec3_type) :: unit_direction



        t = hit_sphere( sphere, ray )



        if ( t .gt. 0.0_real64 ) then
        block

            type(vec3_type) :: n



            n           = unit_vector( ray%at( t ) - sphere%center )
            color%red   = n%x + 1.0_real64
            color%green = n%y + 1.0_real64
            color%blue  = n%z + 1.0_real64
            color       = 0.5_real64 * color

            return

        end block
        end if



        unit_direction = unit_vector( ray%direction )
        a              = 0.5_real64 * ( unit_direction%y + 1.0_real64 )

        color &!
            = ( 1.0_real64 - a ) * color_type( red = 1.0_real64, green = 1.0_real64, blue = 1.0_real64 ) &!
            +                a   * color_type( red = 0.5_real64, green = 0.7_real64, blue = 1.0_real64 )

    end function ray_color



    module procedure render_image04_mod1

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

        integer, parameter :: iter_h_max   = image_height - 1
        integer, parameter :: iter_w_max   = image_width  - 1



        ! Camera

        real(real64)    , parameter :: focal_length    = 1.0_real64
        real(real64)    , parameter :: viewport_height = 2.0_real64
        real(real64)    , parameter :: viewport_width  = viewport_height * aspect_ratio
        type(vec3_type) , parameter :: camera_center   = vec3_type( x = 0.0_real64, y = 0.0_real64, z = 0.0_real64 )

        type(vec3_type) , parameter :: viewport_u      = vec3_type( x = viewport_width , y =   0.0_real64      , z = 0.0_real64 )
        type(vec3_type) , parameter :: viewport_v      = vec3_type( x = 0.0_real64     , y = - viewport_height , z = 0.0_real64 )



        integer :: iter_h
        !! A support variable for this `SUBROUTINE`

        integer :: iter_w
        !! A support variable for this `SUBROUTINE`

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
            newunit = write_unit         , &!
            file    = 'image04_mod1.ppm' , &!
            action  = 'write'            , &!
            form    = 'formatted'        , &!
            status  = 'unknown'            &!
        )



        call write_ppm_image_header( &!
            unit         = write_unit   , &!
            image_width  = image_width  , &!
            image_height = image_height   &!
        )



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

                type(color_type) :: color
                type(ray_type)   :: ray
                type(vec3_type)  :: pixel_center
                type(vec3_type)  :: ray_direction



                pixel_center &!
                    = viewport_upper_left        &!
                    + ( iter_w * pixel_delta_u ) &!
                    + ( iter_h * pixel_delta_v )

                ray_direction = pixel_center - camera_center

                ray%origin    = camera_center
                ray%direction = ray_direction

                color = ray_color( ray )

                write( unit = write_unit, fmt = * ) color

            end block
            end do

        end do



        write( unit = output_unit, fmt = '(/,A)', advance = 'yes' ) 'DONE !'



        close( write_unit )

    end procedure render_image04_mod1

end submodule imp_render_image04_mod1
