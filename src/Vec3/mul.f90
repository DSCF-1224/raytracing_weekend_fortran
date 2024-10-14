submodule (raytracing_vec3) imp_mul

    implicit none



    contains



    module procedure mul_integer_vec3

        new_vec3 = real( lhs, kind = real64 ) * rhs

    end procedure mul_integer_vec3



    module procedure mul_real64_vec3

        new_vec3%x = lhs * rhs%x
        new_vec3%y = lhs * rhs%y
        new_vec3%z = lhs * rhs%z

    end procedure mul_real64_vec3



    module procedure mul_vec3_real64

        new_vec3%x = lhs%x * rhs
        new_vec3%y = lhs%y * rhs
        new_vec3%z = lhs%z * rhs

    end procedure mul_vec3_real64

end submodule imp_mul
