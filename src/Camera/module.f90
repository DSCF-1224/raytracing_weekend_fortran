module raytracing_camera

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_color
    use, non_intrinsic :: raytracing_hittable_list
    use, non_intrinsic :: raytracing_ppm_image
    use, non_intrinsic :: raytracing_ray
    use, non_intrinsic :: raytracing_vec3



    implicit none



    private
    public  :: camera_type



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
        procedure, pass, private :: initialize_manually
        procedure, pass, public  :: render

        generic, public :: initialize => initialize_default
        generic, public :: initialize => initialize_manually

    end type camera_type



    interface

        module function ray_color_t( ray, world ) result( color )

            type(ray_type), intent(in) :: ray

            type(hittable_list_type), intent(in) :: world

            type(color_type) :: color

        end function ray_color_t



        module subroutine initialize_default( camera )

            class(camera_type), intent(inout) :: camera

        end subroutine initialize_default



        module subroutine initialize_manually( camera, image_width, aspect_ratio )

            class(camera_type), intent(inout) :: camera

            integer, intent(in) :: image_width
            !! Rendered image width in pixel count

            real(real64), intent(in) :: aspect_ratio
            !! Ratio of image width over height

        end subroutine initialize_manually



        module subroutine render( camera, file, world, ray_color )

            class(camera_type), intent(in) :: camera

            character( len = * ), intent(in) :: file

            type(hittable_list_type), intent(in) :: world

            procedure(ray_color_t) :: ray_color

        end subroutine render

    end interface

end module raytracing_camera
