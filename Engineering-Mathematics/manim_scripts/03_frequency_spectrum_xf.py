from manim import *  
import numpy as np  

class FourierTransform(Scene):  
    def construct(self):  
        # Define parameters  
        fM = 2  
        fs = 4  
        self.camera.background_color = "#080E26"
        # Create the axes for X(f)  
        axes1 = Axes(  
            x_range=[-8, 8, 2],  
            y_range=[-1, 5, 1],  
            axis_config={"color": WHITE},  
        )  

        # Create and plot X(f)  
        graph1 = axes1.plot(lambda x: -x**2 + 4, x_range=[-fM, fM], color=ORANGE)  
        label_X_f = MathTex("X(f)").next_to(axes1, UP)  

        self.play(Create(axes1), Write(label_X_f))  
        self.play(Create(graph1), run_time=3)  
        self.wait(2)  

        # Fade out axes and graph after showing X(f)  
        self.play(FadeOut(axes1), FadeOut(graph1), FadeOut(label_X_f))  

        # Create the periodic function of X(f)  
        x2 = np.arange(-fM, fM, 0.01)  
        
        # Create second set of axes for periodic X(f)  
        axes2 = Axes(  
            x_range=[-1, 9, 2],  
            y_range=[-1, 5, 1],  
            axis_config={"color": BLUE},  
        )  

        # Create labels and other elements to be displayed later  
        label_periodic = MathTex("Periodic \\ X(f)").next_to(axes2, UP)  

        # Create the signals  
        frequency1 = 1  # Lower frequency  
        frequency2 = 1.5  # Slightly higher frequency  

        # Create axes for the interference  

        # Create the signals  

        # Show signals  
       # Show the combined signal  

        # Now display the periodic X(f)  
        self.play(Create(axes2), Write(label_periodic))  

        for i in range(0, 2 * fs + 1, fs):  
            graph_periodic = axes2.plot(lambda x: -((x - i) ** 2) + 4, x_range=[i - 2, i + 2], color=ORANGE)  
            self.play(Create(graph_periodic), run_time=2)  
            self.wait(0.2)  

        # Mark fM and fs on the plot  
        dot_fM = Dot(axes2.c2p(fM, 0), color=RED)  
        dot_fs = Dot(axes2.c2p(fs, 0), color=RED)  
        
        self.play(Create(dot_fM), run_time=0.5)  
        self.play(Create(dot_fs), run_time=0.5)  
        
        # Write labels for fM and fs  
        label_fM = MathTex("f_M").next_to(dot_fM, UP)  
        label_fs = MathTex("f_s").next_to(dot_fs, UP)  
        self.play(Write(label_fM), run_time=0.5)  
        self.play(Write(label_fs), run_time=0.5)  

        # Final wait  
        self.wait(2)  

# To run this code you would typically execute:  
# manim -pql fourier_transform.py FourierTransform