submodule (raytracing_hit_record) imp_set_face_normal

    implicit none

    contains



    module procedure set_face_normal

        hit_record%front_face = ( dot_product( ray%direction, outer_normal ) .lt. 0.0_real64 )
        hit_record%normal     = merge( tsource = outer_normal, fsource = - outer_normal, mask = hit_record%front_face )

    end procedure set_face_normal

end submodule imp_set_face_normal
