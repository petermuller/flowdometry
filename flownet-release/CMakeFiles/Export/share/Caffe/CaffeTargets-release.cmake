#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "caffe" for configuration "Release"
set_property(TARGET caffe APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(caffe PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "proto;proto;/tools/boost/1.58.0/lib/libboost_system.so;/tools/boost/1.58.0/lib/libboost_thread.so;/tools/boost/1.58.0/lib/libboost_filesystem.so;-lpthread;/tools/glog/0.3.4/lib/libglog.so;/tools/gflags/2.1.2/lib/libgflags.a;/tools/protobuf/2.6.1/lib/libprotobuf.so;-lpthread;/usr/lib64/libhdf5_hl.so;/usr/lib64/libhdf5.so;/usr/lib64/liblmdb.so;/usr/lib64/libleveldb.so;/tools/snappy/2015-06-24/lib/libsnappy.so;/usr/local/cuda-6.5/lib64/libcudart.so;/usr/local/cuda-6.5/lib64/libcurand.so;/usr/local/cuda-6.5/lib64/libcublas.so;/tools/cudnn/7.0/lib64/libcudnn.so;opencv_core;opencv_highgui;opencv_imgproc;/tools/openblas/0.2.14/lib/libopenblas.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcaffe.so"
  IMPORTED_SONAME_RELEASE "libcaffe.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS caffe )
list(APPEND _IMPORT_CHECK_FILES_FOR_caffe "${_IMPORT_PREFIX}/lib/libcaffe.so" )

# Import target "proto" for configuration "Release"
set_property(TARGET proto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(proto PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libproto.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS proto )
list(APPEND _IMPORT_CHECK_FILES_FOR_proto "${_IMPORT_PREFIX}/lib/libproto.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
