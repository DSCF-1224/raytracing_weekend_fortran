add_library(
    _raytracing_camera
    initialize.f90
    module.f90
)



target_link_libraries( _raytracing_camera _raytracing_vec3 )

# EOF
