(module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; Create function 'int add_ints(int lhs, int rhs)'
    (func $add_ints (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs  ;; Get lhs parameter and push to stack
        local.get $rhs  ;; Get rhs parameter and push to stack
        i32.add)        ;; Add top two values of stack and put result on stack
                        ;; At end of function, we return the top of the stack

    ;; Export the 'add_ints()' function
    (export "add_ints" (func $add_ints))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; Create function 'float add_floats(float lhs, float rhs)'
    (func $add_floats (param $lhs f64) (param $rhs f64) (result f64)
        local.get $lhs  ;; Get lhs parameter and push to stack
        local.get $rhs  ;; Get rhs parameter and push to stack
        f64.add)        ;; Add top two values of stack and put result on stack
                        ;; At end of function, we return the top of the stack
			
    ;; Export the 'add_floats()' function
    (export "add_floats" (func $add_floats))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (func $factorial (param $i i32) (result i32)
        (if (result i32)        ;; if statement returns i32
            (i32.eq             ;; if ($1 == 1)
                (local.get $i)  ;; 
                (i32.const 1))  ;; 
            (then
                (i32.const 1))  ;; return 1
            (else
                local.get $i    ;; Push $i to stack
                i32.const 1     ;; Push 1 to stack
                i32.sub         ;; Subtract 1 from $i
                call $factorial ;; Call factorial on result of $i-1 (and push result to stack)
                
                local.get $i    ;; Push $i to stack
                i32.mul)))      ;; Multiply $i and result of factorial() call and return

    ;; Export the 'factorial()' function
    (export "factorial" (func $factorial))

)