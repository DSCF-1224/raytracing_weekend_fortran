submodule (raytracing_vec3) imp_length_squared

    implicit none



    contains



    module procedure length_squared_vec3

        length_squared_vec3 = dot_product( vec3, vec3 )

    end procedure length_squared_vec3

end submodule imp_length_squared
