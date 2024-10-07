cmake_minimum_required(VERSION 3.5)



enable_language(Fortran)
project(raytracing.exe Fortran)



set(CMAKE_Fortran_FLAGS            "-ffree-line-length-none -fimplicit-none -pedantic -std=f2008 -Wall -Werror -Wextra")
set(CMAKE_Fortran_FLAGS_DEBUG      "-O0 -fcheck=all -fbacktrace -g -ffpe-trap=invalid,zero,overflow,underflow,denormal -finit-real=snan -Wcharacter-truncation -Wunderflow")
set(CMAKE_Fortran_FLAGS_RELEASE    "-O3")
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fortran-modules)



add_subdirectory( ${CMAKE_CURRENT_SOURCE_DIR}/Color        )
add_subdirectory( ${CMAKE_CURRENT_SOURCE_DIR}/InOneWeekend )
add_subdirectory( ${CMAKE_CURRENT_SOURCE_DIR}/PPM_Image    )



add_executable( ${PROJECT_NAME} )



target_sources(
	${PROJECT_NAME}
	PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/main.f90
)



target_link_libraries( ${PROJECT_NAME} _raytracing_one_weekend )

# EOF
