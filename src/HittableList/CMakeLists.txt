add_library(
    _raytracing_hittable_list
    module.f90
)



target_link_libraries( _raytracing_hittable_list _raytracing_hittable           )
target_link_libraries( _raytracing_hittable_list _raytracing_hittable_list_item )

# EOF
