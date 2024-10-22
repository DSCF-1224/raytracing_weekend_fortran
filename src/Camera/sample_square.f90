submodule (raytracing_camera) imp_sample_square

    implicit none



    contains



    module procedure sample_square

        call random_number( harvest%x )
        call random_number( harvest%y )

        harvest%x = harvest%x - 0.5_real64
        harvest%y = harvest%y - 0.5_real64
        harvest%z =             0.0_real64

    end procedure sample_square

end submodule imp_sample_square
