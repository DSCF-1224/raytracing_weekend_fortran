submodule (raytracing_vec3) imp_length

    implicit none



    contains



    module procedure length_vec3

        length_vec3 = sqrt( length_squared( vec3 ) )

    end procedure length_vec3

end submodule imp_length
