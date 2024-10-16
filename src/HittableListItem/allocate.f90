submodule (raytracing_hittable_list_item) imp_allocate

    implicit none



    contains



    module procedure allocate_object

        logical :: flag



        flag = .true.



        select type ( source )

            type is ( sphere_type )

                allocate( sphere_type :: self%object )

            class default

                flag = .false.

        end select



        if ( flag ) self%object = source

    end procedure allocate_object

end submodule imp_allocate
