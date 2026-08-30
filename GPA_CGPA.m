clc;
clear;
n = input("enter number of courses : ");
total_points = 0;
total_credits = 0;
for i = 1:n;
    fprintf("\nCourse %d\", i);
    credit = input("enter credit units : ");
    grade_points = input("enter grade point : ");
    total_points = total_points + credit * grade_points;
    total_credits = total_credits + credit;

end
GPA = total_points/total_credits;
fprintf("\nGPA = %.2f\n", GPA);


    


