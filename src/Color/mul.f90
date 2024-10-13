submodule (raytracing_color) imp_mul

    implicit none



    contains



    module procedure mul_real64_color

        new_color%red   = lhs * rhs%red
        new_color%green = lhs * rhs%green
        new_color%blue  = lhs * rhs%blue

    end procedure mul_real64_color

end submodule imp_mul
