module raytracing_random_number

    use, intrinsic :: iso_fortran_env



    implicit none



    private
    public  :: random_number



    interface random_number

        module subroutine random_number_min_max( min, max, harvest )

            real(real64), intent(in) :: min, max

            real(real64), intent(out) :: harvest

        end subroutine random_number_min_max

    end interface random_number

end module raytracing_random_number
