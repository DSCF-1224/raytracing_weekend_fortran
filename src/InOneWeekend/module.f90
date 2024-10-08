module raytracing_in_one_weekend

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: render_image01
    public  :: render_image02



    interface

        module subroutine render_image01
        end  subroutine render_image01



        module subroutine render_image02
        end  subroutine render_image02

    end interface

end module raytracing_in_one_weekend
