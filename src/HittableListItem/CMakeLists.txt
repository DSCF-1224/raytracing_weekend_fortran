add_library(
    _raytracing_hittable_list_item
    hit.f90
    module.f90
)



target_link_libraries( _raytracing_hittable_list_item _raytracing_hit_record )
target_link_libraries( _raytracing_hittable_list_item _raytracing_hittable   )
target_link_libraries( _raytracing_hittable_list_item _raytracing_ray        )
target_link_libraries( _raytracing_hittable_list_item _raytracing_sphere     )

# EOF
