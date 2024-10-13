module raytracing_ppm_image

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_color



    implicit none



    private
    public  :: write_ppm_image_header



    contains



    subroutine write_ppm_image_header( unit, image_width, image_height )

        integer, intent(in) :: unit

        integer, intent(in) :: image_width, image_height



        write( unit = unit, fmt = '(A)'        ) 'P3'
        write( unit = unit, fmt = '(I0,1X,I0)' ) image_width, image_height
        write( unit = unit, fmt = '(I0)'       ) white_point

    end subroutine write_ppm_image_header

end module raytracing_ppm_image
