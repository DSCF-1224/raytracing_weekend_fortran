add_library(
    _raytracing_camera
    initialize.f90
    module.f90
    render.f90
    sample_square.f90
)



target_link_libraries( _raytracing_camera _raytracing_color         )
target_link_libraries( _raytracing_camera _raytracing_hittable_list )
target_link_libraries( _raytracing_camera _raytracing_ppm_image     )
target_link_libraries( _raytracing_camera _raytracing_random_number )
target_link_libraries( _raytracing_camera _raytracing_ray           )
target_link_libraries( _raytracing_camera _raytracing_vec3          )

# EOF
