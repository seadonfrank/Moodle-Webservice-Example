<?php
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

class block_kaplan_plugin extends block_base {
    public function init() {
        $this->title = get_string('kaplan_plugin', 'block_kaplan_plugin');
    }

    function get_content() {
        if ($this->content !== NULL) {
            return $this->content;
        }

        $this->content = new stdClass();
        $htmlid = 'kaplan_plugin_custom'.uniqid();
        $this->page->requires->js_init_call('M.block_kaplan_plugin.init_custom', array($htmlid));
        $this->content->text = '<div id="'.$htmlid.'">';
        $this->content->text .= '</div>';
        return $this->content;
    }
}


