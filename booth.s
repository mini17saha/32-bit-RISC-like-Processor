# writing a code in three address code to multiply two numbers using booth's algorithm

ld      $s5, $zero  # loading A in $s5

ld      $s0, $zero 
addi    $s0, 12     # loading the multiplicand (m) in $s0

ld      $s1, $zero
addi    $s1, 4      # loading the multiplier (q)  in $s1

ld      $s2, $zero
addi    $s2, 32     # loading the counter in $s2

ld      $s3, $zero
addi    $s3, 1     
andi    $s3, $s1    # loading the LSB of the multiplier in $s3 (q0)

ld     $s4, $zero   # loading the q-1 in $s4

loop: 

sub    $t0, $s3, $s4    # checking if q0 = 1 and q-1 = 0
bmi    $t0, add_m       # if yes, add m to A
bpl    $t0, sub_m       # if no, subtract m from A
b      shift

add_m:

add    $s5, $s5, $s0    # A = A + m
b      shift

sub_m:

sub    $s5, $s5, $s0    # A = A - m
b      shift

shift:

sra    $s1, $s1, 1      # q = q >> 1

