module raytracing_camera

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_vec3



    implicit none



    type :: camera_type

        integer, private :: image_height_
        !! Rendered image height

        integer, private :: image_width_ = 100
        !! Rendered image width in pixel count

        real(real64), private :: aspect_ratio_ = 1.0_real64
        !! Ratio of image width over height

        type(vec3_type), private :: center_
        !! Camera center

        type(vec3_type), private :: pixel00_loc_
        !! Location of pixel 0, 0

        type(vec3_type), private :: pixel_delta_u_
        !! Offset to pixel to the right

        type(vec3_type), private :: pixel_delta_v_
        !! Offset to pixel below



        contains



        procedure, pass, private :: initialize_default

        generic, public :: initialize => initialize_default

    end type camera_type



    interface

        module subroutine initialize_default( camera )

            class(camera_type), intent(inout) :: camera

        end subroutine initialize_default

    end interface

end module raytracing_camera
