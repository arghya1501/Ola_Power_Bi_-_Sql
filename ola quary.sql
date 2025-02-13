Create database ola;
use ola;

-- SQL Questions:
-- 1. Retrieve all successful bookings
select Booking_ID,Booking_Status from bookings
where Booking_Status = "Success";

select count(Booking_ID)from bookings
where Booking_Status = "Success";
-- 2. Find the average ride distance for each vehicle type:
select Vehicle_Type,Round(avg(Ride_Distance),2) as average_ride_distance from bookings
group by Vehicle_Type;
-- 3. Get the total number of cancelled rides by customers:
select count(Booking_Status) as cancelled_rides
from bookings
where Booking_Status = "Canceled by Customer";

-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID ,count(Booking_ID) as highest_number_of_rides
FROM bookings
group by Customer_ID
order by  highest_number_of_rides desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) as cancelled_by_drivers
from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select max(Driver_Ratings) as Max_Driver_Rating , min(Driver_Ratings) as Min_Drive_Rating from bookings;
-- 7. Retrieve all rides where payment was made using UPI:
Select Booking_ID,Payment_Method from bookings
where Payment_Method = "UPI";
-- 8. Find the average customer rating per vehicle type:
Select Vehicle_Type, round(avg(Customer_Rating),2)as Avg_Rating from bookings
group by Vehicle_Type;
-- 9. Calculate the total booking value of rides completed successfully:
Select sum(Booking_Value) as total_Booking_Value from bookings
where Booking_Status = "Success";
-- 10. List all incomplete rides along with the reason:
Select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides_Reason <> "Null";
Select count(Booking_ID)from bookings
where Incomplete_Rides_Reason <> "Null";