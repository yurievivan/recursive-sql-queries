<h2 align="center">Recursive SQL queries</h2>
<p><b>Recursive SQL queries</b> were introduced in <b>SQL:1999</b>, and most modern relational databases support them. These queries are useful for working with hierarchical data, such as the <a href="https://github.com/yurievivan/TreeProject">Adjacency List</a>. They can also be used for looping through data in a way similar to how loops work in other programming languages, but implemented with recursion. While most databases support procedural code with loops, these are often limited to stored procedures and functions.</p>
<p>Let’s start with a simple example. Here is a simple example of a <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/recursive_query_with_cycle.sql">recursive query that outputs numbers from 1 to 10</a>:</p>
<img width="500" alt="Recursive loop" src="https://github.com/user-attachments/assets/7d63e818-4d7c-4247-b0df-36bdd6db1664" /><br><br>
<p>While this might look a bit more verbose compared to the familiar for loop, it shows how recursion can be used to iterate through a sequence of values in SQL:</p>
<img width="500" alt="For cycle" src="https://github.com/user-attachments/assets/f1c62b85-749c-47cf-abbc-c2c0aa8bf4ec" /><br><br>
<p>Now, let’s look at a more practical example. Below is a diagram of the <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/create_db_flights_and_sample_data.sql">FLIGHTS table</a>, which contains information about flight routes and prices. We’ll use this table to find the cheapest flight between <b>Athens</b> and <b>Denpasar</b> using a <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/recursive_query_for_flights_table.sql">recursive SQL query</a>.</p>
<p><b>Flight Route from Athens to Denpasar:</b></p>  
<img width="1000" alt="An approximate flight route from Athens to Denpasar and a table with the data." src="https://github.com/user-attachments/assets/be84162b-53b7-4e68-ad4d-ec7c7f8752b2" /><br><br>
<p>The <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/create_db_flights_and_sample_data.sql">FLIGHTS table</a> includes flight data, such as the departure and destination cities along with flight prices. Our goal is to find the price of the cheapest flight between <b>Athens</b> and <b>Denpasar</b> using <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/recursive_query_for_flights_table.sql">recursion</a>.</p>
<img width="1000" alt="Recursive SQL Query" src="https://github.com/user-attachments/assets/88a653b1-0ceb-48a8-9278-23df0386a5a2" /><br><br>
<p><b>The result of the query execution:</b></p>
<img width="1000" alt="Recursive SQL Query" src="https://github.com/user-attachments/assets/01478e2b-5125-494b-8020-ac17f9ab240a" /><br><br>
<p>The query result matches the graph above, where the cheapest flight is highlighted in blue.</p>
<p><b>Let’s break down the query and explain its parts briefly.</b></p>
<p>The recursive query can be divided into three main sections: <b>initialization</b>, <b>recursion</b>, and the <b>final result</b>.</p>
<ul>
  <li><b>(1) Initial Subquery:</b> This part selects all cities you can reach from <b>Athens</b> and creates the initial route by combining <b><i>FromCity -> ToCity</i></b>.</li>
  <li><b>(2) Recursive Subquery:</b> This part adds cities that can be reached from <b>Athens</b> with one stop, calculates the total flight cost, and updates the route.</li>
  <li><b>(3) Result Query:</b> This part groups the data and selects the flight to <b>Denpasar</b> with the lowest price.</li>
</ul>
<p>This query finds the cheapest flight with <b>one layover</b>. Our FLIGHTS table (see the graph above) does not include flights with more than one layover. <b>The number of recursive subqueries depends on the number of stops.</b> For example, if we needed to consider three stops, we would need two recursive subqueries.</p>
<hr>
<p><b>Summary:</b> Recursive SQL queries are powerful tools for solving complex problems, especially those involving hierarchical data. They can often be more efficient than using complex data models or loading large datasets from a database to handle on the backend. In cases where recursion is not the best approach, alternatives like stored procedures or functions can be used to solve the problem with a single call.</p>
