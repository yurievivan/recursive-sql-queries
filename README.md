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
<br>
<hr>
<h2 align="center">One of the typical tasks encountered during an interview</h2>
<hr>
<p>The database is defined as PostgreSQL, so the solution will be presented for PostgreSQL.</p>
<b>Description:</b>
<p>Below are two tables for demonstration: <b>AIRPORT</b> and <b>FLIGHTS</b>. The <b>FLIGHTS</b> table contains data about the flight's departure date (<code>start_date</code>) from the airport and the arrival date (<code>end_date</code>) at the destination airport. It also includes the airport codes for the departure (<code>start_port</code>) and arrival (<code>end_port</code>) airports. Using the airport code from the <b>AIRPORT</b> table, you can retrieve information about the city and country where the airport is located.
The goal is to find the flight with the minimum duration from <b>New York</b> to <b>Tokyo</b>, considering flights with no more than 2 layovers (i.e., up to 3 flight segments). The result should be displayed as <code>min_flight_duration</code> in minutes. The full schema for the <b>AIRPORT</b> and <b>FLIGHTS</b> tables, along with sample data, can be found in the SQL script at the following link: <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/Task1/task_1_create_db_airports_db_flights_and_sample_data.sql">GitHub - SQL script</a>.</p>
<img width="1000" alt="Two tables for demonstration: AIRPORT and FLIGHTS" src="https://github.com/user-attachments/assets/24a0bb2a-f2e0-4df8-a3a8-22a480745366" /><br><br>
<b>Expected Result:</b>
<p>The result should show the minimum flight duration in minutes.</p>
<img width="200" alt="Result" src="https://github.com/user-attachments/assets/a64a55af-d181-42f7-b4c4-241e94d5e13a" /><br><br>
<b>Solution</b>
<p>Before writing the query, it's important to note that, in addition to considering both direct flights and flights with no more than two layovers, there is <b>more than one airport</b> in both <b>New York</b> and <b>Tokyo</b>.</p>
<p>Below is a screenshot of the SQL query solving this task. The SQL query can be found at the following link: <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/Task1/task_1_recursive_query_for_flights_table.sql">GitHub - SQL query</a>.</p>
<img width="1000" alt="Recursive SQL Query" src="https://github.com/user-attachments/assets/f78a5dcb-78e4-4b0f-894d-b984c8ab56b7" /><br><br>
<b>Query Explanation:</b>
<p>This query finds the minimum flight duration from New York to Tokyo, considering both direct flights and flights with layovers (up to two layovers, i.e., up to 3 flight segments).</p>
<ol>
  <li><b>Recursive CTE (Common Table Expression) -</b> <code>REACHABLE:</code>
  <ul>
    <li>This recursive expression is used to compute all possible flights (both direct and with layovers) between <b>New York</b> and <b>Tokyo</b>.</li>
  </ul>
  </li>
  <li><b>Base Case (Direct flights from New York):</b>
    <ul>
    <li>The first part of the query (base case) selects all direct flights from New York. It joins the <b>AIRPORT</b> table to filter only those flights that start from New York (<code>a.city = 'New York'</code>).</li>
    <li>The flight duration in minutes is calculated using the formula <code>EXTRACT(EPOCH FROM (f.end_date - f.start_date)) / 60</code>, which computes the time difference between the departure and arrival times and converts it into minutes.</li>
    <li>For direct flights, the number of layovers is set to 1.</li>
  </ul>
  </li>
  <li><b>Recursive Part (Layovers):</b>
    <ul>
      <li>In the second part of the query, recursion is used (through <code>REACHABLE inn</code> and <code>flights outt</code>) to find layovers.</li>
      <li>For each found flight (<code>REACHABLE inn</code>), the next flight (<code>flights outt</code>) is searched, where the arrival airport (<code>inn.end_port</code>) matches the departure airport of the next flight (<code>outt.start_port</code>).</li>
      <li>The flight duration is recalculated by adding the duration of the connecting flight, and the number of layovers is incremented by 1.</li>
      <li>A limit is set on the number of layovers — no more than 2 (i.e., up to 3 flight segments), controlled by the condition <code>inn.num_stops < 3</code>.</li>
    </ul>
  </li>
  <li><b>Selecting the Minimum Flight Duration:</b>
      <ul>
        <li>In the final part of the query, the minimum flight duration (<code>MIN(r.diff_in_minutes)</code>) is selected, representing the shortest flight from New York to Tokyo, considering both direct and layover flights.</li>
        <li>The query joins the <b>AIRPORT</b> table to ensure the flights end in Tokyo (filtered by <code>a.city = 'Tokyo'</code>).</li>
      </ul>
  </li>        
</ol>
<b>Result:</b>
<p>The query returns the minimum flight duration (<code>min_flight_duration</code>) in minutes between New York and Tokyo, accounting for direct flights and flights with layovers (up to two layovers).</p>
<b>Extended Query:</b>
<p>Finally, we can slightly modify the query to see extended information and determine which specific route has the minimum flight duration. You can find the updated query here: <a href="https://github.com/yurievivan/recursive-sql-queries/blob/main/Task1/task_1_recursive_query_for_flights_table_extended_info.sql">GitHub - Extended SQL Query</a>.</p>
<p>Below is a screenshot of the query result with extended information.</p>
<img width="1000" alt="Extended Result" src="https://github.com/user-attachments/assets/c0de7fb2-f491-420c-9c6d-cfc1dc0eb0f2" /><br><br>
<p>As it turns out, the route <b>LGA->IAD | IAD->HND</b> (New York -> Virginia | Virginia -> Tokyo) has the minimum flight duration between <b>New York</b> and <b>Tokyo</b>.</p>
