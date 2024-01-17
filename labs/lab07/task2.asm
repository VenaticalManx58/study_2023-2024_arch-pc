%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db "f(x) = ",0h
section .bss
a resb 10
x resb 10
ans resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения x
mov eax, msg1
call sprint
; ---------- Ввод 'x'
mov ecx,x
mov edx,10
call sread
; ---------- Вывод сообщения a
mov eax, msg2
call sprint
; ---------- Ввод 'a'
mov ecx,a
mov edx,10
call sread
; ---------- Преобразование 'x' из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'
; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'

; ---------- Записываем 'a' в переменную 'min'

mov ecx, [x]
cmp ecx, [a]
jl cont1

mov eax, 8
mov [ans], eax
jmp fin

cont1:
mov eax, [a]
mov ebx, 2
mul ebx
sub eax, [x]
mov [ans], eax

; ---------- Вывод результата
fin:
mov eax, msg3
call sprint
mov eax,[ans]
call iprintLF ; Вывод
call quit ; Выход
