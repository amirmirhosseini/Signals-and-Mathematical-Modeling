from manim import *  

class SineWave(Scene):  
    def construct(self):  
        self.camera.background_color = "#080E26"

        # پارامترها  
        Fs = 2000  # فرکانس نمونه‌برداری به هرتز  
        f = 1750  # فرکانس موج سینوسی به هرتز  
        t_end = 0.01  # زمان پایان به ثانیه  
        t_res = 1 / (100 * f)  # گام زمانی با دقت بالا برای سیگنال پیوسته  

        # بردارهای زمانی  
        t_continuous = np.arange(0, t_end, t_res)  # زمان برای سیگنال پیوسته  
        t_sampled = np.arange(0, t_end, 1 / Fs)  # زمان برای نمونه‌برداری  

        # سیگنال‌ها  
        y_continuous = np.sin(2 * np.pi * f * t_continuous)  # موج سینوسی پیوسته  
        y_sampled = np.sin(2 * np.pi * f * t_sampled)  # موج سینوسی نمونه‌برداری شده  

        # ایجاد محور مختصات  
        axes = Axes(  
            x_range=[0, t_end, 0.001],  # محدوده محور x  
            y_range=[-1.5, 1.5, 0.5],  # محدوده محور y  
            axis_config={"color": "#40E0D0"},  
        )  

        # ایجاد منحنی موج سینوسی پیوسته  
        sine_wave_curve = axes.plot(lambda x: np.sin(2 * np.pi * f * x), color=WHITE)  

        # ایجاد نقاط نمونه‌برداری به عنوان نقطه‌ها  
        sampled_points = VGroup(*[  
            Dot(color=RED).move_to(axes.c2p(t, y)) for t, y in zip(t_sampled, y_sampled)  
        ])  

        # ایجاد برچسب‌ها  
        continuous_label = MathTex("7000 \\text{ Hz Sine Wave Sampled at 8000 Hz}").to_edge(UP)  
        sampled_label = Tex("Sampled Points").to_edge(DOWN)  
        sampled_lines = VGroup()  
        for ts, ys in zip(t_sampled, y_sampled):  
            line = Line(  
                start=axes.c2p(ts, 0),  # Start at y=0 on the x-axis  
                end=axes.c2p(ts, ys),   # End at the sampled point  
                color=RED,  
                stroke_width=3,  
            )  
            sampled_lines.add(line)  
        xlabel = MathTex("Time (s)").scale(0.5)
        ylabel = MathTex("Amplitude").scale(0.7)
        ylabel.move_to((LEFT)* 6.2 + UP *3.5)
        xlabel.move_to(RIGHT * 6.2 + DOWN * 0.5)


        # Add elements to the scene  
        # اولین نمایش  
        self.play(Create(axes), Write(continuous_label))  
        self.play( Write(xlabel), Write(ylabel))
        self.play(Create(sine_wave_curve), run_time=2)  
        self.play(Create(sampled_points),Create(sampled_lines), run_time=2)  
        self.wait(1)  
        sampled_lines2 = Line(start=axes.c2p(t_sampled[0], y_sampled[0]), end=axes.c2p(t_sampled[0], y_sampled[0]), color=RED)  

        for i in range(len(t_sampled) - 1):  
            line = Line(  
                start=axes.c2p(t_sampled[i], y_sampled[i]),  
                end=axes.c2p(t_sampled[i + 1], y_sampled[i + 1]),  
                color=RED  
            )  
            sampled_lines2.add(line)  
        # محو کردن عناصر اولیه  
        self.play(FadeOut(sampled_lines))
        self.play(Create(sampled_lines2), run_time=2)  

        self.play(Write(sampled_label))  
        self.wait(1)  

if __name__ == "__main__":  
    from manim import config, scene, camera  
    config.media_width = "75%"  
    scene = SineWave()  
    camera = scene.camera  
    scene.render()