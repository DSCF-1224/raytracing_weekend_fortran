submodule (raytracing_vec3) imp_unit_vector

    implicit none



    contains



    module procedure unit_vector_vec3

        unit_vector_vec3 = vec3 / length( vec3 )

    end procedure unit_vector_vec3

end submodule imp_unit_vector
