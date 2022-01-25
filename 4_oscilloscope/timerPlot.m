function timerPlot(obj, event, OscType, pin, timeRes, handles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global a
global i
global t
global v
global tim

try
    switch(OscType)
        case 'analog'
            voltage = readVoltage(a,pin);
        case 'digital'
            voltage = readDigitalPin(a,pin)*5;
    end
        if i <= length(t)
            v(i) = voltage;
            plot(handles.axes1, t(1:i), v(1:i))
            i = i + 1;

        else
            t = [t(2:end) t(end)+timeRes];
            v = [v(2:end) voltage];
            plot(handles.axes1, t,v);
        end
        xlim(handles.axes1,[t(1) t(end)])
        ylim(handles.axes1,[0 5])
        xlabel(handles.axes1, 'time (s)')
        ylabel(handles.axes1, 'voltage (V)')
catch
    set(handles.err, 'Visible', 'on')
    set(handles.OscType, 'Visible', 'off')
    set(handles.startBtn, 'Visible', 'off')
    set(handles.stopBtn, 'Visible', 'off')
    set(handles.axes1, 'Visible', 'on')
    set(handles.pins, 'Visible', 'off')

    stop(tim)
    delete(tim);

end
end

