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

public class TimerBreakPanel : BreakPanel {
	public TimeChooser interval_chooser;
	public TimeChooser duration_chooser;
	
	protected int[] interval_options;
	protected int[] duration_options;
	
	private string title;
	
	public TimerBreakPanel(string title, string? description, int[] interval_options, int[] duration_options) {
		base(title, description);
		
		this.title = title;
		
		this.interval_options = interval_options;
		this.duration_options = duration_options;
		
		Gtk.Grid details_grid = this.build_details_grid();
		this.get_content().add(details_grid);
	}
	
	private inline Gtk.Grid build_details_grid() {
		Gtk.Grid details_grid = new Gtk.Grid();
		
		details_grid.set_column_spacing(8);
		details_grid.set_row_spacing(8);
		
		Gtk.Label interval_label = new Gtk.Label.with_mnemonic("Every");
		interval_label.set_halign(Gtk.Align.END);
		details_grid.attach(interval_label, 0, 1, 1, 1);
		
		this.interval_chooser = new TimeChooser(this.interval_options, _("%s frequency").printf(this.title));
		details_grid.attach_next_to(this.interval_chooser, interval_label, Gtk.PositionType.RIGHT, 1, 1);
		
		Gtk.Label duration_label = new Gtk.Label.with_mnemonic("For");
		duration_label.set_halign(Gtk.Align.END);
		details_grid.attach(duration_label, 0, 2, 1, 1);
		
		this.duration_chooser = new TimeChooser(this.duration_options, _("%s duration").printf(this.title));
		details_grid.attach_next_to(this.duration_chooser, duration_label, Gtk.PositionType.RIGHT, 1, 1);
		
		details_grid.show_all();
		
		return details_grid;
	}
}

