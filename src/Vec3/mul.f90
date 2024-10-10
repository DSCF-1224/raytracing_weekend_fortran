submodule (raytracing_vec3) imp_mul

    implicit none



    contains



    module procedure mul_vec3_real64

        new_vec3%x = lhs%x * rhs
        new_vec3%y = lhs%y * rhs
        new_vec3%z = lhs%z * rhs

    end procedure mul_vec3_real64

end submodule imp_mul
