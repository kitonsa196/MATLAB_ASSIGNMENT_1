clc;
clear;
Students = readtable("D:\AST_DANCE\MATLAB_STUDENTS.xlsx");
disp(Students);

writetable(Students, "Group_5.xlsx");

figure;
gpa_plot = bar(Students.GPA);
title("GPA of Students");
xlabel("Student");
ylabel("GPA");

figure;
age_plot = bar(Students.AGE);
title("AGE OF STUDENTS");
xlabel("STUDENT");
ylabel("AGE");

