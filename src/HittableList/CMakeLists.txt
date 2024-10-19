add_library(
    _raytracing_hittable_list
    hit.f90
    module.f90
)



target_link_libraries( _raytracing_hittable_list _raytracing_hit_record         )
target_link_libraries( _raytracing_hittable_list _raytracing_hittable           )
target_link_libraries( _raytracing_hittable_list _raytracing_hittable_list_item )
target_link_libraries( _raytracing_hittable_list _raytracing_interval           )
target_link_libraries( _raytracing_hittable_list _raytracing_ray                )

# EOF
