from manim import *

class ShannonNyquistEquation(Scene):
    def construct(self):
        # Set the background color
        self.camera.background_color = "#080E26"

        # Define the equation using MathTex with dollar sign syntax
        summary_eng = Tex(r"If the Fourier transform of the signal $x(t)$, denoted as $X(f)$, has a maximum frequency component of $f_M$, then if $X(f) \notin [-f_M,f_M] \rightarrow X(f)=0$")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.6)
        summary_eng.move_to(UP * 3.5)

        equation = Tex(r"""
    $x(t) = \int_{-\infty}^{\infty} X(f)e^{i2\pi ft} df = \int_{-f_M}^{f_M} X(f)e^{i2\pi ft} df  $ 
""")
        equation.set_color(WHITE)
        equation.scale(0.8)
        equation.move_to(UP*2)




        equation2 = Tex(r"""
    $x\left(\frac{n}{2f_M}\right) \xrightarrow{t=\frac{n}{2f_M}} x\left(\frac{n}{2f_M}\right) = \int_{-f_M}^{f_M} X(f)e^{i2\pi\frac{nf}{2f_M}}df
$ 
""")
        equation2.set_color(WHITE)
        equation2.scale(0.8)
        equation2.move_to(DOWN*0.4)

        txt = Tex(r"""
    The n-th sample with a sampling rate of 2$f_M$: 
""")
        txt.set_color(WHITE)
        txt.scale(0.6)
        txt.move_to(UP*0.6)

        txt2 = Tex(r"""
it can be written as:
""")
        txt2.set_color(WHITE)
        txt2.scale(0.6)
        txt2.move_to(DOWN*1.5)

        equation3 = Tex(r"""
    $\tilde{X}(f) = \sum_{n=-\infty}^{\infty} \frac{1}{2f_M} x\left(\frac{n}{2f_M}\right) e^{-i2\pi\frac{nf}{2f_M}}$ 
""")
        equation3.set_color(WHITE)
        equation3.scale(0.8)
        equation3.move_to(DOWN*2.5)

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
        self.wait(1)
        self.play(
            Write(equation3),
            run_time=2,
            rate_func=smooth
        )

        rect3 = Rectangle(
            width=equation3.width + 0.5,
            height=equation3.height + 0.5,
            color='#82BDEA',
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