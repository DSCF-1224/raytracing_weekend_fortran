add_library(
    _raytracing_ppm_image
    module.f90
)



target_link_libraries( _raytracing_ppm_image _raytracing_color )

# EOF
