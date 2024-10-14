add_library(
    _raytracing_ray
    at.f90
    module.f90
)



target_link_libraries( _raytracing_ray _raytracing_vec3 )

# EOF
