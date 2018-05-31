/**
 * @cond ___LICENSE___
 *
 * Copyright (c) 2016-2018 Zefiros Software.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @endcond
 */

#include <bx/uint32_t.h>
#include "logo.h"
#include "bgfx/embedded_shader.h"

class ExampleHelloWorld
{
public:
    void init()
    {
        m_width  = 1280;
        m_height = 720;
        m_debug  = BGFX_DEBUG_TEXT;
        m_reset  = BGFX_RESET_VSYNC;

        bgfx::init(bgfx::RendererType::Noop, 0);
        bgfx::reset(m_width, m_height, m_reset);

        // Enable debug text.
        bgfx::setDebug(m_debug);

        // Set view 0 clear state.
        bgfx::setViewClear(0
                           , BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH
                           , 0x303030ff
                           , 1.0f
                           , 0
                          );
    }

    virtual int shutdown()
    {
        // Shutdown bgfx.
        bgfx::shutdown();

        return 0;
    }

    bool update()
    {
        // Set view 0 default viewport.
        bgfx::setViewRect(0, 0, 0, uint16_t(m_width), uint16_t(m_height));

        // This dummy draw call is here to make sure that view 0 is cleared
        // if no other draw calls are submitted to view 0.
        bgfx::touch(0);

        // Use debug font to print information about this example.
        bgfx::dbgTextClear();
        bgfx::dbgTextImage(bx::uint16_max(uint16_t(m_width / 2 / 8), 20) - 20
                           , bx::uint16_max(uint16_t(m_height / 2 / 16), 6) - 6
                           , 40
                           , 12
                           , s_logo
                           , 160
                          );
        bgfx::dbgTextPrintf(0, 1, 0x4f, "bgfx/examples/00-helloworld");
        bgfx::dbgTextPrintf(0, 2, 0x6f, "Description: Initialization and debug text.");

        bgfx::dbgTextPrintf(0, 4, 0x0f,
                            "Color can be changed with ANSI \x1b[9;me\x1b[10;ms\x1b[11;mc\x1b[12;ma\x1b[13;mp\x1b[14;me\x1b[0m code too.");

        const bgfx::Stats *stats = bgfx::getStats();
        bgfx::dbgTextPrintf(0, 6, 0x0f, "Backbuffer %dW x %dH in pixels, debug text %dW x %dH in characters."
                            , stats->width
                            , stats->height
                            , stats->textWidth
                            , stats->textHeight
                           );

        // Advance to next frame. Rendering thread will be kicked to
        // process submitted rendering primitives.
        bgfx::frame();

        return true;
    }

private:
    uint32_t m_width;
    uint32_t m_height;
    uint32_t m_debug;
    uint32_t m_reset;
};

int main(int, const char **)
{
    ExampleHelloWorld example;
}