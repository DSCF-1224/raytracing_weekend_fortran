submodule (raytracing_vec3) imp_add

    implicit none



    contains



    module procedure add_vec3

        new_vec3%x = lhs%x + rhs%x
        new_vec3%y = lhs%y + rhs%y
        new_vec3%z = lhs%z + rhs%z

    end procedure add_vec3

end submodule imp_add
