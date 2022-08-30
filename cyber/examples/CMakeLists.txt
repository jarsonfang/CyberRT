project(examples VERSION 1.0.0)

# compile .proto files
set(CYBER_EXAMPLES_PROTO_DIR ${CMAKE_CURRENT_SOURCE_DIR}/proto)
file(GLOB_RECURSE CYBER_EXAMPLES_PROTO_FILES "proto/*.proto")

foreach(PROTO_FILE ${CYBER_EXAMPLES_PROTO_FILES})
    execute_process(
        COMMAND ${PROTOC_EXECUTABLE} ${PROTO_FILE}
            --cpp_out=${CYBER_EXAMPLES_PROTO_DIR}
            # --python_out=${CYBER_EXAMPLES_PROTO_DIR}
            -I ${CYBER_EXAMPLES_PROTO_DIR}
        RESULT_VARIABLE PROTOC_RESULT)

    if (NOT (${PROTOC_RESULT} EQUAL 0))
        message(FATAL_ERROR "failed to compile proto file: ${PROTO_FILE}")
    endif()
endforeach()


add_executable(cyber_example_talker
    talker.cc
    proto/examples.pb.cc)
target_link_libraries(cyber_example_talker
    ${TARGET_NAME}
    pthread
)

add_executable(cyber_example_listener
    listener.cc
    proto/examples.pb.cc)
target_link_libraries(cyber_example_listener
    ${TARGET_NAME}
    pthread
)

add_executable(cyber_example_paramserver paramserver.cc)
target_link_libraries(cyber_example_paramserver
    ${TARGET_NAME}
)

add_executable(cyber_example_record record.cc)
target_link_libraries(cyber_example_record
    ${TARGET_NAME}
)

add_executable(cyber_example_service
    service.cc
    proto/examples.pb.cc)
target_link_libraries(cyber_example_service
    ${TARGET_NAME}
)

add_executable(cyber_example_server
    server.cc
    proto/examples.pb.cc)
target_link_libraries(cyber_example_server
    ${TARGET_NAME}
)

add_executable(cyber_example_client
    client.cc
    proto/examples.pb.cc)
target_link_libraries(cyber_example_client
    ${TARGET_NAME}
)

add_subdirectory(common_component_example)

