---@diagnostic disable: lowercase-global, undefined-global

require "ninja"
require "export-compile-commands"

workspace "Mythos"
    configurations {"release", "debug"}
    targetdir "build"
    architecture "x86_64"
    flags "MultiProcessorCompile"

outputdir = "%{cfg.buildcfg}"

include "vendor/glfw-premake"

project "Mythos"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("build/bin/" .. outputdir)
    objdir ("build/bin-int/" .. outputdir)

    symbols "on"
    buildoptions {"-Werror", "-Wuninitialized", "-Wno-narrowing"}
    files 
    { 
        "src/**.h",
        "src/**.cpp"
    }


    -- Should search for vulkan sdk instead of hardcoding
    includedirs 
    {
        "vendor/glfw-premake/include",
        "vendor/glm",
        "C:/Dev/C++/Libraries/VulkanSDK/include"
    }

    libdirs {
        "C:/Dev/C++/Libraries/VulkanSDK/lib"
    }

    links 
    {
        "vulkan-1",
        "GLFW",
        "gdi32"
    }

    postbuildcommands {
        --"glslc.exe src/shaders/shader.vert -o src/shaders/vert.spv",
        --"glslc.exe src/shaders/shader.frag -o src/shaders/frag.spv",
        -- "pause"
    }

    filter "configurations:debug"
        defines "DEBUG"
