add_library(
    _raytracing_one_weekend
    module.f90
)



target_link_libraries( _raytracing_one_weekend _raytracing_color     )
target_link_libraries( _raytracing_one_weekend _raytracing_ppm_image )

# EOF
