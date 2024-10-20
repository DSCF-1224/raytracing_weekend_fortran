add_library(
    _raytracing_color
    add.f90
    module.f90
    mul.f90
    write_formatted.f90
)



target_link_libraries( _raytracing_color _raytracing_interval )

# EOF
