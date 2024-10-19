module raytracing_camera

    use, intrinsic :: iso_fortran_env



    implicit none



    type :: camera_type

        integer, private :: image_height_
        !! Rendered image height

        integer, private :: image_width_ = 100
        !! Rendered image width in pixel count

        real(real64), private :: aspect_ratio_ = 1.0_real64
        !! Ratio of image width over height

    end type camera_type

end module raytracing_camera
