submodule (raytracing_vec3) imp_div

    implicit none



    contains



    module procedure div_vec3_real64

        new_vec3 = lhs * ( 1.0_real64 / rhs )

    end procedure div_vec3_real64

end submodule imp_div
