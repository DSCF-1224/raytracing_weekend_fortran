submodule (raytracing_vec3) imp_sub

    implicit none



    contains



    module procedure sub_vec3

        new_vec3%x = lhs%x - rhs%x
        new_vec3%y = lhs%y - rhs%y
        new_vec3%z = lhs%z - rhs%z

    end procedure sub_vec3

end submodule imp_sub
