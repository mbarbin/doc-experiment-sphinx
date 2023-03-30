open! Core

let%expect_test "hello" =
  print_s Doc_experiment.hello_world;
  [%expect {| "Hello, World!" |}]
;;
