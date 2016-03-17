Moodle web service test
December 2015
 
The challenge is to fetch information from Moodle via its REST API and display this information in a table format within a Moodle block.  You must define the functions in PHP to fetch a list of users and courses and build a user interface using Javascript and HTML to display them.
 
This test implies familiarity with Moodle but not in a very detailed way - it is more a test of working with APIs.  You do however have to enable Moodle to expose its webservice data to clients and also get tokens.   You can read up about Moodle's webservice configuration here: http://docs.moodle.org/dev/Web_services
 
1. Create a Moodle block that defines two new external functions within it.  The Moodle block should be called "kaplan_plugin" and the two external functions should be called "get_users_custom" and "get_courses_custom".
Information on how to create new blocks here: http://docs.moodle.org/dev/Blocks  and external service functions here: http://docs.moodle.org/dev/External_services_description .
 
2. The User function should return an array [user ID, user full name] and the Course function should return [course ID, course Name, number of users enrolled].
 
3. Create Javascript for your Moodle block.  You must fetch your user and course array data by making a GET request back to Moodle via its REST API.  It is entirely your choice whether you use JSON or XML as a data structure during transport.
 
4. Build a user interface for your Moodle block.  Show a user table and a course table populated with information fetched via your Javascript's GET request.
 
----
 
Please submit all of your code to a public bitbucket or github. The code should to work out of the box on a vanilla Moodle installation version 2.7 or above. 

Any questions, please email nathan.webster@kaplan.com.