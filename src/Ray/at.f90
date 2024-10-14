submodule (raytracing_ray) imp_at

    implicit none



    contains



    module procedure at

        at = ray%origin + ray%direction * t

    end procedure at

end submodule imp_at
