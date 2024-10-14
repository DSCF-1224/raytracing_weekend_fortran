submodule (raytracing_vec3) imp_dot_product

    implicit none



    contains



    module procedure dot_product_vec3

        dot_product_vec3    &!
            = lhs%x * rhs%x &!
            + lhs%y * rhs%y &!
            + lhs%z * rhs%z

    end procedure dot_product_vec3

end submodule imp_dot_product
