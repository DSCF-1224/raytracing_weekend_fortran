program raytracing

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: raytracing_in_one_weekend

    implicit none

    print *, compiler_version()
    print *, compiler_options()

    call render_image01

end program raytracing
