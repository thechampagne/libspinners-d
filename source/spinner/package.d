/*
 * Copyright (c) 2023 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
module spinner;

import std.string : toStringz;
import spinner.raw;

alias Spinners = spinner_spinners_t;

struct Spinner
{
  private spinner_t spinner;

  this(Spinners spinner, string message)
  {
    this.spinner = spinner_new(spinner, message.toStringz);
  }

  static Spinner withTimer(Spinners spinner, string message)
  {
    auto spin = spinner_new_with_timer(spinner, message.toStringz);
    Spinner new_spin;
    new_spin.spinner = spin;
    return new_spin;
  }

  void stop()
  {
    spinner_stop(&this.spinner);
  }

  void stopWithSymbol(spinner_t* spinner, string symbol)
  {
    spinner_stop_with_symbol(&this.spinner, symbol.toStringz);
  }

  void stopWithNewline()
  {
    spinner_stop_with_newline(&this.spinner);
  }

  void stopWithMessage(string msg)
  {
    spinner_stop_with_message(&this.spinner, msg.toStringz);
  }

  void stopAndPersist(string symbol, string msg)
  {
    spinner_stop_and_persist(&this.spinner, symbol.toStringz, msg.toStringz);
  }

  ~this()
  {
    spinner_clean(&this.spinner);
  }
}
