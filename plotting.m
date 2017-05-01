function plotting( y, Fs, color, handles)
    axes(handles.axes1);
    hold on;
    N = length(y);
    t = linspace(0, N/Fs, N);
    plot(t, y, color)
    hold off;
end