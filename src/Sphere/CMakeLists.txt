add_library(
    _raytracing_sphere
    hit.f90
    module.f90
)



target_link_libraries( _raytracing_sphere _raytracing_hit_record )
target_link_libraries( _raytracing_sphere _raytracing_hittable   )
target_link_libraries( _raytracing_sphere _raytracing_ray        )
target_link_libraries( _raytracing_sphere _raytracing_vec3       )

# EOF
