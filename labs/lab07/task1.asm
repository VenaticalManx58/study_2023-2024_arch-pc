%include 'in_out.asm'
section .data
msg1 db 'Введите a: ',0h
msg2 db 'Введите b: ',0h
msg3 db 'Введите c: ',0h
msg4 db "Наименьшее число: ",0h
section .bss
min resb 10
a resb 10
b resb 10
c resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения a
mov eax, msg1
call sprint
; ---------- Ввод 'a'
mov ecx,a
mov edx,10
call sread
; ---------- Вывод сообщения b
mov eax, msg2
call sprint
; ---------- Ввод 'b'
mov ecx,b
mov edx,10
call sread
; ---------- Вывод сообщения c
mov eax, msg3
call sprint
; ---------- Ввод 'c'
mov ecx,c
mov edx,10
call sread
; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'
; ---------- Преобразование 'b' из символа в число
mov eax,b
call atoi ; Вызов подпрограммы перевода символа в число
mov [b],eax ; запись преобразованного числа в 'b'
; ---------- Преобразование 'c' из символа в число
mov eax,c
call atoi ; Вызов подпрограммы перевода символа в число
mov [c],eax ; запись преобразованного числа в 'c'


; ---------- Записываем 'a' в переменную 'min'
mov ecx,[a] ; 'ecx = a'
mov [min],ecx ; 'min = a'

mov ecx,[b]
cmp [min], ecx
jl cont1
mov [min], ecx
cont1:
mov ecx,[c]
cmp [min], ecx
jl fin
mov [min], ecx

; ---------- Вывод результата
fin:
mov eax, msg4
call sprint ; Вывод сообщения 'Наибольшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
