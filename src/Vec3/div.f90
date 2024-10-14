submodule (raytracing_vec3) imp_div

    implicit none



    contains



    module procedure div_vec3_integer

        new_vec3 = lhs / real( rhs, kind = real64 )

    end procedure div_vec3_integer



    module procedure div_vec3_real64

        new_vec3 = lhs * ( 1.0_real64 / rhs )

    end procedure div_vec3_real64

end submodule imp_div
