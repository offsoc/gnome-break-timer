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

public class BreakManager : Object {
	private Gee.Map<string, BreakType> breaks;
	
	public signal void break_loaded(BreakType break_type);
	
	public BreakManager() {
		this.breaks = new Gee.HashMap<string, BreakType>();
	}
	
	private void break_enable_change(BreakModel model) {
		bool enabled = model.settings.get_boolean("enabled");
		model.set_enabled(enabled);
	}
	
	private void register_break(BreakType break_type) {
		this.breaks.set(break_type.id, break_type);
		this.break_loaded(break_type);
		
		BreakModel model = break_type.model;
		
		// FIXME: Breaks are currently enabled by their own settings.
		// Instead, enabled breaks should be stored in a list somewhere.
		model.settings.changed["enabled"].connect(() => {
			model.set_enabled(model.settings.get_boolean("enabled"));
		});
		model.set_enabled(model.settings.get_boolean("enabled"));
	}
	
	public void load_breaks() {
		this.register_break(new MicroBreakType());
		this.register_break(new RestBreakType());
	}
	
	public Gee.Iterable<BreakType> get_all_breaks() {
		return this.breaks.values;
	}
	
	[Deprecated]
	public BreakModel get_break_for_name(string name) {
		return this.breaks.get(name).model;
	}
	
	public BreakType get_break_type_for_name(string name) {
		return this.breaks.get(name);
	}
}

