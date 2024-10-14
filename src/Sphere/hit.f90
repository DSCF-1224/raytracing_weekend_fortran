submodule (raytracing_sphere) imp_hit

    implicit none

    contains



    module procedure hit_sphere

        real(real64) :: a, c, discriminant, h, root, sqrt_discriminant

        type(vec3_type) :: oc



        hit_stat     = .false.



        oc           = self%center - ray%origin
        a            = length_squared( ray%direction )
        h            = dot_product( ray%direction , oc )
        c            = length_squared( oc ) - radius * radius
        discriminant = h * h - a * c



        if ( discriminant .lt. 0.0_real64 ) return



        sqrt_discriminant = sqrt( discriminant )
        root              = ( h - sqrt_discriminant ) / a



        if ( ( root .le. t_min ) .or. ( t_max .le. root ) ) then

            root = ( h + sqrt_discriminant ) / a

            if ( ( root .le. t_min ) .or. ( t_max .le. root ) ) then

                return

            end if

        end if



        hit_stat          = .true.
        hit_record%t      = root
        hit_record%point  = ray%at( root )
        hit_record%normal = ( hit_record%point - self%center ) / self%radius

    end procedure hit_sphere

end submodule imp_hit
