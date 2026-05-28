from manim import *

class DrawWaveWithArrows(Scene):
    def construct(self):
        self.camera.background_color = "#080E26"

        # Axes setup
        axes = Axes(
            x_range=[0, 10, 1],
            y_range=[-1, 4, 1],
            x_length=10,
            y_length=6,
            axis_config={"color": WHITE},
        ).add_coordinates()
        labels = axes.get_axis_labels(x_label="t", y_label="f(t)")

        # Wave function
        wave_function = axes.plot(
            lambda x: 3 * np.sin(0.5 * x) + 1,
            x_range=[0, 10],
            color=GRAY,
        )

        # Create the arrows
        arrow_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]  # x-positions of the arrows
        arrows = VGroup()
        for x in arrow_positions:
            arrow = Arrow(
                start=axes.c2p(x, 0),
                end=axes.c2p(x, 3 * np.sin(0.5 * x) + 1),
                color=RED,
                buff=0,
            )
            arrows.add(arrow)

        # Dashed lines
        dashed_lines = VGroup()
        for x in arrow_positions:
            dashed_line = DashedLine(
                start=axes.c2p(x, 0),
                end=axes.c2p(x, 3 * np.sin(0.5 * x) + 1),
                color=WHITE,
                dash_length=0.1,
            )
            dashed_lines.add(dashed_line)

        # Animations
        self.play(Create(axes), Write(labels))
        self.play(Create(wave_function), run_time=2)
        self.play(Create(dashed_lines), run_time=2)

        # Add arrows one by one
        for arrow in arrows:
            self.play(GrowArrow(arrow), run_time=0.5)

        self.wait()
