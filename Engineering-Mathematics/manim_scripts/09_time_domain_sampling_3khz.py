from manim import *  

class SineWaveScene(Scene):  
    def construct(self):  
        # Parameters  
        Fs = 8000  # Sampling frequency in Hz  
        f = 3000   # Sine wave frequency in Hz  
        t_end = 0.005  # End time in seconds  
        t_res = 1 / (100 * f)  # High-resolution time step for continuous signal  
        self.camera.background_color = "#080E26"

        # Time vectors  
        t_continuous = np.arange(0, t_end, t_res)  # Time for continuous signal  
        t_sampled = np.arange(0, t_end, 1 / Fs)  # Time points for sampling  

        # Signals  
        y_continuous = np.sin(2 * np.pi * f * t_continuous)  # Continuous sine wave  
        y_sampled = np.sin(2 * np.pi * f * t_sampled)  # Sampled sine wave  

        # Create the axes  
        axes = Axes(  
            x_range=[0, t_end, 0.0005],  
            y_range=[-1.5, 1.5, 0.5],  
            axis_config={"color": WHITE},  
        )  

        # Create continuous sine wave  
        continuous_wave = axes.plot(lambda x: np.sin(2 * np.pi * f * x), color=BLUE, stroke_width=2)  

        # Create sampled points with red dots and connecting lines  
        sampled_dots = VGroup(  
            *[Dot(point=axes.c2p(ts, ys), color=RED) for ts, ys in zip(t_sampled, y_sampled)]  
        )  

        # Create lines connecting sampled points to the horizontal axis (y=0)  
        sampled_lines = VGroup()  
        for ts, ys in zip(t_sampled, y_sampled):  
            line = Line(  
                start=axes.c2p(ts, 0),  # Start at y=0 on the x-axis  
                end=axes.c2p(ts, ys),   # End at the sampled point  
                color=RED,  
                stroke_width=1,  
            )  
            sampled_lines.add(line)  

        # Title and labels  
        title = MathTex("3000 \\text{ Hz Sine Wave and Sampled Points}").scale(0.7).to_edge(UP)  
        xlabel = MathTex("Time (s)").scale(0.7)
        ylabel = MathTex("Amplitude").scale(0.7)
        ylabel.move_to((LEFT)* 6.2 + UP *3.5)
        #xlabel.move_to(UP * 3.2)
        xlabel.move_to(RIGHT * 5.8 + DOWN * 0.5)


        # Add elements to the scene  
        self.play(Create(axes), Write(title), Write(xlabel), Write(ylabel))  
        self.play(Create(continuous_wave))  
        self.play(Create(sampled_lines), Create(sampled_dots))  
        self.wait(2)  
        self.play(FadeOut(sampled_dots), FadeOut(sampled_lines))  
        sampled_dots2 = VGroup(  
            *[Dot(point=axes.c2p(ts, ys), color=RED) for ts, ys in zip(t_sampled, y_sampled)]  
        )  

        # Create lines connecting sampled points  
        sampled_lines2 = Line(start=axes.c2p(t_sampled[0], y_sampled[0]), end=axes.c2p(t_sampled[0], y_sampled[0]), color=RED)  

        for i in range(len(t_sampled) - 1):  
            line = Line(  
                start=axes.c2p(t_sampled[i], y_sampled[i]),  
                end=axes.c2p(t_sampled[i + 1], y_sampled[i + 1]),  
                color=RED  
            )  
            sampled_lines2.add(line)  
        self.play(Create(sampled_lines2), Create(sampled_dots2))  
        self.wait(2)  
        # Create a new scene for the sampled wave connected  
        self.clear()  

        # Create new axes for the next plot  

        # Create sampled wave with connected points  

        # Create lines connecting the sampled points on second plot  

# To run this code, save it in a file named `sine_wave.py` and run with:  
# manim -pql sine_wave.py SineWaveScene