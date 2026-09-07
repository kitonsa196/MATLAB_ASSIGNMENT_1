
clc;

clear;

close all;



%                  IMPORT STUDENT DATA


Students = readtable("D:\AST_DANCE\MATLAB_STUDENTS.xlsx", ...
    "VariableNamingRule", "preserve");

disp(Students);

writetable(Students, "Group_5.xlsx");



%                  EXTRACT VARIABLES


GPA = Students.GPA;

AGE = Students.AGE;

YEAR = Students.YEAR;

STUDY_HOURS = Students.("STUDY_HOURS(per day)");

SLEEP_HOURS = Students.SLEEP_HOURS;

EXAM_SCORE = Students.EXAM_SCORE;

ATTENDANCE = Students.ATTENDANCE;

FRIENDS_COUNT = Students.FRIENDS_COUNT;

student_number = 1:height(Students);



%                  1. GPA BAR GRAPH


figure;

bar(student_number, GPA);

title("GPA OF STUDENTS");

xlabel("Student");

ylabel("GPA");

grid on;



%                  2. AGE BAR GRAPH


figure;

bar(student_number, AGE);

title("AGE OF STUDENTS");

xlabel("Student");

ylabel("Age");

grid on;

saveas(gcf, "GROUP_5.png");



%                  3. LINE PLOT


figure;

plot(student_number, EXAM_SCORE, "-o");

title("EXAM SCORE OF STUDENTS");

xlabel("Student");

ylabel("Exam Score");

grid on;



%                  4. SINE GRAPH


x = 0:0.01:2*pi;

y = sin(x);

figure;

plot(x, y, "LineWidth", 2);

title("SINE WAVE");

xlabel("Angle (radians)");

ylabel("sin(x)");

grid on;



%                  5. STEM PLOT


figure;

stem(student_number, FRIENDS_COUNT);

title("STEM PLOT OF FRIENDS COUNT");

xlabel("Student");

ylabel("Number of Friends");

grid on;



%                  6. STEP PLOT


figure;

stairs(student_number, STUDY_HOURS, "LineWidth", 2);

title("STEP PLOT OF STUDY HOURS");

xlabel("Student");

ylabel("Study Hours per Day");

grid on;



%                  7. ERROR BAR PLOT


mean_exam = mean(EXAM_SCORE);

std_exam = std(EXAM_SCORE);

figure;

errorbar(1, mean_exam, std_exam, "o", "LineWidth", 2);

title("MEAN EXAM SCORE WITH STANDARD DEVIATION");

xlabel("Exam Score");

ylabel("Mean Exam Score");

xlim([0 2]);

grid on;



%                  8. AREA PLOT


figure;

area(student_number, ATTENDANCE);

title("AREA PLOT OF STUDENT ATTENDANCE");

xlabel("Student");

ylabel("Attendance (%)");

grid on;



%                  9. PARETO CHART


% Calculate average exam score by hostel

hostel = categorical(Students.HOSTEL);

hostel_names = categories(hostel);

hostel_exam_average = zeros(length(hostel_names), 1);

for i = 1:length(hostel_names)

    group = hostel == hostel_names{i};

    hostel_exam_average(i) = mean(EXAM_SCORE(group));

end


figure;

pareto(hostel_exam_average);

title("PARETO CHART OF AVERAGE EXAM SCORE BY HOSTEL");

xlabel("Hostel");

ylabel("Average Exam Score");

grid on;



%                  10. BOX PLOT


figure;

boxplot(EXAM_SCORE);

title("BOX PLOT OF EXAM SCORES");

ylabel("Exam Score");

grid on;



%                  11. PIE CHART
%                  RELIGION


religion = categorical(Students.RELIGION);

religion_names = categories(religion);

religion_counts = zeros(length(religion_names), 1);

for i = 1:length(religion_names)

    religion_counts(i) = sum(religion == religion_names{i});

end


figure;

pie(religion_counts);

title("DISTRIBUTION OF STUDENTS BY RELIGION");



%                  12. PIE CHART WITH PERCENTAGE LABELS


figure;

p = pie(religion_counts);

title("RELIGION DISTRIBUTION WITH PERCENTAGE LABELS");

percentages = 100 * religion_counts / sum(religion_counts);

% Find text objects created by pie

text_objects = findobj(p, "Type", "Text");

for i = 1:length(text_objects)

    if i <= length(percentages)

        text_objects(i).String = sprintf("%.1f%%", percentages(i));

    end

end



%                  13. HISTOGRAM
%                  GPA


figure;

histogram(GPA);

title("HISTOGRAM OF GPA");

xlabel("GPA");

ylabel("Frequency");

grid on;



%                  14. HISTOGRAM
%                  EXAM SCORE

figure;

histogram(EXAM_SCORE);

title("HISTOGRAM OF EXAM SCORES");

xlabel("Exam Score");

ylabel("Frequency");

grid on;



%                  15. LOGARITHMIC PLOT


figure;

semilogy(student_number, EXAM_SCORE, "-o");

title("LOGARITHMIC PLOT OF EXAM SCORES");

xlabel("Student");

ylabel("Exam Score (Log Scale)");

grid on;



%                  16. LOG-LOG PLOT


figure;

loglog(STUDY_HOURS, EXAM_SCORE, "o");

title("LOG-LOG PLOT OF STUDY HOURS VS EXAM SCORE");

xlabel("Study Hours per Day (Log Scale)");

ylabel("Exam Score (Log Scale)");

grid on;



%                  17. SCATTER PLOT
%                  GPA VS STUDY HOURS


figure;

scatter(STUDY_HOURS, GPA, 60, "filled");

title("SCATTER PLOT: GPA VS STUDY HOURS");

xlabel("Study Hours per Day");

ylabel("GPA");

grid on;



%                  18. SCATTER PLOT
%                  ATTENDANCE VS EXAM SCORE


figure;

scatter(ATTENDANCE, EXAM_SCORE, 60, "filled");

title("SCATTER PLOT: ATTENDANCE VS EXAM SCORE");

xlabel("Attendance (%)");

ylabel("Exam Score");

grid on;



%                  19. HORIZONTAL BAR GRAPH


figure;

barh(EXAM_SCORE);

title("HORIZONTAL BAR GRAPH OF EXAM SCORES");

xlabel("Exam Score");

ylabel("Student");

grid on;



%                  20. POLAR PLOT


theta = linspace(0, 2*pi, length(GPA));

figure;

polarplot(theta, GPA, "-o");

title("POLAR PLOT OF GPA");



%                  21. FRIENDS COUNT LINE GRAPH


figure;

plot(student_number, FRIENDS_COUNT, "-s", "LineWidth", 1.5);

title("NUMBER OF FRIENDS PER STUDENT");

xlabel("Student");

ylabel("Friends Count");

grid on;



%                  22. SLEEP HOURS LINE GRAPH

figure;

plot(student_number, SLEEP_HOURS, "-o", "LineWidth", 1.5);

title("SLEEP HOURS OF STUDENTS");

xlabel("Student");

ylabel("Sleep Hours");

grid on;



%                  23. GPA VS AGE


figure;

scatter(AGE, GPA, 60, "filled");

title("GPA VS AGE");

xlabel("Age");

ylabel("GPA");

grid on;



%                  24. GPA VS ATTENDANCE


figure;

scatter(ATTENDANCE, GPA, 60, "filled");

title("GPA VS ATTENDANCE");

xlabel("Attendance (%)");

ylabel("GPA");

grid on;



%                  25. GPA VS SLEEP HOURS


figure;

scatter(SLEEP_HOURS, GPA, 60, "filled");

title("GPA VS SLEEP HOURS");

xlabel("Sleep Hours");

ylabel("GPA");

grid on;



%                  26. STUDY HOURS VS EXAM SCORE


figure;

scatter(STUDY_HOURS, EXAM_SCORE, 60, "filled");

title("STUDY HOURS VS EXAM SCORE");

xlabel("Study Hours per Day");

ylabel("Exam Score");

grid on;



%                  27. TREND LINE
%                  STUDY HOURS VS EXAM SCORE


figure;

scatter(STUDY_HOURS, EXAM_SCORE, 60, "filled");

hold on;

p = polyfit(STUDY_HOURS, EXAM_SCORE, 1);

x_line = linspace(min(STUDY_HOURS), ...
                  max(STUDY_HOURS), 100);

y_line = polyval(p, x_line);

plot(x_line, y_line, "LineWidth", 2);

title("STUDY HOURS VS EXAM SCORE WITH TREND LINE");

xlabel("Study Hours per Day");

ylabel("Exam Score");

legend("Students", "Trend Line");

grid on;

hold off;



%                  28. ATTENDANCE VS GPA
%                  TREND LINE


figure;

scatter(ATTENDANCE, GPA, 60, "filled");

hold on;

p = polyfit(ATTENDANCE, GPA, 1);

x_line = linspace(min(ATTENDANCE), ...
                  max(ATTENDANCE), 100);

y_line = polyval(p, x_line);

plot(x_line, y_line, "LineWidth", 2);

title("ATTENDANCE VS GPA WITH TREND LINE");

xlabel("Attendance (%)");

ylabel("GPA");

legend("Students", "Trend Line");

grid on;

hold off;



%                  29. CORRELATION HEATMAP


data = [
    GPA ...
    AGE ...
    STUDY_HOURS ...
    SLEEP_HOURS ...
    EXAM_SCORE ...
    ATTENDANCE ...
    FRIENDS_COUNT
];

correlation_matrix = corrcoef(data);

figure;

imagesc(correlation_matrix);

colorbar;

title("CORRELATION MATRIX");

xticks(1:7);

yticks(1:7);

xticklabels({
    "GPA"
    "Age"
    "Study Hours"
    "Sleep Hours"
    "Exam Score"
    "Attendance"
    "Friends Count"
});

yticklabels({
    "GPA"
    "Age"
    "Study Hours"
    "Sleep Hours"
    "Exam Score"
    "Attendance"
    "Friends Count"
});

xtickangle(45);

axis square;



%                  30. SLEEP HOURS VS EXAM SCORE


figure;

scatter(SLEEP_HOURS, EXAM_SCORE, 60, "filled");

title("SLEEP HOURS VS EXAM SCORE");

xlabel("Sleep Hours");

ylabel("Exam Score");

grid on;



%                  31. FRIENDS VS GPA


figure;

scatter(FRIENDS_COUNT, GPA, 60, "filled");

title("NUMBER OF FRIENDS VS GPA");

xlabel("Friends Count");

ylabel("GPA");

grid on;



%                  32. AGE VS EXAM SCORE


figure;

scatter(AGE, EXAM_SCORE, 60, "filled");

title("AGE VS EXAM SCORE");

xlabel("Age");

ylabel("Exam Score");

grid on;



%                  33. AVERAGE GPA BY HOSTEL

average_gpa_hostel = zeros(length(hostel_names),1);

for i = 1:length(hostel_names)

    group = hostel == hostel_names{i};

    average_gpa_hostel(i) = mean(GPA(group));

end


figure;

bar(average_gpa_hostel);

title("AVERAGE GPA BY HOSTEL");

xlabel("Hostel");

ylabel("Average GPA");

xticks(1:length(hostel_names));

xticklabels(hostel_names);

xtickangle(45);

grid on;



%                  34. AVERAGE EXAM SCORE BY RELIGION


average_exam_religion = zeros(length(religion_names),1);

for i = 1:length(religion_names)

    group = religion == religion_names{i};

    average_exam_religion(i) = mean(EXAM_SCORE(group));

end


figure;

bar(average_exam_religion);

title("AVERAGE EXAM SCORE BY RELIGION");

xlabel("Religion");

ylabel("Average Exam Score");

xticks(1:length(religion_names));

xticklabels(religion_names);

xtickangle(45);

grid on;


