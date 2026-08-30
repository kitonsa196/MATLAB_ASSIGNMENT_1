clc;
clear;
n = input("enter number of courses : ");
total_points = 0;
total_credits = 0;
for i = 1:n;
    fprintf("\nCourse %d\n", i);
    credit = input("enter credit units value ie 4cU or 3cU4: ");
    grade_points = input("enter grade point value ie A=5,B+=4.5,B-=4 : ");
    total_points = total_points + credit * grade_points;
    total_credits = total_credits + credit;

end
GPA = total_points/total_credits;
fprintf("\nGPA = %.2f\n", GPA);


    


