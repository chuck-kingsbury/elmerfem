INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/../test_macros.cmake)
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR}/fem/src)

CONFIGURE_FILE( coat.sif coat.sif COPYONLY)

file(COPY ELMERSOLVER_STARTINFO coat.grd  kurvi.dat.names scalars.dat.names DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/")

ADD_ELMER_TEST(coating)
