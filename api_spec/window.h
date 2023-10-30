#define GLFW_INCLUDE_VULKAN
#include <glfw/glfw3.h>

class Window {
public:
    Window(int width, int height);
    ~Window() = default;

private:
    int m_Width, m_Height;
    GLFWwindow* m_Window;
};

Window::Window(int width, int height)
    : m_Width(width), m_Height(height)
{
    glfwInit();

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE);

    m_Window = glfwCreateWindow(m_Width, m_Height, "Vulkan", nullptr, nullptr);
    glfwSetWindowUserPointer(m_Window, this);
    //glfwSetFramebufferSizeCallback(m_Window, FramebufferResizeCallback);
}