clc;
clear;
semesters = input("enter number of semesters : ");
total_weighted_GPA = 0;
total_credits = 0;
for s = 1:semesters
    fprintf("\nSemester %d\n",s);
    GPA = input("enter GPA : ");
    credits = input("enter total credit units : ");
    total_weighted_GPA = total_weighted_GPA +GPA * credits;
    total_credits = total_credits + credits;
end
C.G.P.A = total_weighted_GPA/total_credits;

fprintf("CGPA = %.2f\n", C.G.P.A)