add_library(
    _raytracing_hittable
    module.f90
)



target_link_libraries( _raytracing_hittable _raytracing_hit_record )
target_link_libraries( _raytracing_hittable _raytracing_ray        )

# EOF
