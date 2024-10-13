submodule (raytracing_color) imp_add

    implicit none



    contains



    module procedure add_color

        new_color%red   = lhs%red   + rhs%red
        new_color%green = lhs%green + rhs%green
        new_color%blue  = lhs%blue  + rhs%blue

    end procedure add_color

end submodule imp_add
