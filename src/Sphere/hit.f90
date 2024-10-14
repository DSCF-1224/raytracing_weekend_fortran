submodule (raytracing_sphere) imp_hit

    implicit none

    contains



    module procedure hit_sphere

        real(real64) :: root



        hit_stat = .false.



        block

            real(real64) :: a, c, discriminant, h, sqrt_discriminant

            type(vec3_type) :: oc



            oc           = self%center - ray%origin
            a            = length_squared( ray%direction )
            h            = dot_product( ray%direction , oc )
            c            = length_squared( oc ) - self%radius * self%radius
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

        end block



        block

            type(vec3_type) :: outer_normal



            hit_stat         = .true.
            hit_record%t     = root
            hit_record%point = ray%at( root )
            outer_normal     = ( hit_record%point - self%center ) / self%radius

            call hit_record%set_face_normal( ray, outer_normal )

        end block

    end procedure hit_sphere

end submodule imp_hit
