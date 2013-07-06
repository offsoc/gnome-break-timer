/*
 * This file is part of Brain Break.
 * 
 * Brain Break is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Brain Break is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Brain Break.  If not, see <http://www.gnu.org/licenses/>.
 */

public class RestBreakType : TimerBreakType {
	public RestBreakType() {
		Settings settings = new Settings("org.brainbreak.breaks.restbreak");
		base("restbreak", settings);

		this.interval_options = {1800, 2400, 3000, 3600};
		this.duration_options = {300, 360, 420, 480, 540, 600};
	}
	
	public override Gtk.Widget get_status_panel() {
		var panel = new Gtk.Grid();
		var label = new Gtk.Label("Rest Break");
		panel.add(label);
		panel.show_all();
		return panel;
	}

	public override Gtk.Widget get_settings_panel() {
		return new TimerBreakSettingsPanel(
			this,
			_("Rest Break"),
			_("And take some longer breaks to stretch your legs")
		);
	}
}

