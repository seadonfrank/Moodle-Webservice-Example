// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Kaplan Plugin block
 *
 * @package   block_kaplan_plugin
 */

M.block_kaplan_plugin = {};

M.block_kaplan_plugin.init_custom = function(Y, htmlid) {

    require(['core/ajax'], function(ajax) {
        var promises = ajax.call([
            { methodname: 'block_kaplan_plugin_get_users_custom', args: { }},
        ]);

        var div = document.getElementById(htmlid);

        promises[0].done(function(response) {
            div.innerHTML += '<h5>List of Users</h5>';

            var table = document.createElement("TABLE");
            table.setAttribute("border", "1px");
            var row = table.insertRow(0);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = "User Id";
            cell2.innerHTML = "User Name";

            for (var i = 0; i < response.length; i++) {
                var row = table.insertRow(i+1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = response[i].id;
                cell2.innerHTML = response[i].fullname;
            }

            div.appendChild(table);
        }).fail(function(ex) {
            div.innerHTML += '<p>No users were found</p>';
        });
    });


    require(['core/ajax'], function(ajax) {
        var promises = ajax.call([
            { methodname: 'block_kaplan_plugin_get_courses_custom', args: { } }
        ]);

        var div = document.getElementById(htmlid);

        promises[0].done(function(response) {
            div.innerHTML += '<h5>List of Courses</h5>';

            var table = document.createElement("TABLE");
            table.setAttribute("border", "1px");
            var row = table.insertRow(0);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            cell1.innerHTML = "Course Id";
            cell2.innerHTML = "Course Name";
            cell3.innerHTML = "Users Enrolled";

            for (var i = 0; i < response.length; i++) {
                var row = table.insertRow(i+1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = response[i].id;
                cell2.innerHTML = response[i].fullname;
                cell3.innerHTML = response[i].users;
            }

            div.appendChild(table);
        }).fail(function(ex) {
            div.innerHTML += '<p>No courses were found</p>';
        });
    });
};
