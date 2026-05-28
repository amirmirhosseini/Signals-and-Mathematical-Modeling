from manim import *

class ShannonNyquistEquation(Scene):
    def construct(self):
        # Set the background color
        self.camera.background_color = "#080E26"

        # Define the equation using MathTex with dollar sign syntax
        summary_eng = Tex(r"if $X(f) \in [-f_M,f_M] \rightarrow X(f)=\tilde{X}(f)$")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.6)
        summary_eng.move_to(UP * 3.2)

        equation = Tex(r"""
    $X(f) = \tilde{X}(f) \Pi\left(\frac{f}{2f_M}\right) = \Pi\left(\frac{f}{2f_M}\right) \sum_{n=-\infty}^{\infty} \frac{1}{2f_M} x\left(\frac{n}{2f_M}\right) e^{-i2\pi\frac{nf}{2f_M}}
$ 
""")
        equation.set_color(WHITE)
        equation.scale(0.8)
        equation.move_to(UP*2)



        txt = Tex(r"""
    (in reality by Low-Pass filter) 
""")
        txt.set_color(WHITE)
        txt.scale(0.5)
        txt.move_to(UP*1)

        equation2 = Tex(r"""
    $x(t) = \mathcal{F}^{-1}\{X(f)\} = \mathcal{F}^{-1}\left\{\Pi\left(\frac{f}{2f_M}\right) \sum_{n=-\infty}^{\infty} \frac{1}{2f_M} x\left(\frac{n}{2f_M}\right) e^{-i2\pi\frac{nf}{2f_M}}\right\}
$ 
""")
        equation2.set_color(WHITE)
        equation2.scale(0.8)
        equation2.move_to(ORIGIN)



        txt2 = Tex(r"""
$ = \mathcal{F}^{-1} \left\{ \Pi \left( \frac{f}{2f_M} \right) \right\} * \mathcal{F}^{-1} \left\{ \sum_{n=-\infty}^{\infty} \frac{1}{2f_M} x\left( \frac{n}{2f_M} \right) e^{-i \frac{2\pi}{2f_M} n f} \right\}
$
""")
        txt2.set_color(WHITE)
        txt2.scale(0.8)
        txt2.move_to(DOWN*1.5)

        equation3 = Tex(r"""
$sinc(2f_M t) * \sum_{n=-\infty}^{\infty} x\left(\frac{n}{2f_M}\right) \delta\left(t - \frac{n}{2f_M}\right)
$""")
        equation3.set_color(WHITE)
        equation3.scale(0.8)
        equation3.move_to(DOWN*3)

        self.play(
            Write(summary_eng),
            run_time=2,
            rate_func=smooth
        )
        self.wait(1.3)

        # Add the equation to the scene
        self.play(
            Write(equation),
            run_time=2,
            rate_func=smooth
        )

        # Create a rectangle around the equation
        rect = Rectangle(
            width=equation.width + 0.5,
            height=equation.height + 0.5,
            color='#82BDEA',
            stroke_width=2
        )
        rect.move_to(equation)

        # Animate the rectangle
        self.play(
            Create(rect),
            run_time=1
        )

        self.wait(0.3)
        self.play(
            Write(txt),
            run_time=2,
            rate_func=smooth
        )
        self.wait(1)
        self.play(
            Write(equation2),
            run_time=2,
            rate_func=smooth
        )

        rect2 = Rectangle(
            width=equation2.width + 0.5,
            height=equation2.height + 0.5,
            color='#82BDEA',
            stroke_width=2
        )
        rect2.move_to(equation2)

        # Animate the rectangle
        self.play(
            Create(rect2),
            run_time=1
        )
        self.wait(0.3)
        self.play(
            Write(txt2),
            run_time=2,
            rate_func=smooth
        )
        rect5 = Rectangle(
            width=txt2.width + 0.5,
            height=txt2.height + 0.5,
            color='#82BDEA',
            stroke_width=2
        )
        rect5.move_to(txt2)

        # Animate the rectangle
        self.play(
            Create(rect5),
            run_time=1
        )
        self.wait(1)
        self.play(
            Write(equation3),
            run_time=2,
            rate_func=smooth
        )

        rect3 = Rectangle(
            width=equation3.width + 0.5,
            height=equation3.height + 0.5,
            color=ORANGE,
            stroke_width=2
        )
        rect3.move_to(equation3)

        # Animate the rectangle
        self.play(
            Create(rect3),
            run_time=1
        )
        # Pause the animation for 2 seconds
        self.wait(2)

        equation = Tex(r"""
       $x(t) = \sum_{n=-\infty}^{\infty}$
        $\left(\frac{n}{2f_M}\right)$sinc$\left(2f_M\left(t - \frac{n}{2f_M}\right)\right)$
        """)