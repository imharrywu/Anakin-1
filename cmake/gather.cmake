# ----------------------------------------------------------------------------
# Copyright (c) 2017 Baidu.com, Inc. All Rights Reserved
# @file     gather_libs.cmake
# @auther   cuichaowen
# @date     2017-10-24
# ----------------------------------------------------------------------------

# find cudnn default cudnn 5
if(USE_CUDNN)
    anakin_find_cudnn()
endif()

# find cuda
if(USE_CUDA) 
    #set other cuda path
    set(CUDA_TOOLKIT_ROOT_DIR $ENV{CUDA_PATH})
    anakin_find_cuda()
endif()


# find opencl
if(USE_OPENCL)
    anakin_generate_kernel(${ANAKIN_ROOT})
    anakin_find_opencl()
endif()

# find opencv
if(USE_OPENCV)
    anakin_find_opencv()
endif()

# find boost default boost 1.59.0
if(USE_BOOST)
    anakin_find_boost()
endif()

if(BUILD_WITH_GLOG)
    anakin_find_glog()
endif()

if(USE_PROTOBUF)
    anakin_find_protobuf()
    anakin_protos_processing()
endif()

if (USE_GFLAGS)
    anakin_find_gflags()
endif()

if(USE_MKL)
    #anakin_find_mkl()
endif()

if (USE_XBYAK)
    #anakin_find_xbyak()
endif()
if (USE_MKLML)
    #anakin_find_mklml()
endif()

if(ENABLE_VERBOSE_MSG)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()

if(DISABLE_ALL_WARNINGS) 
    anakin_disable_warnings(CMAKE_CXX_FLAGS)
endif()

if(USE_ARM_PLACE)
    if(TARGET_ANDROID)
		if(USE_OPENMP)
        	anakin_find_openmp()
		endif()
    elseif(TARGET_IOS)
        message(STATUS " TARGET_IOS error")
    else()
        message(FATAL_ERROR " ARM TARGET unknown !")
    endif()
endif()
