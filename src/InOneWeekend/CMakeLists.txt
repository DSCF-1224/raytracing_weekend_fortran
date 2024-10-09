add_library(
    _raytracing_one_weekend
    module.f90
    render_image01.f90
    render_image02.f90
)



target_link_libraries( _raytracing_one_weekend _raytracing_color     )
target_link_libraries( _raytracing_one_weekend _raytracing_ppm_image )
target_link_libraries( _raytracing_one_weekend _raytracing_vec3      )

# EOF
