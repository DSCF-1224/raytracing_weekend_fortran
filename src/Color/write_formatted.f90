submodule (raytracing_color) imp_write_formatted

    implicit none



    type(interval_type), parameter :: intensity = interval_type( min = 0.0_real64, max = 1.0_real64 )



    contains



    module procedure write_color

        logical :: flag



        flag =     ( iotype             .eq. 'LISTDIRECTED' ) &!
        &    .and. ( size( arglist(:) ) .lt. 1              )



        if ( flag ) then

            call write_color_default( &!
                color  = color    , &!
                unit   = unit     , &!
                iostat = iostat   , &!
                iomsg  = iomsg(:)   &!
            )

            return

        end if



        error stop ' Unsupported `write(formatted)` mode was detected.'

    end procedure write_color



    subroutine write_color_default( color, unit, iostat, iomsg )

        class(color_type), intent(in) :: color

        integer, intent(in) :: unit

        integer, intent(out) :: iostat

        character(*), intent(inout) :: iomsg



        write( &!
            unit   = unit            , &!
            fmt    = '(I3,2(1X,I3))' , &!
            iostat = iostat          , &!
            iomsg  = iomsg(:)          &!
        ) &!
            floor( white_point * intensity%clamp( color%red   ) ) , &!
            floor( white_point * intensity%clamp( color%green ) ) , &!
            floor( white_point * intensity%clamp( color%blue  ) )

    end subroutine write_color_default

end submodule imp_write_formatted
