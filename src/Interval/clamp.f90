submodule (raytracing_interval) imp_clamp

    implicit none



    contains



    module procedure clamp

        if      ( x .lt. interval%min ) then ; clamp = interval%min; return
        else if ( x .gt. interval%max ) then ; clamp = interval%max; return
        else                                 ; clamp = x
        end if

    end procedure clamp

end submodule imp_clamp
