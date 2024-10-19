submodule (raytracing_interval) imp_surrounds

    implicit none



    contains



    module procedure surrounds

        surrounds = ( interval%min .lt. x ) .and. ( x .lt. interval%max )

    end procedure surrounds

end submodule imp_surrounds
