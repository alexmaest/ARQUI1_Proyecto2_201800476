printString macro singleString
    mov ah, 09h
    lea dx, singleString
    int 21h
endm

printChar macro singleChar
    mov ah, 02h
    mov dl, singleChar
    int 21h
endm

.model small
.stack
.data
    msg0 db 10,13,"******************************************************************************","$"
    msg1 db 10,13,"*                                MENU PRINCIPAL                              *","$"
    msg2 db 10,13,"*                               INGRESAR FUNCION                             *","$"
    msg3 db 10,13,"*                                  GRAFICAR                                  *","$"
    msg4 db 10,13,"*                               METODO DE NEWTON                             *","$"
    msg5 db 10,13,"*                             METODO DE STEFFENSEN                           *","$"
    msg6 db 10,13,"*  1) Ingresar una funcion                                                   *","$"
    msg7 db 10,13,"*  2) Imprimir la funcion almacenada                                         *","$"
    msg8 db 10,13,"*  3) Imprimir derivada de la funcion                                        *","$"
    msg9 db 10,13,"*  4) Imprimir integral de la funcion                                        *","$"
    msg10 db 10,13,"*  5) Graficar                                                               *","$"
    msg11 db 10,13,"*  6) Metodo de Newton                                                       *","$"
    msg12 db 10,13,"*  7) Metodo de Steffensen                                                   *","$"
    msg13 db 10,13,"*  8) Salir                                                                  *","$"
    msg14 db 10,13,"Ingrese una opcion: ","$"
    msg15 db 10,13,"Ingrese el grado de la funcion (1-5): ","$"
    msg16 db 10,13,"Ingrese la funcion: ","$"
    msg17 db 10,13,"La funcion almacenada es: f(x) = ","$"
    msg18 db 10,13,"La derivada es: f'(x) = ","$"
    msg19 db 10,13,"La integral es: Sf(x) = ","$"
    msg20 db 10,13,"Informacion: La funcion ha sido guardada, pulsa una tecla para continuar","$"
    msg21 db 10,13,">> Pulsa una tecla para continuar","$"
    msg22 db 10,13,"Informacion: Has salido del programa","$"
    msg23 db 10,13,"Advertencia: Debe de ingresar una opcion entre 1-8, pulsa una tecla para continuar","$"
    msg24 db 10,13,"Advertencia: Aun no ha ingresado ninguna funcion, pulsa una tecla para continuar","$"
    msg25 db 10,13,"Advertencia: Ha ingresado un caracter incorrecto, pulsa una tecla para continuar","$"
    msg26 db 10,13,"Advertencia: Debe de ingresar una opcion entre 1-5, pulsa una tecla para continuar","$"
    grade db 0
    ;Variables que almacenan la funcion
    nu5_0 db 0 
    nu5_1 db 0 
    sg5 db 0
    nu4_0 db 0 
    nu4_1 db 0 
    sg4 db 0 
    nu3_0 db 0 
    nu3_1 db 0 
    sg3 db 0
    nu2_0 db 0 
    nu2_1 db 0
    sg2 db 0
    nu1_0 db 0 
    nu1_1 db 0 
    sg1 db 0
    nu0_0 db 0 
    nu0_1 db 0 
    sg0 db 0
    ;Variables que almacenan la derivada o integral
    rnu5_0 db 0 
    rnu5_1 db 0 
    rnu4_0 db 0 
    rnu4_1 db 0 
    rnu3_0 db 0 
    rnu3_1 db 0 
    rnu2_0 db 0 
    rnu2_1 db 0
    rnu1_0 db 0 
    rnu1_1 db 0 
    rnu0_0 db 0 
    rnu0_1 db 0 
.code
    main proc
        mov ax, seg @data;Cargar datos al data segment
        mov ds, ax
        menu:;Mostrar el menu
            call cleanScr
            printString msg0
            printString msg1
            printString msg0
            printString msg6
            printString msg7
            printString msg8
            printString msg9
            printString msg10
            printString msg11
            printString msg12
            printString msg13
            printString msg0
            printString msg14 
            
            mov ah, 01h;Solicitar la opcion del menu
            int 21h
            
            ;Comparaciones para saber que opcion se ingreso
            cmp al, 31h 
            je auxOpcion1
            cmp al, 32h 
            je auxOpcion2
            cmp al, 33h 
            je auxOpcion3
            cmp al, 34h 
            je auxOpcion4
            cmp al, 38h 
            je auxOpcion8
            
            printChar 10d;Opcion fuera de rango
            printString msg23
            mov ah, 01h
            int 21h
            jmp menu   

            auxOpcion1:
                jmp opcion1
            auxOpcion2:
                jmp opcion2
            auxOpcion3:
                jmp opcion3
            auxOpcion4:
                jmp opcion4
            auxOpcion8:
                jmp opcion8
                
        opcion1:
            call cleanScr
            printChar 10d  
            printString msg0
            printString msg2
            printString msg0
            printString msg15
            mov ah, 01h;Solicitar grado
            int 21h
            
            mov grade, al
            cmp al, 31h
            je auxOpcion1_1;Ingresar ecuacion grado 1
            cmp al, 32h 
            je auxOpcion1_2;Ingresar ecuacion grado 2
            cmp al, 33h 
            je auxOpcion1_3;Ingresar ecuacion grado 3
            cmp al, 34h 
            je auxOpcion1_4;Ingresar ecuacion grado 4
            cmp al, 35h 
            je auxOpcion1_5;Ingresar ecuacion grado 5
            
            printChar 10d;Opcion fuera de rango 
            printString msg26 
            mov ah, 01h
            int 21h
            call restartVariables
            jmp menu
            
            
            auxOpcion1_1:
                jmp opcion1_1
            auxOpcion1_2:
                jmp opcion1_2
            auxOpcion1_3:
                jmp opcion1_3
            auxOpcion1_4:
                jmp opcion1_4
            auxOpcion1_5:
                jmp opcion1_5
            
            opcion1_5:;Grado 5
                cmp grade, 35h
                jne notwriteText5
                printChar 10d
                printString msg16
                notwriteText5:
                
                call signProof;Solicitar signo 5
                jne fail5
                mov sg5, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 5
                jne fail5
                add al, 30h
                mov nu5_1, al
                
                call numberProof;Solicitar numero menor 5
                jne fail5
                add al, 30h
                mov nu5_0, al
                
                printChar 58h
                printChar 5eh
                printChar 35h
                printChar 20h
                jmp opcion1_4
                
                fail5:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    mov ah, 01h
                    int 21h
                    jmp menu
                
            opcion1_4:;Grado 4
                cmp grade, 34h
                jne notwriteText4
                printChar 10d
                printString msg16
                notwriteText4:
                
                call signProof;Solicitar signo 4
                jne fail4
                mov sg4, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 4
                jne fail4
                add al, 30h
                mov nu4_1, al
                
                call numberProof;Solicitar numero menor 4
                jne fail4
                add al, 30h
                mov nu4_0, al
                
                printChar 58h
                printChar 5eh
                printChar 34h
                printChar 20h
                jmp opcion1_3
                
                fail4:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    mov ah, 01h
                    int 21h
                    jmp menu
                
            opcion1_3:;Grado 3
                cmp grade, 33h
                jne notwriteText3
                printChar 10d
                printString msg16
                notwriteText3:
                
                call signProof;Solicitar signo 3
                jne fail3
                mov sg3, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 3
                jne fail3
                add al, 30h
                mov nu3_1, al
                
                call numberProof;Solicitar numero menor 3
                jne fail3
                add al, 30h
                mov nu3_0, al
                
                printChar 58h
                printChar 5eh
                printChar 33h
                printChar 20h
                jmp opcion1_2
                
                fail3:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    mov ah, 01h
                    int 21h
                    jmp menu
            
            opcion1_2:;Grado 2
                cmp grade, 32h
                jne notwriteText2
                printChar 10d
                printString msg16
                notwriteText2:
                
                call signProof;Solicitar signo 2
                jne fail2
                mov sg2, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 2
                jne fail2
                add al, 30h
                mov nu2_1, al
                
                call numberProof;Solicitar numero menor 2
                jne fail2
                add al, 30h
                mov nu2_0, al
                
                printChar 58h
                printChar 5eh
                printChar 32h
                printChar 20h
                jmp opcion1_1
                
                fail2:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    mov ah, 01h
                    int 21h
                    jmp menu
            
            opcion1_1:;Grado 1
                cmp grade, 31h
                jne notwriteText1
                printChar 10d
                printString msg16
                notwriteText1:
                
                call signProof;Solicitar signo 1
                jne fail1
                mov sg1, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 1
                jne fail1
                add al, 30h
                mov nu1_1, al
                
                call numberProof;Solicitar numero menor 1
                jne fail1
                add al, 30h
                mov nu1_0, al
                
                printChar 58h
                printChar 5eh
                printChar 31h
                printChar 20h
                
                call signProof;Solicitar signo 0
                jne fail1
                mov sg0, al
                printChar 20h
                
                call numberProof;Solicitar numero mayor 0
                jne fail1
                add al, 30h
                mov nu0_1, al
                
                call numberProof;Solicitar numero menor 0
                jne fail1
                add al, 30h
                mov nu0_0, al
                
                printChar 10d
                printString msg20
                mov ah, 01h
                int 21h
                jmp menu
                
                fail1:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    mov ah, 01h
                    int 21h
                    jmp menu
            
                
        opcion2:
            ;Comparacion para saber si ya ingreso una funcion
            cmp grade, 00h
            je auxFail2_2
            jmp notFail2_2
            
            auxFail2_2:
                jmp fail2_2
            notFail2_2:
            
            printChar 10d
            printString msg17
            
            cmp grade, 35h
            je auxWrite5
            cmp grade, 34h
            je auxWrite4
            cmp grade, 33h
            je auxWrite3
            cmp grade, 32h
            je auxWrite2
            cmp grade, 31h
            je auxWrite1
            
            auxWrite5:
                jmp write5
            auxWrite4:
                jmp write4
            auxWrite3:
                jmp write3
            auxWrite2:
                jmp write2
            auxWrite1:
                jmp write1
            
            write5:
            printChar sg5
            printChar 20h
            printChar nu5_1
            printChar nu5_0
            printChar 58h
            printChar 5eh
            printChar 35h
            
            write4:
            printChar 20h
            printChar sg4
            printChar 20h
            printChar nu4_1
            printChar nu4_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            write3:
            printChar 20h
            printChar sg3
            printChar 20h
            printChar nu3_1
            printChar nu3_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            write2:
            printChar 20h
            printChar sg2
            printChar 20h
            printChar nu2_1
            printChar nu2_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            write1:
            printChar 20h
            printChar sg1
            printChar 20h
            printChar nu1_1
            printChar nu1_0
            printChar 58h
            printChar 5eh
            printChar 31h
            printChar 20h
            printChar sg0
            printChar 20h
            printChar nu0_1 
            printChar nu0_0
            printChar 10d
            printString msg21
            mov ah, 01h
            int 21h 

            jmp menu
            
            fail2_2:
                printChar 10d
                printString msg24
                mov ah, 01h
                int 21h
                jmp menu
        
        opcion3:
            ;Comparacion para saber si ya ingreso una funcion
            cmp grade, 00h
            je auxFail3_3
            jmp notFail3_3
            
            auxFail3_3:
                jmp fail3_3
            notFail3_3:
            
            printChar 10d
            printString msg18
            
            cmp grade, 35h
            je auxDWrite5
            cmp grade, 34h
            je auxDWrite4
            cmp grade, 33h
            je auxDWrite3
            cmp grade, 32h
            je auxDWrite2
            cmp grade, 31h
            je auxDWrite1
            
            auxDWrite5:
                jmp dWrite5
            auxDWrite4:
                jmp dWrite4
            auxDWrite3:
                jmp dWrite3
            auxDWrite2:
                jmp dWrite2
            auxDWrite1:
                jmp dWrite1
            
            dWrite5:
            printChar sg5
            printChar 20h
            mov al, nu5_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu5_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 05d
            mul bl;Se multiplica por el exponente 5
            
            aam;Retorna la multiplicacion con valores asignados en ax
            mov cx, ax
            mov rnu5_1, ch
            mov rnu5_0, cl
            add rnu5_1, 30h
            add rnu5_0, 30h
            printChar rnu5_1
            printChar rnu5_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            dWrite4:
            printChar 20h
            printChar sg4
            printChar 20h
            mov al, nu4_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu4_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 04d
            mul bl;Se multiplica por el exponente 4
            
            aam;Retorna la multiplicacion con valores asignados en ax
            mov cx, ax
            mov rnu4_1, ch
            mov rnu4_0, cl
            add rnu4_1, 30h
            add rnu4_0, 30h
            printChar rnu4_1
            printChar rnu4_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            dWrite3:
            printChar 20h
            printChar sg3
            printChar 20h
            mov al, nu3_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu3_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 03d
            mul bl;Se multiplica por el exponente 3
            
            aam;Retorna la multiplicacion con valores asignados en ax
            mov cx, ax
            mov rnu3_1, ch
            mov rnu3_0, cl
            add rnu3_1, 30h
            add rnu3_0, 30h
            printChar rnu3_1
            printChar rnu3_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            dWrite2:
            printChar 20h
            printChar sg2
            printChar 20h
            mov al, nu2_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu2_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 02d
            mul bl;Se multiplica por el exponente 2
            
            aam;Retorna la multiplicacion con valores asignados en ax
            mov cx, ax
            mov rnu2_1, ch
            mov rnu2_0, cl
            add rnu2_1, 30h
            add rnu2_0, 30h
            printChar rnu2_1
            printChar rnu2_0
            printChar 58h
            printChar 5eh
            printChar 31h
            
            dWrite1:
            printChar 20h
            printChar sg1
            printChar 20h
            mov al, nu1_1;Valores se multiplican por 1, solo se transfieren
            mov rnu1_1, al
            
            mov al, nu1_0
            mov rnu1_0, al
            printChar rnu1_1
            printChar rnu1_0
            printChar 10d
            printString msg21
            mov ah, 01h
            int 21h
            jmp menu
            
            fail3_3:
                printChar 10d
                printString msg24
                mov ah, 01h
                int 21h
                jmp menu
        
        opcion4:
            ;Comparacion para saber si ya ingreso una funcion
            cmp grade, 00h
            je auxFail4_4
            jmp notFail4_4
            
            auxFail4_4:
                jmp fail4_4
            notFail4_4:
            
            printChar 10d
            printString msg19
            
            cmp grade, 35h
            je auxIWrite5
            cmp grade, 34h
            je auxIWrite4
            cmp grade, 33h
            je auxIWrite3
            cmp grade, 32h
            je auxIWrite2
            cmp grade, 31h
            je auxIWrite1
            
            auxIWrite5:
                jmp iWrite5
            auxIWrite4:
                jmp iWrite4
            auxIWrite3:
                jmp iWrite3
            auxIWrite2:
                jmp iWrite2
            auxIWrite1:
                jmp iWrite1
            
            iWrite5:
            printChar sg5
            printChar 20h
            mov al, nu5_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu5_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 06d
            div bl;Se divide por el exponente 6
            
            aam;Retorna la division con valores asignados en ax
            mov cx, ax
            mov rnu5_1, ch
            mov rnu5_0, cl
            add rnu5_1, 30h
            add rnu5_0, 30h
            printChar rnu5_1
            printChar rnu5_0
            printChar 58h
            printChar 5eh
            printChar 36h
            
            iWrite4:
            printChar 20h
            printChar sg4
            printChar 20h
            mov al, nu4_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu4_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 05d
            div bl;Se divide por el exponente 5
            
            aam;Retorna la division con valores asignados en ax
            mov cx, ax
            mov rnu4_1, ch
            mov rnu4_0, cl
            add rnu4_1, 30h
            add rnu4_0, 30h
            printChar rnu4_1
            printChar rnu4_0
            printChar 58h
            printChar 5eh
            printChar 35h
            
            iWrite3:
            printChar 20h
            printChar sg3
            printChar 20h
            mov al, nu3_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu3_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 04d
            div bl;Se divide por el exponente 4
            
            aam;Retorna la division con valores asignados en ax
            mov cx, ax
            mov rnu3_1, ch
            mov rnu3_0, cl
            add rnu3_1, 30h
            add rnu3_0, 30h
            printChar rnu3_1
            printChar rnu3_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            iWrite2:
            printChar 20h
            printChar sg2
            printChar 20h
            mov al, nu2_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu2_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 03d
            div bl;Se divide por el exponente 3
            
            aam;Retorna la division con valores asignados en ax
            mov cx, ax
            mov rnu2_1, ch
            mov rnu2_0, cl
            add rnu2_1, 30h
            add rnu2_0, 30h
            printChar rnu2_1
            printChar rnu2_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            iWrite1:
            printChar 20h
            printChar sg1
            printChar 20h
            mov al, nu1_1;Se mueve el valor mas significativo 
            sub al, 30h
            mov ch, al
            
            mov al, nu1_0;Se mueve el valor menos significativo 
            sub al, 30h
            mov cl, al
            
            mov ax, cx
            aad;Se convierten a hexadecimales para operar
            
            mov bl, 02d
            div bl;Se divide por el exponente 2
            
            aam;Retorna la division con valores asignados en ax
            mov cx, ax
            mov rnu1_1, ch
            mov rnu1_0, cl
            add rnu1_1, 30h
            add rnu1_0, 30h
            printChar rnu1_1
            printChar rnu1_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            printChar 20h
            printChar sg0
            printChar 20h
            mov al, nu0_1;Valores se dividen por 1, solo se transfieren
            mov rnu0_1, al
            
            mov al, nu0_0
            mov rnu0_0, al
            printChar rnu0_1
            printChar rnu0_0
            printChar 58h
            printChar 5eh
            printChar 31h
            printChar 20h
            printChar 2bh
            printChar 20h
            printChar 43h
            
            printChar 10d
            printString msg21
            mov ah, 01h
            int 21h
            jmp menu
            
            fail4_4:
                printChar 10d
                printString msg24
                mov ah, 01h
                int 21h
                jmp menu
                
        opcion8:
            printChar 10d
            printString msg22
            printChar 10d
            mov ax,4c00h;Salir del programa
            int 21h
        .exit
    main endp
    
    cleanScr proc;Limpiar consola
        mov ah, 06h
        mov al, 00h
        mov bh, 12h;Color de pantalla, color de texto
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0000h
        int 10h
        ret
    cleanScr endp
    
    restartVariables proc;Reiniciar variables en caso de caracter no valido
        mov grade, 00h
        ret
    restartVariables endp
    
    signProof proc;Solicitar signo y verificarlo
        mov ah, 01h
        int 21h
        cmp al, 2bh
        je notFails
        cmp al, 2dh
        notFails:
        ret
    signProof endp
    
    numberProof proc;Solicitar numero y verificarlo
        mov ah, 01h
        int 21h
        sub al, 30h
        cmp al, 0d
        je notFails2
        cmp al, 1d
        je notFails2
        cmp al, 2d
        je notFails2
        cmp al, 3d
        je notFails2
        cmp al, 4d
        je notFails2
        cmp al, 5d
        je notFails2
        cmp al, 6d
        je notFails2
        cmp al, 7d
        je notFails2
        cmp al, 8d
        je notFails2
        cmp al, 9d
        notFails2:
        ret
    numberProof endp
    
end main
