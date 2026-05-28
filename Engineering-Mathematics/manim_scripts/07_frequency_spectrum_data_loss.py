from manim import *

class PlotXf(Scene):
    def construct(self):
        self.camera.background_color = "#080E26"

        # Axes setup for X(f)
        axes = Axes(
            x_range=[-8, 8, 1],
            y_range=[-1, 5, 1],
            x_length=10,
            y_length=6,
            axis_config={"color": WHITE},
        ).add_coordinates()
        labels = axes.get_axis_labels(x_label="f", y_label="X(f)")

        # Define the function X(f)
        fM = 2
        X_f = lambda t: -t**2 + 4 if abs(t) <= fM else 0

        # Graph of X(f)
        graph = axes.plot(
            X_f,
            x_range=[-8, 8],
            color=BLUE,
        )

        # Animate the plot
        self.play(Create(axes), Write(labels))
        self.play(Create(graph), run_time=3)
        self.wait()

class PeriodicXf(Scene):
    def construct(self):
        self.camera.background_color = "#080E26"
        summary_eng = Tex(r"As observed, interference may occur at low sampling rates, making $X(f)$ inaccurate. To prevent this, the sampling rate must be properly chosen. $f_s - f_M \geq f_M \implies f_s \geq 2f_M$")
        summary_eng.set_color(WHITE)
        summary_eng.scale(0.8)
        summary_eng.move_to(ORIGIN)

        # Axes setup for periodic X(f)
        axes = Axes(
            x_range=[-8, 8, 1],
            y_range=[-1, 5, 1],
            x_length=10,
            y_length=6,
            axis_config={"color": WHITE},
        ).add_coordinates()
        labels = axes.get_axis_labels(x_label="f", y_label="X(f)")

        # Define periodic function of X(f)
        fM = 2
        fs = 5
        X_one_period = lambda t: -t**2 + 4 if abs(t) <= fM else 0

        # Create one period of X(f)
        single_period = axes.plot(
            X_one_period,
            x_range=[-fM, fM],
            color=RED,
        )

        # Animate one period
        self.play(
            Write(summary_eng),
            run_time=4,
            rate_func=smooth
        )
        self.wait(1.5)
        self.play(
            FadeOut(summary_eng),
            run_time=4,
            rate_func=smooth
        )

        self.play(Create(axes), Write(labels))
        self.play(Create(single_period), run_time=2)
        self.wait()

        # Plot periodic extensions

        # Plot periodic extensions
        for i in range(-2, 3):  # Extend over multiple intervals
            if i == 0: continue
            periodic_graph = axes.plot(
                lambda t: X_one_period(t - i * fs),
                x_range=[-fM + i * fs, fM + i * fs],
                color=BLUE,
            )
            self.play(Create(periodic_graph), run_time=1)
        
        # Mark and label fs and fM
        fM_dot = Dot(axes.c2p(fM, 0), color=RED)
        fs_dot = Dot(axes.c2p(fs, 0), color=RED)
        fM_label = MathTex("f_M").next_to(fM_dot, DOWN)
        fs_label = MathTex("f_s").next_to(fs_dot, DOWN)

        self.play(FadeIn(fM_dot), Write(fM_label))
        self.play(FadeIn(fs_dot), Write(fs_label))
        self.wait()


class Periodic2Xf(Scene):
    def construct(self):
        self.camera.background_color = "#080E26"

        # Axes setup for periodic X(f)
        axes = Axes(
            x_range=[-8, 8, 1],
            y_range=[-1, 5, 1],
            x_length=10,
            y_length=6,
            axis_config={"color": WHITE},
        ).add_coordinates()
        labels = axes.get_axis_labels(x_label="f", y_label="X(f)")

        # Define periodic function of X(f)
        fM = 2
        fs = 3
        X_one_period = lambda t: -t**2 + 4 if abs(t) <= fM else 0

        # Create one period of X(f)
        single_period = axes.plot(
            X_one_period,
            x_range=[-fM, fM],
            color=RED,
        )

        # Animate one period
        self.play(Create(axes), Write(labels))
        self.play(Create(single_period), run_time=2)
        self.wait()

        # Plot periodic extensions

        # Plot periodic extensions
        for i in range(-2, 3):  # Extend over multiple intervals
            if i == 0: continue
            periodic_graph = axes.plot(
                lambda t: X_one_period(t - i * fs),
                x_range=[-fM + i * fs, fM + i * fs],
                color=BLUE,
            )
            self.play(Create(periodic_graph), run_time=1)
        
        # Mark and label fs and fM
        fM_dot = Dot(axes.c2p(fM, 0), color=RED)
        fs_dot = Dot(axes.c2p(fs, 0), color=RED)
        fM_label = MathTex("f_M").next_to(fM_dot, DOWN)
        fs_label = MathTex("f_s").next_to(fs_dot, DOWN)

        self.play(FadeIn(fM_dot), Write(fM_label))
        self.play(FadeIn(fs_dot), Write(fs_label))
        self.wait()
