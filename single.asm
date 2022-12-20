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
    msg0 db 10,13,"*****************************************************************","$"
    msg1 db 10,13,"*                         MENU PRINCIPAL                        *","$"
    msg2 db 10,13,"*                        INGRESAR FUNCION                       *","$"
    msg3 db 10,13,"*                            GRAFICAR                           *","$"
    msg4 db 10,13,"*                        METODO DE NEWTON                       *","$"
    msg5 db 10,13,"*                      METODO DE STEFFENSEN                     *","$"
    msg6 db 10,13,"*  1) Ingresar una funcion                                      *","$"
    msg7 db 10,13,"*  2) Imprimir la funcion almacenada                            *","$"
    msg8 db 10,13,"*  3) Imprimir derivada de la funcion                           *","$"
    msg9 db 10,13,"*  4) Imprimir integral de la funcion                           *","$"
    msg10 db 10,13,"*  5) Graficar                                                  *","$"
    msg11 db 10,13,"*  6) Metodo de Newton                                          *","$"
    msg12 db 10,13,"*  7) Metodo de Steffensen                                      *","$"
    msg13 db 10,13,"*  8) Salir                                                     *","$"
    msg14 db 10,13,"Ingrese una opcion: ","$"
    msg15 db 10,13,"Ingrese el grado de la funcion (1-5): ","$"
    msg16 db 10,13,"Ingrese la funcion: ","$"
    msg17 db 10,13,"La funcion almacenada es: f(x)=","$"
    msg23 db 10,13,"Advertencia: Debe de ingresar una opcion entre 1-8","$"
    msg24 db 10,13,"Advertencia: Aun no ha ingresado ninguna funcion","$"
    msg25 db 10,13,"Advertencia: Ha ingresado un caracter incorrecto","$"
    msg26 db 10,13,"Advertencia: Debe de ingresar una opcion entre 1-5","$"
    grade db 0
    nu5_0 db 0 
    nu5_1 db 0 
    ex5 db 0
    sg5 db 0
    nu4_0 db 0 
    nu4_1 db 0 
    ex4 db 0
    sg4 db 0 
    nu3_0 db 0 
    nu3_1 db 0 
    ex3 db 0 
    sg3 db 0
    nu2_0 db 0 
    nu2_1 db 0
    ex2 db 0 
    sg2 db 0
    nu1_0 db 0 
    nu1_1 db 0 
    ex1 db 0 
    sg1 db 0
    nu0_0 db 0 
    nu0_1 db 0 
    ex0 db 0
    sg0 db 0
.code
    main proc
        mov ax, seg @data;Cargar datos al data segment
        mov ds, ax
        menu:;Mostrar el menu
            printString msg0
            printString msg1
            printString msg0
            printString msg6
            printString msg7
            printString msg8
            printString msg9
            printString msg10
            printString msG11
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
            
            printChar 10d;Opcion fuera de rango
            printString msg23
            printChar 10d 
            jmp menu   

            auxOpcion1:
                jmp opcion1
            auxOpcion2:
                jmp opcion2
        opcion1:
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
            printChar 10d
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
                jmp opcion1_4
                
                fail5:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    printChar 10d
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
                jmp opcion1_3
                
                fail4:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    printChar 10d
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
                jmp opcion1_2
                
                fail3:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    printChar 10d
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
                jmp opcion1_1
                
                fail2:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    printChar 10d
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
                
                call signProof;Solicitar signo 0
                jne fail1
                mov sg0, al
                
                call numberProof;Solicitar numero mayor 0
                jne fail1
                add al, 30h
                mov nu0_1, al
                
                call numberProof;Solicitar numero menor 0
                jne fail1
                add al, 30h
                mov nu0_0, al
                
                printChar 10d
                
                jmp menu
                
                fail1:;Error char ingresado incorrecto
                    call restartVariables
                    printChar 10d
                    printString msg25
                    printChar 10d
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
            printChar nu5_1
            printChar nu5_0
            printChar 58h
            printChar 5eh
            printChar 35h
            
            write4:
            printChar sg4
            printChar nu4_1
            printChar nu4_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            write3:
            printChar sg3
            printChar nu3_1
            printChar nu3_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            write2:
            printChar sg2
            printChar nu2_1
            printChar nu2_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            write1:
            printChar sg1
            printChar nu1_1
            printChar nu1_0
            printChar 58h
            printChar 5eh
            printChar 31h
            printChar sg0
            printChar nu0_1 
            printChar nu0_0  
            printChar 10d 

            jmp menu
            
            fail2_2:
                printChar 10d
                printString msg24
                printChar 10d
                jmp menu
        
        .exit
    main endp
    
    restartVariables proc;Reiniciar variables en caso de caracter no valido
        mov grade, 00h
        ret
    endp
    
    signProof proc;Solicitar signo y verificarlo
        mov ah, 01h
        int 21h
        cmp al, 2bh
        je notFails
        cmp al, 2dh
        notFails:
        ret
    endp
    
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
    endp
    
end main
