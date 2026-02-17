### DAY 21- Common Table Expressions (CTEs)

Topics: WITH clause, CTEs, recursive CTEs (if applicable), query organization
CTEs (WITH clauses) create temporary named result sets that exist only during query execution. They make complex queries more readable and maintainable.

**Daily_Challenge:**
Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). 
Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). 
Order by performance score descending.
