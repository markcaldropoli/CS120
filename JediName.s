.data                               # tells the machine we're in the data field
fspace: .space 81                   # creates space in memory for first name
lspace: .space 81                   # creates space in memory for second name
nspace: .space 24                   # creates space in memory for jedi name
first:  .asciiz "Enter your first name:\n"  # prompt to ask for first name
last:   .asciiz "Enter your last name:\n"   # prompt to ask for last name

.text                               # tells the machine we're in the text field
main:   la $a0, first               # loads first into $a0
        addi $v0, $0, 4             # prints first
        syscall                     # syscall

        la $a0, fspace              # loads address of space for first name
        addi $a1, $0, 81            # adds space to register
        addi $v0, $0, 8             # read input string
        syscall                     # syscall

        la $a0, last                # loads last into #a0
        addi $v0, $0, 4             # prints last
        syscall                     # syscall

        la $a0, lspace              # loads address of space for last name
        addi $a1, $0, 81            # adds space to register
        addi $v0, $0, 8             # read input string
        syscall                     # syscall

        la $s0, fspace              # loads address of first name
        la $s1, lspace              # loads address of last name
        lb $t0, 0($s1)              # loads the first letter of last name
        lb $t1, 1($s1)              # loads the second letter of last name
        lb $t2, 2($s1)              # loads the third letter of last name
        lb $t3, 0($s0)              # loads the first letter of first name
        lb $t4, 1($s0)              # loads the second letter of first name

        la $s2, nspace              # loads address of space for jedi name
        sb $t0, 0($s2)              # stores the first letter of last name
        sb $t1, 1($s2)              # stores the second letter of last name
        sb $t2, 2($s2)              # stores the third letter of last name
        sb $t3, 3($s2)              # stores the first letter of first name
        sb $t4, 4($s2)              # stores the second letter of first name

        la $a0, nspace              # loads address of jedi name
        addi $v0, $0, 4             # prints jedi name
        syscall                     # syscall

done:   addi $v0, $0, 10            # exits program
        syscall                     # syscall
