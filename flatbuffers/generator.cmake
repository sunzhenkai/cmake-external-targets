macro(GenerateFlatBuffersMessage target)
    cmake_parse_arguments(ARG "" "OUTPUT;PATH" "FILES" ${ARGN})

    file(GLOB T_FB_FILES ${ARG_FILES})
    # TODO correct target name
    get_property(flatbuffers_binary TARGET flatbuffers::bin::flatc PROPERTY LOCATION)
    foreach (I ${T_FB_FILES})
        execute_process(COMMAND ${flatbuffers_binary} --cpp --scoped-enums --reflect-names --gen-object-api
                -o ${ARG_OUTPUT} ${I}
                RESULT_VARIABLE rc)
        if (NOT "${rc}" STREQUAL "0")
            message(FATAL_ERROR "[GenerateFlatbuffersMessage] generate ${I} cpp code failed. [message=${rc}]")
        endif ()
        execute_process(COMMAND ${flatbuffers_binary} --binary --schema -o ${ARG_OUTPUT} ${I}
                RESULT_VARIABLE rc)
        if (NOT "${rc}" STREQUAL "0")
            message(FATAL_ERROR "[GenerateFlatbuffersMessage] generate ${I} binary failed. [message=${rc}]")
        endif ()
    endforeach ()
    set(${target}_include ${ARG_OUTPUT})
    file(GLOB ${target}_src ${ARG_OUTPUT}/*.h)
    file(GLOB ${target}_binary ${ARG_OUTPUT}/*.bfbs)
    include_directories(${${target}_include})

    DoUnset(TARGETS T_FB_FILES ARG_OUTPUT ARG_PATH ARG_FILES proto_binary)
endmacro(GenerateFlatBuffersMessage)