section .data
    EXIT_OPTION equ 1
    IN_OPTION equ 3
    OUT_OPTION equ 4

    STD_IN equ 0
    STD_OUT equ 1

    EXIT_RETURN equ 0
    LINE_BREAK equ 0xA
    STRING_END equ 0xd

    OPERATION equ 0x80 ;128

    name_max_size equ 0xA

    messenger db 'Hi, what is your name?', LINE_BREAK, STRING_END
    messenger_size equ $- messenger

    hi db 'Hi! '
    hi_size equ $- hi

    ntmy db 'nice too meet you!', LINE_BREAK, STRING_END
    ntmy_size equ $- ntmy


    
section .bss
    name resb 1
section .text
    global _start

    end:
        mov eax, EXIT_OPTION
        mov ebx, EXIT_RETURN
        int OPERATION
        ret

    print:
         mov eax, OUT_OPTION
         mov ebx, STD_OUT
         int OPERATION
         ret

    scan_tem:
        mov eax, IN_OPTION
        mov ebx, STD_IN
        int OPERATION
        ret

    _start:
        mov ecx, messenger
        mov edx, messenger_size
        call print

        mov ecx, name
        mov edx, name_max_size
        call scan_tem


        mov ecx,  hi
        mov edx, hi_size
        call print 

        mov ecx, name
        mov edx, name_max_size
        call print 

        mov ecx, ntmy
        mov edx, ntmy_size
        call print 

        call end
