add_library(
    _raytracing_hit_record
    module.f90
)



target_link_libraries( _raytracing_hit_record _raytracing_vec3 )

# EOF
