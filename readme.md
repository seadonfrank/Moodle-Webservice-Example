## Moodle web service test
 
The challenge is to fetch information from Moodle via its REST API and display this information in a table format within a Moodle block.  
This test implies familiarity with Moodle but not in a very detailed way - it is more a test of working with APIs. You do however have to enable Moodle to expose its webservice data to clients and also get tokens. You can read up about [Moodle's webservice configuration](http://docs.moodle.org/dev/Web_services).  

The challenge is as follows:
Create a [block](http://docs.moodle.org/dev/Blocks) that lists all courses a user is enrolled in, along with how many activies are in that course e.g. Course 1 (42)
The block must use HTML and Javascript to render this information.
The information MUST be requested from a new Moodle webservice that you will write. (JSON or XML is up to you)
(Stretch goal) Paginate the results
The code should to work out of the box on a vanilla Moodle installation version 2.7 or above.

You may also need to view the documentation on [external service functions](http://docs.moodle.org/dev/External_services_description).

How to do the challenge:
Fork this repo
Complete the challenge and commit back to your repo.
Create a pull request back to this repo.
