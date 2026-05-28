from manim import *


class PeriodicXf(Scene):
    def construct(self):
        self.camera.background_color = "#080E26"
        summary_eng = Tex(r"To ensure proper separation, a low-pass filter is used. However, if sampling at exactly $2f_M$, practical non-ideal filters may cause aliasing. To avoid this, it's better to choose a slightly higher sampling rate.")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.8)
        summary_eng.move_to(ORIGIN)
        self.play(
            Write(summary_eng),
            run_time=8,
            rate_func=smooth
        )
        self.wait(1.5)
        self.play(
            FadeOut(summary_eng),
            run_time=4,
            rate_func=smooth
        )