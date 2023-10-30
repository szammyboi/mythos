#include <string>
#include <vector>

#define GLFW_INCLUDE_VULKAN
#include <glfw/glfw3.h>

class Shader
{
public:
    void Bind();
    void Unbind();

    static Shader& Create(const std::string& path);
private:
    static std::vector<char> readFile(const std::string& path);
    VkShaderModule m_VulkanHandle;
};