submodule (raytracing_vec3) imp_neg

    implicit none



    contains



    module procedure neg_vec3

        new_vec3%x = - vec3%x
        new_vec3%y = - vec3%y
        new_vec3%z = - vec3%z

    end procedure neg_vec3

end submodule imp_neg
