from manim import *

class ShannonNyquistEquation(Scene):
    def construct(self):
        # Set the background color
        self.camera.background_color = "#080E26"

        # Define the equation using MathTex with dollar sign syntax
        summary_eng = Tex(r"The samples we take from the signal in the form of:")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.6)
        summary_eng.move_to(UP * 3.2)

        equation = Tex(r"""
    $x_{sampled}(t) = \sum_{n=-\infty}^{\infty} x\left(\frac{n}{2f_M}\right) \delta\left(t - \frac{n}{2f_M}\right)
$ 
""")
        equation.set_color(WHITE)
        equation.scale(0.8)
        equation.move_to(UP*2)



        txt = Tex(r"""
    storing the samples, taking Fourier transform: showing that it is $\tilde{X}(f)$. the rest of the proof will be like the previous one 
""")
        txt.set_color(WHITE)
        txt.scale(0.6)
        txt.move_to(UP*0.5)

        self.play(
            Write(summary_eng),
            run_time=2,
            rate_func=smooth
        )
        self.wait(0.6)

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

        # Pause the animation for 2 seconds
        self.wait(2)

        equation = Tex(r"""
       $x(t) = \sum_{n=-\infty}^{\infty}$
        $\left(\frac{n}{2f_M}\right)$sinc$\left(2f_M\left(t - \frac{n}{2f_M}\right)\right)$
        """)