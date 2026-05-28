from manim import *

class ShannonNyquistEquation(Scene):
    def construct(self):
        # Set the background color
        self.camera.background_color = "#080E26"

        # Define the equation using MathTex with dollar sign syntax
        summary_eng = Tex(r"If the bandwidth of the signal $x(t)$ is less than $f_M$, it can be reconstructed from the recorded samples.")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.6)
        summary_eng.move_to(UP * 3.5)

        equation = Tex(r"""
       $x(t) = \sum_{n=-\infty}^{\infty}$
        $x\left(\frac{n}{2f_M}\right)$sinc$\left(2f_M\left(t - \frac{n}{2f_M}\right)\right)$
        """)
        equation.set_color(WHITE)
        equation.scale(0.8)
        equation.move_to(ORIGIN)
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
            width=equation.width + 1,
            height=equation.height + 1,
            color='#82BDEA',
            stroke_width=2
        )
        rect.move_to(equation)

        # Animate the rectangle
        self.play(
            Create(rect),
            run_time=1
        )

        # Pause the animation for 2 seconds
        self.wait(2)

        equation = Tex(r"""
       $x(t) = \sum_{n=-\infty}^{\infty}$
        $\left(\frac{n}{2f_M}\right)$sinc$\left(2f_M\left(t - \frac{n}{2f_M}\right)\right)$
        """)