submodule (raytracing_random_number) imp_random_number

    implicit none



    contains



    module procedure random_number_min_max

        call random_number( harvest )

        harvest = min + ( max - min ) * harvest

    end procedure random_number_min_max

end submodule imp_random_number
