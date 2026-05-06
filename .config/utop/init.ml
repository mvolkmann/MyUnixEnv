(*
#require "base";;
open Base;;
#require "Stdio";;
open Stdio;;
*)
#require "Core";;
open Core;;

#utop_prompt_dummy;;

(*
This evaluates an expression when the return key is pressed.
#require "lambda-term";;
LTerm_read_line.bind
  [ { control = false; meta = false; shift = false; code = Enter } ]
  [ UTop.end_and_accept_current_phrase ]
*)

print_endline "~/.config/utop/init.ml opened Core."

