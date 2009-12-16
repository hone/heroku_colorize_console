=begin
  Copyright (c) 2009 Terence Lee.

  This file is part of Heroku Colorize Console.

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

module Heroku::Command
  class Base
    # rewrite display to use Wirble coloring if option is set
    def display_with_colorize(msg, newline=true)
      msg = Wirble::Colorize.colorize(msg) if @options and @options[:colorize]
      display_without_colorize(msg, newline)
    end

    alias_method :display_without_colorize, :display
    alias_method :display, :display_with_colorize
  end

  class App
    # set option to color output
    def console_with_colorize
      @options ||= {}
      @options[:colorize] = true
      console_without_colorize
    end

    alias_method :console_without_colorize, :console
    alias_method :console, :console_with_colorize
  end
end
