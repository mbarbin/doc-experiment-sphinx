open! Core

(** Hello documentation comment. Example of mdx section, taken from
   mdx's documentation:

    {@ocaml[
    # 1 + 2;;
    - : int = 3
    ]}
*)
val hello_world : Sexp.t

(** This is the main command exported by the library, to serve as an
   CLI entry point to the project. *)
val main : Command.t
