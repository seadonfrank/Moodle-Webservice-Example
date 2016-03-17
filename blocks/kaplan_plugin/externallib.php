<?php
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

require_once($CFG->libdir . "/externallib.php");

class block_kaplan_plugin_external extends external_api {

    public static function get_users_custom_parameters() {
        return new external_function_parameters(
            array()
        );
    }

    public static function get_users_custom() {
        global $DB;

        $join = "LEFT JOIN {context} ctx ON (ctx.instanceid = u.id AND ctx.contextlevel = :contextlevel)";
        $params['contextlevel'] = CONTEXT_USER;

        $sql = "SELECT u.* FROM {user} u $join";
        $users = $DB->get_recordset_sql($sql, $params);

        $result = array();
        foreach ($users as $user) {
            if (!empty($user->deleted)) {
                continue;
            }
            $result[] = array('id'=>$user->id,'fullname'=>$user->firstname." ".$user->lastname);
        }

        $users->close();

        return $result;
    }

    public static function get_users_custom_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'id'    => new external_value(PARAM_INT, 'ID of the user'),
                    'fullname'    => new external_value(PARAM_NOTAGS, 'The fullname of the user'),
                ), 'user'
            )
        );
    }

    public static function get_courses_custom_parameters() {
        return new external_function_parameters(
            array()
        );
    }

    public static function get_courses_custom() {
        global $DB;

        $courses = $DB->get_records('course');
        $coursesinfo = array();

        foreach ($courses as $course) {
            if ($course->id != SITEID) {
                $context = context_course::instance($course->id, IGNORE_MISSING);
                $courseinfo = array();

                $courseinfo['id'] = $course->id;
                $courseinfo['fullname'] = $course->fullname;

                list($enrolledsql, $enrolledparams) = get_enrolled_sql($context, '', 0, false);
                $ctxjoin = "LEFT JOIN {context} ctx ON (ctx.instanceid = u.id AND ctx.contextlevel = :contextlevel)";
                $enrolledparams['contextlevel'] = CONTEXT_USER;

                $sql = "SELECT us.* FROM {user} us
                  JOIN (
                      SELECT DISTINCT u.id FROM {user} u $ctxjoin WHERE u.id IN ($enrolledsql)
                  ) q ON q.id = us.id
                ORDER BY us.id ASC";
                $enrolledusers = $DB->get_recordset_sql($sql, $enrolledparams);

                $users = 0;
                foreach ($enrolledusers as $user) {
                    $users += 1;
                }

                $enrolledusers->close();

                $courseinfo['users'] = $users;

                $coursesinfo[] = $courseinfo;
            }
        }

        return $coursesinfo;
    }

    public static function get_courses_custom_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'id' => new external_value(PARAM_INT, 'course id'),
                    'fullname' => new external_value(PARAM_TEXT, 'course name'),
                    'users' => new external_value(PARAM_INT, 'users enrolled'),
                ), 'course'
            )
        );
    }
}