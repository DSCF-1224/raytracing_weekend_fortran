module raytracing_in_one_weekend

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: render_image01
    public  :: render_image02



    contains



    subroutine render_image01

        use, non_intrinsic :: raytracing_color
        use, non_intrinsic :: raytracing_ppm_image



        integer, parameter :: image_height = 256
        integer, parameter :: image_width  = 256

        integer, parameter :: iter_h_max   = image_height - 1
        integer, parameter :: iter_w_max   = image_width  - 1



        integer :: iter_h
        !! A support variable for this `SUBROUTINE`

        integer :: iter_w
        !! A support variable for this `SUBROUTINE`

        integer :: write_unit
        !! the unit number to save the rendered image



        open( &!
            newunit = write_unit    , &!
            file    = 'image01.ppm' , &!
            action  = 'write'       , &!
            form    = 'formatted'   , &!
            status  = 'unknown'       &!
        )



        call write_ppm_image_header( &!
            unit         = write_unit   , &!
            image_width  = image_width  , &!
            image_height = image_height   &!
        )



        do iter_h = 0, iter_h_max
        do iter_w = 0, iter_w_max
        block

            type(color_type) :: pixel_color
            !! red/green/blue components are represented internally by real-valued variables
            !! that range from 0.0 to 1.0



            pixel_color%red   = real( iter_w, kind = real64 ) / iter_w_max
            pixel_color%green = real( iter_h, kind = real64 ) / iter_h_max
            pixel_color%blue  = 0.0_real64



            write( unit = write_unit, fmt = * ) pixel_color

        end block
        end do
        end do



        close( write_unit )

    end subroutine render_image01



    subroutine render_image02

        print *, "TEST: image 02"

    end subroutine render_image02

end module raytracing_in_one_weekend
