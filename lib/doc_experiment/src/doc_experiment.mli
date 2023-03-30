open! Core

(** Hello documentation comment. *)
val hello_world : Sexp.t

(** This is the main command exported by the library, to serve as an
   CLI entry point to the project. *)
val main : Command.t
