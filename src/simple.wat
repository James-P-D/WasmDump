(module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; We can create functions that return constants

    ;; Create function 'int return_99()'
    (func $return_99 (result i32)
        i32.const 99)   ;; Push 99 to the stack and return it

    ;; Export the 'add_ints()' function
    (export "return_99" (func $return_99))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; We can call functions from other functions

    ;; Create function 'int return_99()'
    (func $return_100 (result i32)
        i32.const 1     ;; Push 1 to stack
        call $return_99 ;; Call $return_99 which will push 99 to the stack
        i32.add)        ;; Add the top two items of the stack, and push result so we can return it

    ;; Export the 'return_100()' function
    (export "return_100" (func $return_100))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; We can take parameters and return values

    ;; Create function 'int add_ints(int lhs, int rhs)'
    (func $add_ints (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs  ;; Get lhs parameter and push to stack
        local.get $rhs  ;; Get rhs parameter and push to stack
        i32.add)        ;; Add top two values of stack and put result on stack
                        ;; At end of function, we return the top of the stack

    ;; Export the 'add_ints()' function
    (export "add_ints" (func $add_ints))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; We can take float parameters and return values

    ;; Create function 'float add_floats(float lhs, float rhs)'
    (func $add_floats (param $lhs f64) (param $rhs f64) (result f64)
        local.get $lhs  ;; Get lhs parameter and push to stack
        local.get $rhs  ;; Get rhs parameter and push to stack
        f64.add)        ;; Add top two values of stack and put result on stack
                        ;; At end of function, we return the top of the stack

    ;; Export the 'add_floats()' function
    (export "add_floats" (func $add_floats))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; We can call functions recursively

    (func $factorial (param $i i32) (result i32)
        (if (result i32)        ;; if statement returns i32
            (i32.eq             ;; if ($i == 1)
                (local.get $i)  ;; 
                (i32.const 1))  ;; 
            (then
                (i32.const 1))  ;; return 1
            (else
                local.get $i    ;; Push $i to stack
                i32.const 1     ;; Push 1 to stack
                i32.sub            ;; Subtract 1 from $i
                call $factorial ;; Call factorial on result of $i-1 (and push result to stack)
                
                local.get $i    ;; Push $i to stack
                i32.mul)))      ;; Multiply $i and result of factorial() call and return

    ;; Export the 'factorial()' function
    (export "factorial" (func $factorial))
)