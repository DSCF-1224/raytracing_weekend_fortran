add_library(
    _raytracing_one_weekend
    module.f90
    render_image01.f90
    render_image02.f90
    render_image03.f90
    render_image04.f90
    render_image04_mod1.f90
    render_image05.f90
    render_image06.f90
    render_image07.f90
)



target_link_libraries( _raytracing_one_weekend _raytracing_camera        )
target_link_libraries( _raytracing_one_weekend _raytracing_color         )
target_link_libraries( _raytracing_one_weekend _raytracing_hittable      )
target_link_libraries( _raytracing_one_weekend _raytracing_hittable_list )
target_link_libraries( _raytracing_one_weekend _raytracing_interval      )
target_link_libraries( _raytracing_one_weekend _raytracing_ppm_image     )
target_link_libraries( _raytracing_one_weekend _raytracing_ray           )
target_link_libraries( _raytracing_one_weekend _raytracing_sphere        )
target_link_libraries( _raytracing_one_weekend _raytracing_vec3          )

# EOF
