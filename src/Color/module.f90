module raytracing_color

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: color_type
    public  :: white_point
    public  :: write(formatted)



    interface write(formatted)
        module procedure :: write_color
    end interface write(formatted)



    type :: color_type

        real(real64), public :: red, green, blue

    end type color_type



    integer, parameter :: white_point = 255



    contains



    subroutine write_color( color, unit, iotype, arglist, iostat, iomsg )

        class(color_type), intent(in) :: color

        integer, intent(in) :: unit

        character(*), intent(in) :: iotype

        integer, intent(in), dimension(:) :: arglist

        integer, intent(out) :: iostat

        character(*), intent(inout) :: iomsg



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

    end subroutine write_color



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
            floor( white_point * color%red   ) , &!
            floor( white_point * color%green ) , &!
            floor( white_point * color%blue  )

    end subroutine write_color_default

end module raytracing_color
