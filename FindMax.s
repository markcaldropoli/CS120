.data
array:            .word 5
                  .word 10
                  .word 2
                  .word 0

.text
find_max:         addi $v0, $0, 0
loop:             lw $t0, 0($a0)
                  beq $t0, $0, loop_done
                  slt $t1, $t0, $v0
                  bne $t1, $0, skip_if_section
                  addi $v0, $t0, 0
skip_if_section:  addi $a0, $a0, 4
                  j loop
loop_done:        jr $ra
main:             la $a0, array
                  jal find_max
