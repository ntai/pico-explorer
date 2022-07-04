function(add_resource target file)
    get_filename_component(NAME ${ARGV1} NAME_WE)
    set(FILENAME ${ARGV1})

    add_custom_command(
            OUTPUT ${NAME}.o

            COMMAND ${CMAKE_COMMAND} -E copy
            ${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME}
            ${CMAKE_CURRENT_BINARY_DIR}

            COMMAND arm-none-eabi-ld -r -b binary -o ${NAME}.o ${FILENAME}
            DEPENDS ${FILENAME}
    )

    target_sources(${ARGV0} PRIVATE ${NAME}.o)
endfunction(add_resource)
