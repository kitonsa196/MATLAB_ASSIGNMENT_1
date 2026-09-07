
clc;
clear;
close all;


%% ============================================================
%                 IMPORT STUDENT DATA
% =============================================================

Students = readtable("MATLAB_STUDENTS.xlsx", ...
    "VariableNamingRule", "preserve");

disp(Students);

writetable(Students, "Group_5.xlsx");


%% ============================================================
%                 CREATE PLOTS FOLDER
% =============================================================

if ~exist("plots", "dir")
    mkdir("plots");
end


%% ============================================================
%                 EXTRACT VARIABLES
% =============================================================

GPA = Students.GPA;

AGE = Students.AGE;

YEAR = Students.YEAR;

STUDY_HOURS = Students.("STUDY_HOURS(per day)");

SLEEP_HOURS = Students.SLEEP_HOURS;

EXAM_SCORE = Students.EXAM_SCORE;

ATTENDANCE = Students.ATTENDANCE;

FRIENDS_COUNT = Students.FRIENDS_COUNT;

student_number = 1:height(Students);


%% ============================================================
%                 PLOT 1 - LINE PLOT
% =============================================================

figure;

plot(student_number, GPA, "-o");

title("GPA of Students");

xlabel("Student");

ylabel("GPA");

grid on;

saveas(gcf, "plots/01_GPA_Line.png");


%% ============================================================
%                 PLOT 2 - BAR GRAPH
% =============================================================

figure;

bar(GPA);

title("GPA of Students");

xlabel("Student");

ylabel("GPA");

grid on;

saveas(gcf, "plots/02_GPA_Bar.png");


%% ============================================================
%                 PLOT 3 - HORIZONTAL BAR GRAPH
% =============================================================

figure;

barh(EXAM_SCORE);

title("Exam Scores of Students");

xlabel("Exam Score");

ylabel("Student");

grid on;

saveas(gcf, "plots/03_ExamScore_HorizontalBar.png");


%% ============================================================
%                 PLOT 4 - STEM PLOT
% =============================================================

figure;

stem(student_number, AGE);

title("Age of Students");

xlabel("Student");

ylabel("Age");

grid on;

saveas(gcf, "plots/04_Age_Stem.png");


%% ============================================================
%                 PLOT 5 - STEP / STAIRS PLOT
% =============================================================

figure;

stairs(student_number, STUDY_HOURS);

title("Study Hours per Day");

xlabel("Student");

ylabel("Study Hours");

grid on;

saveas(gcf, "plots/05_StudyHours_Stairs.png");


%% ============================================================
%                 PLOT 6 - AREA PLOT
% =============================================================

figure;

area(student_number, ATTENDANCE);

title("Attendance of Students");

xlabel("Student");

ylabel("Attendance (%)");

grid on;

saveas(gcf, "plots/06_Attendance_Area.png");


%% ============================================================
%                 PLOT 7 - SCATTER PLOT
% =============================================================

figure;

scatter(AGE, GPA, 60, "filled");

title("GPA vs Age");

xlabel("Age");

ylabel("GPA");

grid on;

saveas(gcf, "plots/07_GPA_vs_Age_Scatter.png");


%% ============================================================
%                 PLOT 8 - SCATTER PLOT
% =============================================================

figure;

scatter(STUDY_HOURS, GPA, 60, "filled");

title("GPA vs Study Hours");

xlabel("Study Hours per Day");

ylabel("GPA");

grid on;

saveas(gcf, "plots/08_GPA_vs_StudyHours.png");


%% ============================================================
%                 PLOT 9 - SCATTER PLOT
% =============================================================

figure;

scatter(ATTENDANCE, EXAM_SCORE, 60, "filled");

title("Attendance vs Exam Score");

xlabel("Attendance (%)");

ylabel("Exam Score");

grid on;

saveas(gcf, "plots/09_Attendance_vs_Exam.png");


%% ============================================================
%                 PLOT 10 - HISTOGRAM
% =============================================================

figure;

histogram(GPA);

title("Distribution of GPA");

xlabel("GPA");

ylabel("Frequency");

grid on;

saveas(gcf, "plots/10_GPA_Histogram.png");


%% ============================================================
%                 PLOT 11 - HISTOGRAM
% =============================================================

figure;

histogram(EXAM_SCORE);

title("Distribution of Exam Scores");

xlabel("Exam Score");

ylabel("Frequency");

grid on;

saveas(gcf, "plots/11_ExamScore_Histogram.png");


%% ============================================================
%                 PLOT 12 - HISTOGRAM
% =============================================================

figure;

histogram(STUDY_HOURS);

title("Distribution of Study Hours");

xlabel("Study Hours per Day");

ylabel("Frequency");

grid on;

saveas(gcf, "plots/12_StudyHours_Histogram.png");


%% ============================================================
%                 PLOT 13 - BOXPLOT
% =============================================================

figure;

boxplot(GPA);

title("Boxplot of GPA");

ylabel("GPA");

grid on;

saveas(gcf, "plots/13_GPA_Boxplot.png");


%% ============================================================
%                 PLOT 14 - BOXPLOT
% =============================================================

figure;

boxplot(EXAM_SCORE);

title("Boxplot of Exam Scores");

ylabel("Exam Score");

grid on;

saveas(gcf, "plots/14_ExamScore_Boxplot.png");


%% ============================================================
%                 PLOT 15 - BOXPLOT
% =============================================================

figure;

boxplot(ATTENDANCE);

title("Boxplot of Attendance");

ylabel("Attendance (%)");

grid on;

saveas(gcf, "plots/15_Attendance_Boxplot.png");


%% ============================================================
%                 PLOT 16 - ERROR BAR
% =============================================================

figure;

mean_gpa = mean(GPA);

std_gpa = std(GPA);

errorbar(1, mean_gpa, std_gpa, "o");

title("Mean GPA with Standard Deviation");

xlabel("Group");

ylabel("GPA");

xlim([0 2]);

grid on;

saveas(gcf, "plots/16_GPA_ErrorBar.png");


%% ============================================================
%                 PLOT 17 - ERROR BAR
% =============================================================

figure;

mean_exam = mean(EXAM_SCORE);

std_exam = std(EXAM_SCORE);

errorbar(1, mean_exam, std_exam, "o");

title("Mean Exam Score with Standard Deviation");

xlabel("Group");

ylabel("Exam Score");

xlim([0 2]);

grid on;

saveas(gcf, "plots/17_ExamScore_ErrorBar.png");


%% ============================================================
%                 PLOT 18 - PIE CHART
% =============================================================

religion = categorical(Students.RELIGION);

religion_names = categories(religion);

religion_counts = zeros(length(religion_names),1);

for i = 1:length(religion_names)

    religion_counts(i) = sum(religion == religion_names{i});

end

figure;

pie(religion_counts);

title("Distribution of Students by Religion");

saveas(gcf, "plots/18_Religion_Pie.png");


%% ============================================================
%                 PLOT 19 - PIE CHART
% =============================================================

hostel = categorical(Students.HOSTEL);

hostel_names = categories(hostel);

hostel_counts = zeros(length(hostel_names),1);

for i = 1:length(hostel_names)

    hostel_counts(i) = sum(hostel == hostel_names{i});

end

figure;

pie(hostel_counts);

title("Distribution of Students by Hostel");

saveas(gcf, "plots/19_Hostel_Pie.png");


%% ============================================================
%                 PLOT 20 - POLAR PLOT
% =============================================================

theta = linspace(0, 2*pi, length(GPA));

figure;

polarplot(theta, GPA);

title("Polar Plot of GPA");

saveas(gcf, "plots/20_GPA_Polar.png");


%% ============================================================
%                 PLOT 21 - POLAR PLOT
% =============================================================

theta2 = linspace(0, 2*pi, length(EXAM_SCORE));

figure;

polarplot(theta2, EXAM_SCORE);

title("Polar Plot of Exam Scores");

saveas(gcf, "plots/21_ExamScore_Polar.png");


%% ============================================================
%                 PLOT 22 - AREA PLOT
% =============================================================

figure;

area(student_number, STUDY_HOURS);

title("Study Hours per Day");

xlabel("Student");

ylabel("Study Hours");

grid on;

saveas(gcf, "plots/22_StudyHours_Area.png");


%% ============================================================
%                 PLOT 23 - LINE PLOT
% =============================================================

figure;

plot(student_number, EXAM_SCORE, "-s");

title("Exam Score of Students");

xlabel("Student");

ylabel("Exam Score");

grid on;

saveas(gcf, "plots/23_ExamScore_Line.png");


%% ============================================================
%                 PLOT 24 - LINE PLOT
% =============================================================

figure;

plot(student_number, ATTENDANCE, "-d");

title("Attendance of Students");

xlabel("Student");

ylabel("Attendance (%)");

grid on;

saveas(gcf, "plots/24_Attendance_Line.png");


%% ============================================================
%                 PLOT 25 - STEM PLOT
% =============================================================

figure;

stem(student_number, FRIENDS_COUNT);

title("Number of Friends");

xlabel("Student");

ylabel("Friends Count");

grid on;

saveas(gcf, "plots/25_FriendsCount_Stem.png");


%% ============================================================
%                 PLOT 26 - STAIRS PLOT
% =============================================================

figure;

stairs(student_number, SLEEP_HOURS);

title("Sleep Hours of Students");

xlabel("Student");

ylabel("Sleep Hours");

grid on;

saveas(gcf, "plots/26_SleepHours_Stairs.png");


%% ============================================================
%                 PLOT 27 - SCATTER PLOT
% =============================================================

figure;

scatter(SLEEP_HOURS, GPA, 60, "filled");

title("GPA vs Sleep Hours");

xlabel("Sleep Hours");

ylabel("GPA");

grid on;

saveas(gcf, "plots/27_GPA_vs_SleepHours.png");


%% ============================================================
%                 PLOT 28 - SCATTER PLOT
% =============================================================

figure;

scatter(FRIENDS_COUNT, GPA, 60, "filled");

title("GPA vs Number of Friends");

xlabel("Friends Count");

ylabel("GPA");

grid on;

saveas(gcf, "plots/28_GPA_vs_Friends.png");


%% ============================================================
%                 PLOT 29 - SCATTER PLOT
% =============================================================

figure;

scatter(AGE, EXAM_SCORE, 60, "filled");

title("Age vs Exam Score");

xlabel("Age");

ylabel("Exam Score");

grid on;

saveas(gcf, "plots/29_Age_vs_ExamScore.png");


%% ============================================================
%                 PLOT 30 - SCATTER PLOT
% =============================================================

figure;

scatter(SLEEP_HOURS, EXAM_SCORE, 60, "filled");

title("Sleep Hours vs Exam Score");

xlabel("Sleep Hours");

ylabel("Exam Score");

grid on;

saveas(gcf, "plots/30_SleepHours_vs_ExamScore.png");


%% ============================================================
%                 PLOT 31 - TREND LINE
% =============================================================

figure;

scatter(STUDY_HOURS, EXAM_SCORE, 60, "filled");

hold on;

p = polyfit(STUDY_HOURS, EXAM_SCORE, 1);

x = linspace(min(STUDY_HOURS), max(STUDY_HOURS), 100);

y = polyval(p, x);

plot(x, y, "LineWidth", 2);

title("Study Hours vs Exam Score with Trend Line");

xlabel("Study Hours per Day");

ylabel("Exam Score");

legend("Students", "Trend Line");

grid on;

hold off;

saveas(gcf, "plots/31_StudyHours_vs_Exam_Trend.png");


%% ============================================================
%                 PLOT 32 - TREND LINE
% =============================================================

figure;

scatter(ATTENDANCE, GPA, 60, "filled");

hold on;

p = polyfit(ATTENDANCE, GPA, 1);

x = linspace(min(ATTENDANCE), max(ATTENDANCE), 100);

y = polyval(p, x);

plot(x, y, "LineWidth", 2);

title("Attendance vs GPA with Trend Line");

xlabel("Attendance (%)");

ylabel("GPA");

legend("Students", "Trend Line");

grid on;

hold off;

saveas(gcf, "plots/32_Attendance_vs_GPA_Trend.png");


%% ============================================================
%                 PLOT 33 - TREND LINE
% =============================================================

figure;

scatter(SLEEP_HOURS, EXAM_SCORE, 60, "filled");

hold on;

p = polyfit(SLEEP_HOURS, EXAM_SCORE, 1);

x = linspace(min(SLEEP_HOURS), max(SLEEP_HOURS), 100);

y = polyval(p, x);

plot(x, y, "LineWidth", 2);

title("Sleep Hours vs Exam Score with Trend Line");

xlabel("Sleep Hours");

ylabel("Exam Score");

legend("Students", "Trend Line");

grid on;

hold off;

saveas(gcf, "plots/33_SleepHours_vs_Exam_Trend.png");


%% ============================================================
%                 PLOT 34 - AVERAGE GPA BY HOSTEL
% =============================================================

average_gpa_hostel = zeros(length(hostel_names),1);

for i = 1:length(hostel_names)

    group = hostel == hostel_names{i};

    average_gpa_hostel(i) = mean(GPA(group));

end

figure;

bar(average_gpa_hostel);

title("Average GPA by Hostel");

xlabel("Hostel");

ylabel("Average GPA");

xticks(1:length(hostel_names));

xticklabels(hostel_names);

xtickangle(45);

grid on;

saveas(gcf, "plots/34_AverageGPA_by_Hostel.png");


%% ============================================================
%                 PLOT 35 - HORIZONTAL BAR
%                 AVERAGE EXAM SCORE BY HOSTEL
% =============================================================

average_exam_hostel = zeros(length(hostel_names),1);

for i = 1:length(hostel_names)

    group = hostel == hostel_names{i};

    average_exam_hostel(i) = mean(EXAM_SCORE(group));

end

figure;

barh(average_exam_hostel);

title("Average Exam Score by Hostel");

xlabel("Average Exam Score");

ylabel("Hostel");

yticks(1:length(hostel_names));

yticklabels(hostel_names);

grid on;

saveas(gcf, "plots/35_AverageExam_by_Hostel.png");


%% ============================================================
%                 PLOT 36 - AVERAGE GPA BY TRIBE
% =============================================================

tribe = categorical(Students.TRIBE);

tribe_names = categories(tribe);

average_gpa_tribe = zeros(length(tribe_names),1);

for i = 1:length(tribe_names)

    group = tribe == tribe_names{i};

    average_gpa_tribe(i) = mean(GPA(group));

end

figure;

bar(average_gpa_tribe);

title("Average GPA by Tribe");

xlabel("Tribe");

ylabel("Average GPA");

xticks(1:length(tribe_names));

xticklabels(tribe_names);

xtickangle(45);

grid on;

saveas(gcf, "plots/36_AverageGPA_by_Tribe.png");


%% ============================================================
%                 PLOT 37 - AVERAGE EXAM BY RELIGION
% =============================================================

average_exam_religion = zeros(length(religion_names),1);

for i = 1:length(religion_names)

    group = religion == religion_names{i};

    average_exam_religion(i) = mean(EXAM_SCORE(group));

end

figure;

bar(average_exam_religion);

title("Average Exam Score by Religion");

xlabel("Religion");

ylabel("Average Exam Score");

xticks(1:length(religion_names));

xticklabels(religion_names);

xtickangle(45);

grid on;

saveas(gcf, "plots/37_AverageExam_by_Religion.png");


%% ============================================================
%                 PLOT 38 - CORRELATION MATRIX
% =============================================================

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

title("Correlation Matrix");

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

saveas(gcf, "plots/38_Correlation_Matrix.png");


%% ============================================================
%                 DISPLAY CORRELATION MATRIX
% =============================================================

disp("======================================");

disp("CORRELATION MATRIX:");

disp(correlation_matrix);


%% ============================================================
%                 BASIC STATISTICS
% =============================================================

disp("======================================");

disp("AVERAGE GPA:");

disp(mean(GPA));

disp("AVERAGE AGE:");

disp(mean(AGE));

disp("AVERAGE STUDY HOURS:");

disp(mean(STUDY_HOURS));

disp("AVERAGE SLEEP HOURS:");

disp(mean(SLEEP_HOURS));

disp("AVERAGE EXAM SCORE:");

disp(mean(EXAM_SCORE));

disp("AVERAGE ATTENDANCE:");

disp(mean(ATTENDANCE));

disp("AVERAGE FRIENDS COUNT:");

disp(mean(FRIENDS_COUNT));


%% ============================================================
%                 MINIMUM VALUES
% =============================================================

disp("======================================");

disp("LOWEST GPA:");

disp(min(GPA));

disp("LOWEST EXAM SCORE:");

disp(min(EXAM_SCORE));

disp("LOWEST ATTENDANCE:");

disp(min(ATTENDANCE));


%% ============================================================
%                 MAXIMUM VALUES
% =============================================================

disp("======================================");

disp("HIGHEST GPA:");

disp(max(GPA));

disp("HIGHEST EXAM SCORE:");

disp(max(EXAM_SCORE));

disp("HIGHEST ATTENDANCE:");

disp(max(ATTENDANCE));

disp("HIGHEST STUDY HOURS:");

disp(max(STUDY_HOURS));


%% ============================================================
%                 FINISHED
% =============================================================

disp("======================================");

disp("ALL 38 PLOTS HAVE BEEN SAVED.");

disp("CHECK THE 'plots' FOLDER.");

disp("STUDENT DATA ANALYSIS COMPLETE.");

disp("======================================")