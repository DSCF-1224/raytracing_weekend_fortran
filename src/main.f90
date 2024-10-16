program raytracing

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_in_one_weekend

    implicit none

    print *, compiler_version()
    print *, compiler_options()

    call render_image01
    call render_image02
    call render_image03
    call render_image04
    call render_image04_mod1
    call render_image05

end program raytracing
