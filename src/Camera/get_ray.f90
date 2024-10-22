submodule (raytracing_camera) imp_get_ray

    implicit none



    contains



    module procedure get_ray

        type(vec3_type) :: offset
        type(vec3_type) :: pixel_sample



        call sample_square( offset )



        pixel_sample &!
            = camera%pixel00_loc_                            &!
            + ( index_w + offset%x ) * camera%pixel_delta_u_ &!
            + ( index_h + offset%y ) * camera%pixel_delta_v_



        ray%origin    =                camera%center_
        ray%direction = pixel_sample - camera%center_

    end procedure get_ray

end submodule imp_get_ray
