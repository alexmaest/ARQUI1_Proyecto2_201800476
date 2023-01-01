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

printDot macro coorX, coorY
    mov ah, 02h
    mov bh, 00h
    mov dh, coorY;Fila
    mov dl, coorX;Columna
    int 10h
    printChar 219d
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
    msg27 db 10,13,"*  1) Graficar funcion                                                       *","$"
    msg28 db 10,13,"*  2) Graficar derivada                                                      *","$"
    msg29 db 10,13,"*  3) Graficar integral                                                      *","$"
    msg30 db 10,13,"*  4) Regresar                                                               *","$"
    msg31 db 10,13,"Ingrese el rango menor: ","$"
    msg32 db 10,13,"Ingrese el rango mayor: ","$"
    msg33 db 10,13,"<< Pulsa una tecla para regresar","$"
    msg34 db 10,13,"Advertencia: El segundo rango debe de ser mayor al primero","$"
    msg35 db 10,13,"Ingrese el numero de iteraciones maximo: ","$"
    msg36 db 10,13,"Ingrese el coeficiente de tolerancia: ","$"
    msg37 db 10,13,"Ingrese el grado de tolerancia: ","$"
    msg38 db 10,13,"Ingrese el limite inferior: ","$"
    msg39 db 10,13,"Ingrese el limite superior: ","$"
    msg40 db 10,13,"Iteracion = ","$"
    msg41 db 10,13,"Xn = ","$"
    msg42 db 10,13,"Error = ","$"
    msg43 db 10,13,"Xn+1 = ","$"
    msg44 db 10,13,"______________________________________________________________________________","$"
    msg45 db 10,13,"Informacion: La solucion es Xn = ","$"
    msg46 db " con un error de ","$"
    grade db 0
    auxGrade db 0
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
    ;Variables que almacenan un resultado
    rSign6 db 0
    rnu6_0 db 0 
    rnu6_1 db 0
    rSign5 db 0
    rnu5_0 db 0 
    rnu5_1 db 0
    rSign4 db 0 
    rnu4_0 db 0 
    rnu4_1 db 0 
    rSign3 db 0
    rnu3_0 db 0 
    rnu3_1 db 0 
    rSign2 db 0
    rnu2_0 db 0 
    rnu2_1 db 0
    rSign1 db 0
    rnu1_0 db 0 
    rnu1_1 db 0 
    rSign0 db 0
    rnu0_0 db 0 
    rnu0_1 db 0
    ;Variables que guardan el resultado temporal de una evaluacion
    gSign db 0
    gRes_0 db 0
    gRes_1 db 0
    evalSign db 0
    eval_0 db 0
    eval_1 db 0
    signCoef db 0
    coef_0 db 0
    coef_1 db 0
    termExp db 0
    signTerm db 0
    term_0 db 0
    term_1 db 0
    menSign db 0
    rMen_0 db 0
    rMen_1 db 0
    maySign db 0
    rMay_0 db 0
    rMay_1 db 0
    cont db 0
    signCont db 0
    singleCont db 0
    isIntegral db 0
    ;Variables de metodos numericos
    iterationCont db 0
    iter_1 db 0
    iter_0 db 0
    cTol_1 db 0
    cTol_0 db 0
    gTol_1 db 0
    gTol_0 db 0
    fResSign db 0
    fRes_1 db 0
    fRes_0 db 0
    dResSign db 0
    dRes_1 db 0
    dRes_0 db 0
    errorSign db 0
    error_1 db 0
    error_0 db 0
    letterCont db 0
    methodOne db 0
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
            cmp al, 35h 
            je auxOpcion5
            cmp al, 36h
            mov methodOne, 00d
            je auxOpcion6
            cmp al, 37h 
            mov methodOne, 01d
            je auxOpcion6
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
            auxOpcion5:
                jmp opcion5
            auxOpcion6:
                jmp opcion6
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
            
            call calculateDer;Se calcula la derivada
            
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
            printChar rnu5_1
            printChar rnu5_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            dWrite4:
            printChar 20h
            printChar sg4
            printChar 20h
            printChar rnu4_1
            printChar rnu4_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            dWrite3:
            printChar 20h
            printChar sg3
            printChar 20h
            printChar rnu3_1
            printChar rnu3_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            dWrite2:
            printChar 20h
            printChar sg2
            printChar 20h
            printChar rnu2_1
            printChar rnu2_0
            printChar 58h
            printChar 5eh
            printChar 31h
            
            dWrite1:
            printChar 20h
            printChar sg1
            printChar 20h
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
            
            call calculateInt;Se calcula la integral
            
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
            printChar rnu5_1
            printChar rnu5_0
            printChar 58h
            printChar 5eh
            printChar 36h
            
            iWrite4:
            printChar 20h
            printChar sg4
            printChar 20h
            printChar rnu4_1
            printChar rnu4_0
            printChar 58h
            printChar 5eh
            printChar 35h
            
            iWrite3:
            printChar 20h
            printChar sg3
            printChar 20h
            printChar rnu3_1
            printChar rnu3_0
            printChar 58h
            printChar 5eh
            printChar 34h
            
            iWrite2:
            printChar 20h
            printChar sg2
            printChar 20h
            printChar rnu2_1
            printChar rnu2_0
            printChar 58h
            printChar 5eh
            printChar 33h
            
            iWrite1:
            printChar 20h
            printChar sg1
            printChar 20h
            printChar rnu1_1
            printChar rnu1_0
            printChar 58h
            printChar 5eh
            printChar 32h
            
            printChar 20h
            printChar sg0
            printChar 20h
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
        opcion5:
            ;Comparacion para saber si ya ingreso una funcion
            mov isIntegral, 00h
            cmp grade, 00h
            je auxFail5_5
            jmp notFail5_5
            
            auxFail5_5:
                jmp fail5_5
            notFail5_5:
            
            mov rMen_1, 00h
            mov rMen_0, 00h
            mov menSign, 00h
            mov rMay_1, 00h
            mov rMay_0, 00h
            mov maySign, 00h
            
            call cleanScr
            printChar 10d  
            printString msg0
            printString msg3
            printString msg0
            printString msg27
            printString msg28
            printString msg29
            printString msg30
            printString msg0
            printString msg14
            mov ah, 01h;Solicitar opcion
            int 21h
            
            cmp al, 31h
            je auxOpcion5_1;Graficar funcion
            cmp al, 32h
            je auxOpcion5_2;Graficar derivada
            cmp al, 33h 
            je auxOpcion5_3;Graficar integral
            cmp al, 34h 
            je auxOpcion5_4;Regresar
            
            printChar 10d;Opcion fuera de rango 
            printString msg26 
            mov ah, 01h
            int 21h
            jmp opcion5
            
            auxOpcion5_1:
                jmp opcion5_1
            auxOpcion5_2:
                jmp opcion5_2
            auxOpcion5_3:
                jmp opcion5_3
            auxOpcion5_4:
                jmp menu
                
            opcion5_1:;Graficar funcion
                mov bl, grade
                mov auxGrade, bl
                mov bl, sg5
                mov rSign5, bl
                mov bl, nu5_0
                mov rnu5_0, bl
                mov bl, nu5_1
                mov rnu5_1, bl
                
                mov bl, sg4
                mov rSign4, bl
                mov bl, nu4_0
                mov rnu4_0, bl
                mov bl, nu4_1
                mov rnu4_1, bl
                
                mov bl, sg3
                mov rSign3, bl
                mov bl, nu3_0
                mov rnu3_0, bl
                mov bl, nu3_1
                mov rnu3_1, bl
                
                mov bl, sg2
                mov rSign2, bl
                mov bl, nu2_0
                mov rnu2_0, bl
                mov bl, nu2_1
                mov rnu2_1, bl
                
                mov bl, sg1
                mov rSign1, bl
                mov bl, nu1_0
                mov rnu1_0, bl
                mov bl, nu1_1
                mov rnu1_1, bl
                
                mov bl, sg0
                mov rSign0, bl
                mov bl, nu0_0
                mov rnu0_0, bl
                mov bl, nu0_1
                mov rnu0_1, bl
                jmp singleElection
            opcion5_2:;Graficar derivada
                call calculateDer;Se calcula la derivada
                
                mov bl, grade;Se resta 1 al grado original
                sub bl, 01h
                mov auxGrade, bl
                
                mov bl, rSign1
                mov rSign0, bl
                mov bl, rnu1_0
                mov rnu0_0, bl
                mov bl, rnu1_1
                mov rnu0_1, bl
                
                mov bl, rSign2
                mov rSign1, bl
                mov bl, rnu2_0
                mov rnu1_0, bl
                mov bl, rnu2_1
                mov rnu1_1, bl
                
                mov bl, rSign3
                mov rSign2, bl
                mov bl, rnu3_0
                mov rnu2_0, bl
                mov bl, rnu3_1
                mov rnu2_1, bl
                
                mov bl, rSign4
                mov rSign3, bl
                mov bl,rnu4_0
                mov rnu3_0, bl
                mov bl, rnu4_1
                mov rnu3_1, bl
                
                mov bl, rSign5
                mov rSign4, bl
                mov bl, rnu5_0
                mov rnu4_0, bl
                mov bl, rnu5_1
                mov rnu4_1, bl
                
                jmp singleElection
            opcion5_3:;Graficar integral
                call calculateInt;Se calcula la integral
                
                mov bl, grade;Se agrega 1 al grado original
                add bl, 01h
                mov auxGrade, bl
                
                mov isIntegral, 01d;Se asigna este valor para no operar el x^0
                
                mov bl, rSign5
                mov rSign6, bl
                mov bl, rnu5_0
                mov rnu6_0, bl
                mov bl, rnu5_1
                mov rnu6_1, bl
                
                mov bl, rSign4
                mov rSign5, bl
                mov bl, rnu4_0
                mov rnu5_0, bl
                mov bl, rnu4_1
                mov rnu5_1, bl
            
                mov bl, rSign3
                mov rSign4, bl
                mov bl, rnu3_0
                mov rnu4_0, bl
                mov bl, rnu3_1
                mov rnu4_1, bl
                
                mov bl, rSign2
                mov rSign3, bl
                mov bl, rnu2_0
                mov rnu3_0, bl
                mov bl, rnu2_1
                mov rnu3_1, bl
                
                mov bl, rSign1
                mov rSign2, bl
                mov bl, rnu1_0
                mov rnu2_0, bl
                mov bl, rnu1_1
                mov rnu2_1, bl
                
                mov bl, rSign0
                mov rSign1, bl
                mov bl, rnu0_0
                mov rnu1_0, bl
                mov bl, rnu0_1
                mov rnu1_1, bl
                
            singleElection:
            printChar 10d
            printString msg31
            call signProof;Solicitar signo Rango menor
            jne failChar
            mov menSign, al
                
            call numberProof;Solicitar numero mayor Rango menor
            jne failChar
            add al, 30h
            mov rMen_1, al
                
            call numberProof;Solicitar numero menor Rango menor
            jne failChar
            add al, 30h
            mov rMen_0, al
            printChar 10d
            
            printString msg32
            call signProof;Solicitar signo Rango mayor
            jne failChar
            mov maySign, al
                
            call numberProof;Solicitar numero mayor Rango mayor
            jne failChar
            add al, 30h
            mov rMay_1, al
                
            call numberProof;Solicitar numero menor Rango mayor
            jne failChar
            add al, 30h
            mov rMay_0, al
            printChar 10d
            jmp notFail
            failChar:;Error char ingresado incorrecto
                printChar 10d
                printString msg25
                mov ah, 01h
                int 21h
                jmp opcion5
            
            notFail:
            mov ah, rMen_1
            mov al, rMen_0
            aad
            mov cl, al
            mov ah, rMay_1
            mov al, rMay_0
            aad
            
            cmp menSign, 2dh;Signo menos
            je gisSingleMinus
            jmp gisSinglePlus
            
            gisSingleMinus:
            cmp maySign, 2dh;Signo menos
            je gisSingleMinus1
            jmp gisSingleMinus2
            
                gisSingleMinus1:;Caso 4
                cmp cl, al
                jc failRange
                jmp success
                gisSingleMinus2:;Caso 2
                jmp success
                
            gisSinglePlus:
            cmp maySign, 2dh;Signo menos
            je gisSinglePlus1
            jmp gisSinglePlus2
            
                gisSinglePlus1:;Caso 3
                jmp failRange
                gisSinglePlus2:;Caso 1
                cmp cl, al
                jc success
                jmp failRange
                
            failRange:
                printChar 10d;Rangos incorrectos 
                printString msg34
                mov ah, 01h
                int 21h
                jmp opcion5
                
            success:
            call drawAxis;Dibujar los ejes x, y
            
            mov bl, menSign
            mov signCont, bl
            mov ah, rMen_1
            mov al, rMen_0
            sub ah, 30h
            sub al, 30h
            aad
            mov singleCont, al
            
            eqLoop:
            mov bl, signCont
            mov evalSign, bl
            
            mov al, singleCont
            aam
            ;Cargando datos al valor a evaluar
            mov cx, ax
            add ch, 30h
            add cl, 30h
            mov eval_1, ch
            mov eval_0, cl
           
            call calculateEQ;Retorna resultado de evaluar en una ecuacion
            
            call graphDot;Calcula la posicion a graficar
                    
            printChar 28h;Imprimir coordenadas
            add singleCont, 30h
            printChar signCont
            printChar singleCont
            printChar 2ch
            printChar gSign
            printChar gRes_1
            printChar gRes_0
            printChar 29h
            sub singleCont, 30h
                    
            mov ah, rMay_1;Comparaciones para comprobar si ya se evaluo todo lo solicitado
            mov al, rMay_0
            sub ah, 30h
            sub al, 30h
            aad
            cmp singleCont, al
            je eqFinish
            notFinish:
            cmp signCont, 2dh
            je isRest
            add singleCont, 01d
            jmp eqLoop
            isRest:
            sub singleCont, 01d
                    
            cmp singleCont, 00d
            je isCero
            jmp isNotCero
            isCero:
            mov signCont, 2bh
            isNotCero:
            auxeqLoop:
            jmp eqLoop
            eqFinish:
            mov bl, maySign
            cmp signCont, bl
            jne notFinish
                    
            mov ah, 02h
            mov bh, 00h
            mov dh, 00d;Fila
            mov dl, 00d;Columna
            int 10h
            printString msg33
            mov ah, 01h
            int 21h
            jmp menu
            
            fail5_5:
                printChar 10d
                printString msg24
                mov ah, 01h
                int 21h
                jmp menu
        
        
        opcion6:
            ;Comparacion para saber si ya ingreso una funcion
            cmp grade, 00h
            je auxFail6_6
            jmp notFail6_6 
            
            auxFail6_6:
                jmp fail6_6
            notFail6_6:
            
            mov rMen_1, 00h
            mov rMen_0, 00h
            mov menSign, 00h
            mov rMay_1, 00h
            mov rMay_0, 00h
            mov maySign, 00h
            
            call cleanScr
            printChar 10d  
            printString msg0
            cmp methodOne, 00d
            je printOtherOne
            printString msg5
            jmp alreadyPrint
            printOtherOne:
            printString msg4
            alreadyPrint:
            printString msg0
            
            printString msg35
            mov ah, 01h;Solicitar numero de iteraciones
            int 21h
            mov iter_1, al
            mov ah, 01h
            int 21h
            mov iter_0, al
            
            printString msg36
            mov ah, 01h;Solicitar Coeficiente de tolerancia
            int 21h
            mov cTol_1, al
            mov ah, 01h
            int 21h
            mov cTol_0, al
            printString msg37
            mov ah, 01h;Solicitar Grado de tolerancia
            int 21h
            mov gTol_1, al
            mov ah, 01h
            int 21h
            mov gTol_0, al
            
            printString msg38;Solicitar Limite inferior
            call signProof;Solicitar signo Rango menor
            jne failChar2
            mov menSign, al
                
            call numberProof;Solicitar numero mayor Rango menor
            jne failChar2
            add al, 30h
            mov rMen_1, al
                
            call numberProof;Solicitar numero menor Rango menor
            jne failChar2
            add al, 30h
            mov rMen_0, al
            
            printString msg39;Solicitar Limite superior
            call signProof;Solicitar signo Rango mayor
            jne failChar2
            mov maySign, al
                
            call numberProof;Solicitar numero mayor Rango mayor
            jne failChar2
            add al, 30h
            mov rMay_1, al
                
            call numberProof;Solicitar numero menor Rango mayor
            jne failChar2
            add al, 30h
            mov rMay_0, al
            printChar 10d
            
            jmp notFail2
            failChar2:;Error char ingresado incorrecto
                printChar 10d
                printString msg25
                mov ah, 01h
                int 21h
                jmp opcion6
            
            notFail2:
            mov ah, rMen_1
            mov al, rMen_0
            aad
            mov cl, al
            mov ah, rMay_1
            mov al, rMay_0
            aad
            
            cmp menSign, 2dh;Signo menos
            je gisSingleMinus3
            jmp gisSinglePlus3
            
            gisSingleMinus3:
            cmp maySign, 2dh;Signo menos
            je gisSingleMinus31
            jmp gisSingleMinus32
            
                gisSingleMinus31:;Caso 4
                cmp cl, al
                jc failRange3
                jmp success3
                gisSingleMinus32:;Caso 2
                jmp success3
                
            gisSinglePlus3:
            cmp maySign, 2dh;Signo menos
            je gisSinglePlus31
            jmp gisSinglePlus32
            
                gisSinglePlus31:;Caso 3
                jmp failRange3
                gisSinglePlus32:;Caso 1
                cmp cl, al
                jc success3
                jmp failRange3
                
            failRange3:
                printChar 10d;Rangos incorrectos 
                printString msg34
                mov ah, 01h
                int 21h
                jmp opcion6
                
            success3:
            
            mov iterationCont, 00d
            iterationLoop:
            call cleanScr
            printChar 10d  
            printString msg0
            cmp methodOne, 00d
            je printOtherOne2
            printString msg5
            jmp alreadyPrint2
            printOtherOne2:
            printString msg4
            alreadyPrint2:
            printString msg0
            
            printString msg40
            mov bl, iterationCont
            add bl, 31h
            printChar bl
            
            printString msg41
            printChar menSign
            printChar rMen_1
            printChar rMen_0
            call generateTol

            ;Cargando datos al valor a evaluar
            mov bl, menSign
            mov evalSign, bl

            mov ch, rMen_1
            mov eval_1, ch
            mov cl, rMen_0
            mov eval_0, cl
            
                ;Evaluar funcion
                mov bl, grade
                mov auxGrade, bl
                mov bl, sg5
                mov rSign5, bl
                mov bl, nu5_0
                mov rnu5_0, bl
                mov bl, nu5_1
                mov rnu5_1, bl
                
                mov bl, sg4
                mov rSign4, bl
                mov bl, nu4_0
                mov rnu4_0, bl
                mov bl, nu4_1
                mov rnu4_1, bl
                
                mov bl, sg3
                mov rSign3, bl
                mov bl, nu3_0
                mov rnu3_0, bl
                mov bl, nu3_1
                mov rnu3_1, bl
                
                mov bl, sg2
                mov rSign2, bl
                mov bl, nu2_0
                mov rnu2_0, bl
                mov bl, nu2_1
                mov rnu2_1, bl
                
                mov bl, sg1
                mov rSign1, bl
                mov bl, nu1_0
                mov rnu1_0, bl
                mov bl, nu1_1
                mov rnu1_1, bl
                
                mov bl, sg0
                mov rSign0, bl
                mov bl, nu0_0
                mov rnu0_0, bl
                mov bl, nu0_1
                mov rnu0_1, bl
            
            call calculateEQ;Retorna resultado de evaluar en una ecuacion
            
            ;printChar gSign
            ;printChar gRes_1
            ;printChar gRes_0
            
            mov bl, gSign
            mov fResSign, bl
            mov bl, gRes_1
            mov fRes_1, bl
            mov bl, gRes_0
            mov fRes_0, bl
            
            call calculateDer;Se calcula la derivada
                
                mov bl, grade;Se resta 1 al grado original
                sub bl, 01h
                mov auxGrade, bl
                
                mov bl, rSign1
                mov rSign0, bl
                mov bl, rnu1_0
                mov rnu0_0, bl
                mov bl, rnu1_1
                mov rnu0_1, bl
                
                mov bl, rSign2
                mov rSign1, bl
                mov bl, rnu2_0
                mov rnu1_0, bl
                mov bl, rnu2_1
                mov rnu1_1, bl
                
                mov bl, rSign3
                mov rSign2, bl
                mov bl, rnu3_0
                mov rnu2_0, bl
                mov bl, rnu3_1
                mov rnu2_1, bl
                
                mov bl, rSign4
                mov rSign3, bl
                mov bl,rnu4_0
                mov rnu3_0, bl
                mov bl, rnu4_1
                mov rnu3_1, bl
                
                mov bl, rSign5
                mov rSign4, bl
                mov bl, rnu5_0
                mov rnu4_0, bl
                mov bl, rnu5_1
                mov rnu4_1, bl
                
            call calculateEQ;Retorna resultado de evaluar en una ecuacion
            
            ;printChar 10d
            ;printChar gSign
            ;printChar gRes_1
            ;printChar gRes_0
            
            mov bl, gSign
            mov dResSign, bl
            mov bl, gRes_1
            mov dRes_1, bl
            mov bl, gRes_0
            mov dRes_0, bl
            
            cmp fResSign, 2dh
            je dOneMinus
            jmp dOnePlus
            
            dOneMinus:
            cmp dResSign, 2dh
            je disPlus
            jmp disMinus
            dOnePlus:
            cmp fResSign, 2dh
            je disMinus
            jmp disPlus
            
            disMinus:
            mov gSign, 2dh
            jmp exitSigns
            disPlus:
            mov gSign, 2bh
            exitSigns:
            
            mov ah, fRes_1
            mov al, fRes_0
            sub ah, 30h
            sub al, 30h
            aad
            mov bl, al
            
            mov ah, dRes_1
            mov al, dRes_0
            sub ah, 30h
            sub al, 30h
            aad
            mov cl, al
            mov al, bl
            mov bl, cl
            div bl
            aam
            add ah, 30h
            add al, 30h
            mov gRes_1, ah
            mov gRes_0, al
            
            ;printChar 10d
            ;printChar gSign
            ;printChar gRes_1
            ;printChar gRes_0
            
            cmp gSign, 2dh
            je reverseOne
            jmp reverseTwo
            
            reverseOne:
            mov gSign, 2bh
            jmp exitReverse
            reverseTwo:
            mov gSign, 2dh
            exitReverse:
            
            mov ah, rMen_1
            mov al, rMen_0
            mov term_1, ah
            mov term_0, al

            call acumTerm            
            
            ;printChar 10d
            ;printChar gSign
            ;printChar gRes_1
            ;printChar gRes_0
            
            mov bl, gSign
            mov maySign, bl
            mov bl, gRes_1
            mov rMay_1, bl
            mov bl, gRes_0
            mov rMay_0, bl
            
            cmp gSign, 2dh
            je isReverse1
            jmp isReverse2
            isReverse1:
            cmp menSign, 2dh
            je notReverse2
            jmp exitSingleReverse
            isReverse2:
            cmp menSign, 2dh
            je exitSingleReverse
            jmp notReverse1
            
            notReverse2:
            mov gSign, 2bh
            jmp exitSingleReverse
            notReverse1:
            mov gSign, 2dh
            exitSingleReverse:
            
            mov ah, rMen_1
            mov al, rMen_0
            mov term_1, ah
            mov term_0, al

            call acumTerm 
            
            ;printChar 10d
            ;printChar gSign
            ;printChar gRes_1
            ;printChar gRes_0
            
            mov bl, gSign
            mov errorSign, bl
            mov bl, gRes_1
            mov error_1, bl
            mov bl, gRes_0
            mov error_0, bl
            
            mov bl, maySign
            mov menSign, bl
            mov bl, rMay_1
            mov rMen_1, bl
            mov bl, rMay_0
            mov rMen_0, bl
            
            
            printString msg42
            printChar error_1
            printChar error_0
            call generateTol
            printString msg43
            printChar maySign
            printChar rMay_1
            printChar rMay_0
            call generateTol
            printString msg44

            add iterationCont, 01d
            
            mov ah, iter_1
            mov al, iter_0
            sub ah, 30h
            sub al, 30h
            aad
            cmp al, iterationCont
            je exitIterationLoop
            
            mov al, error_0
            mov ah, error_1
            sub al, 30h
            sub ah, 30h
            aad
            cmp al, 00d
            je exitIterationLoop2
            mov ah, 01h;Pausa
            int 21h
            jmp iterationLoop
            
            exitIterationLoop2:
            printString msg45
            printChar maySign
            printChar rMay_1
            printChar rMay_0
            call generateTol
            printString msg46
            printChar error_0
            printChar error_1
            call generateTol
            mov ah, 01h;Pausa
            int 21h

            exitIterationLoop:
            jmp menu
            
            fail6_6:
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
    
    calculateDer proc;Calcular derivada
        cmp grade, 35h
        je sauxDWrite5
        cmp grade, 34h
        je sauxDWrite4
        cmp grade, 33h
        je sauxDWrite3
        cmp grade, 32h
        je sauxDWrite2
        cmp grade, 31h
        je sauxDWrite1
            
        sauxDWrite5:
            jmp sdWrite5
        sauxDWrite4:
            jmp sdWrite4
        sauxDWrite3:
            jmp sdWrite3
        sauxDWrite2:
            jmp sdWrite2
        sauxDWrite1:
            jmp sdWrite1
            
        sdWrite5:
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
        sdWrite4:
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
            
        sdWrite3:
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
            
        sdWrite2:
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
            
         sdWrite1:
            mov al, nu1_1;Valores se multiplican por 1, solo se transfieren
            mov rnu1_1, al
            
            mov al, nu1_0
            mov rnu1_0, al
        ret
    calculateDer endp
    
    calculateInt proc;Calcular integral
        cmp grade, 35h
        je sauxIWrite5
        cmp grade, 34h
        je sauxIWrite4
        cmp grade, 33h
        je sauxIWrite3
        cmp grade, 32h
        je sauxIWrite2
        cmp grade, 31h
        je sauxIWrite1
            
        sauxIWrite5:
            jmp siWrite5
        sauxIWrite4:
            jmp siWrite4
        sauxIWrite3:
            jmp siWrite3
        sauxIWrite2:
            jmp siWrite2
        sauxIWrite1:
            jmp siWrite1
            
        siWrite5:
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
            
       siWrite4:
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
            
        siWrite3:
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
            
        siWrite2:
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
            
        siWrite1:
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
            mov al, nu0_1;Valores se dividen por 1, solo se transfieren
            mov rnu0_1, al
            
            mov al, nu0_0
            mov rnu0_0, al
        ret
    calculateInt endp
    
    drawAxis proc;Dibujar ejes
        mov ah, 06h
        mov al, 00h
        mov bh, 02h;Color de pantalla, color de texto
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        
        mov ah, 02h
        mov bh, 00h
        mov dh, 12d;Fila
        mov dl, 00h;Columna
        int 10h
        
        mov ah, 02h
        mov dl, 2dh
        int 21h    
        mov ah, 02h
        mov dl, 58h
        int 21h
        
        ;Dibujar eje X
        mov cl,02d
        xAxisLoop:
            mov ah, 02h
            mov dl, 2dh
            int 21h
            
            add cl,01d
            
            cmp cl,80d
            je xAxisLoopExit
            jmp xAxisLoop
            xAxisLoopExit:
        
        mov ah, 02h
        mov bh, 00h
        mov dh, 12d;Fila
        mov dl, 78d;Columna
        int 10h
        
        mov ah, 02h
        mov dl, 2bh
        int 21h    
        mov ah, 02h
        mov dl, 58h
        int 21h
            
        ;Dibujar eje Y
        mov ah, 02h
        mov bh, 00h
        mov dh, 00d;Fila
        mov dl, 38d;Columna
        int 10h
        
        mov ah, 02h
        mov dl, 2bh
        int 21h 
        mov ah, 02h
        mov dl, 59h
        int 21h
        
        mov cl,01d
        yAxisLoop:
            mov ah, 02h
            mov bh, 00h
            mov dh, cl;Fila
            mov dl, 39d;Columna
            int 10h
        
            mov ah, 02h
            mov dl, 7ch
            int 21h
            
            add cl,01d
            
            cmp cl,25d
            je yAxisLoopExit
            jmp yAxisLoop
            yAxisLoopExit:
        
        mov ah, 02h
        mov bh, 00h
        mov dh, 24;Fila
        mov dl, 38d;Columna
        int 10h
            
        mov ah, 02h
        mov dl, 2dh
        int 21h    
        mov ah, 02h
        mov dl, 59h
        int 21h
        ret
    drawAxis endp
    
    calculateTerm proc;Calcular termino
        ;Reiniciar variables
        mov signTerm, 00h
        mov term_0, 00h
        mov term_1, 00h
        mov cont, 01d
        ;printChar eval_1
        ;printChar eval_0
        ;printChar 10d
        mov al, eval_1;Se mueve el valor mas significativo 
        sub al, 30h
        mov ch, al
            
        mov al, eval_0;Se mueve el valor menos significativo 
        sub al, 30h
        mov cl, al
        
        mov ax, cx
        aad;Se convierten a hexadecimales para operar
         
        mov cl, al
        sub termExp, 30h
        cmp termExp, 01d;Saltar si el exponente es uno
        je isExpOne

        singleLoop:
        mov bl, cl
        mul bl;Se multiplica por el acumulado
          
        add cont, 01d
        mov dl, termExp
        cmp cont, dl
        jne singleLoop
        
        isExpOne:
        mov bl, al;Resultado del exponente y el numero evaluado        
        mov al, coef_1;Se mueve el valor mas significativo 
        sub al, 30h
        mov ch, al
            
        mov al, coef_0;Se mueve el valor menos significativo 
        sub al, 30h
        mov cl, al
            
        mov ax, cx
        aad;Se convierten a hexadecimales para operar
        
        mul bl;Se multiplica por el exponente
        
        aam;Retorna la multiplicacion con valores asignados en ax
        mov cx, ax
        mov term_1, ch
        mov term_0, cl
        add term_1, 30h
        add term_0, 30h

        cmp evalSign, 2dh;Signo menos
        je oneMinus
        jmp secondVal

        oneMinus:;Que pasa con 1 menos
        mov al, termExp
        mov ah, 00d
        aad
        mov bl, 02d
        div bl
        cmp ah, 00d
        je secondVal
        cmp signCoef, 2dh;Signo menos
        je isPlus
        jmp isMinus
        
        secondVal:
        cmp signCoef, 2dh;Signo menos
        je isMinus
        jmp isPlus
        
        isPlus:;El resultado es positivo
        mov signTerm, 2bh
        jmp singleJump
        isMinus:;El resultado es negativo
        mov signTerm, 2dh
        singleJump:
        
        ;printChar signTerm
        ;printChar term_1
        ;printChar term_0
        ;printChar 26h
        ;printChar 10d
        ret
    calculateTerm endp
    
    acumTerm proc;Calcular termino
        mov al, term_1;Se mueve el valor mas significativo 
        sub al, 30h
        mov ch, al
            
        mov al, term_0;Se mueve el valor menos significativo 
        sub al, 30h
        mov cl, al
            
        mov ax, cx
        aad;Se convierten a hexadecimales para operar
            
        mov bl, al;Resultado del exponente y el numero evaluado        
        
        mov al, gRes_1;Se mueve el valor mas significativo 
        sub al, 30h
        mov ch, al
            
        mov al, gRes_0;Se mueve el valor menos significativo 
        sub al, 30h
        mov cl, al
            
        mov ax, cx
        aad;Se convierten a hexadecimales para operar
        
        ;gRes en al y term en bl
        ;+ -
        cmp gSign, 2dh;Signo menos
        je oneMinus2
        jmp secondVal2

        oneMinus2:;Que pasa con 1 menos
        cmp signTerm, 2dh;Signo menos
        je isMinus2
        jmp isDifferent
        
        secondVal2:
        cmp signTerm, 2dh;Signo menos
        je isDifferent
        jmp isPlus2
        
        isDifferent:;Signos diferentes
        cmp bl, al
        jc subOne 
        je subTwo   
        subTwo:
        sub bl, al
        mov al, bl
        mov cl, signTerm
        mov gSign, cl  
        jmp singleJump2
        subOne:
        sub al, bl
        jmp singleJump2 
        
        isPlus2:;El resultado es positivo
        add al, bl
        mov gSign, 2bh
        jmp singleJump2
        isMinus2:;El resultado es negativo
        add al, bl
        mov gSign, 2dh
        singleJump2:
        
        aam
        add ah, 30h
        add al, 30h
        mov gRes_1, ah
        mov gRes_0, al
        ret
    acumTerm endp
    
    graphDot proc
        mov al, gRes_1
        sub al, 30h
        mov ch, al
            
        mov al, gRes_0
        sub al, 30h
        mov cl, al
            
        mov ax, cx
        aad
        mov cl, al
        cmp gSign, 2bh;Signo mas
        je isSinglePlus
        jmp isSingleMinus
        isSinglePlus:
        mov bl, 12d
        sub bl, cl
        mov dl, bl
        jmp printSingleDot
        isSingleMinus:
        add cl, 12d
        mov dl, cl
        printSingleDot:
        cmp signCont, 2bh;Signo mas
        je isSinglePlus2
        jmp isSingleMinus2
        ;si x >= 0  ->  valor obtenido + 39
        ;si x < 0  ->  39 - valor obtenido 
        
        ;si y >= 0  -> 12 - valor obtenido
        ;si y < 0  -> valor obtenido + 12
        isSinglePlus2:
        mov cl, singleCont
        add cl, 39d
        mov bl, cl
        jmp printSingleDot2
        isSingleMinus2:
        mov cl, singleCont
        mov bl, 39d
        sub bl, cl
        
        printSingleDot2:
        printDot bl, dl
        ret
    graphDot endp
    
    calculateEQ proc
        ;Cargando datos al valor a evaluar
        ;mov cx, ax
        ;add ch, 30h
        ;add cl, 30h
        ;mov eval_1, ch
        ;mov eval_0, cl
         
        cmp auxGrade, 36h
        je auxIDraw6   
        cmp auxGrade, 35h
        je auxIDraw5
        cmp auxGrade, 34h
        je auxIDraw4
        cmp auxGrade, 33h
        je auxIDraw3
        cmp auxGrade, 32h
        je auxIDraw2
        cmp auxGrade, 31h
        je auxIDraw1
         
        auxIDraw6:
            jmp iDraw6
        auxIDraw5:
            jmp iDraw5
        auxIDraw4:
            jmp iDraw4
        auxIDraw3:
            jmp iDraw3
        auxIDraw2:
            jmp iDraw2
        auxIDraw1:
            jmp iDraw1
        
        iDraw6:
            cmp auxGrade, 36h
            jne noAssign6
                
            ;Cargando datos al exponente
            mov termExp, 36h
            ;Cargando datos al coeficiente
            mov cl, rSign6
            mov bh, rnu6_1
            mov bl, rnu6_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp iDraw5
            noAssign6:
                ;Cargando datos al exponente
                mov termExp, 36h
                ;Cargando datos al coeficiente
                mov cl, rSign6
                mov bh, rnu6_1
                mov bl, rnu6_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                    
                call calculateTerm
                call acumTerm     
        iDraw5:
            cmp auxGrade, 35h
            jne noAssign5
                
            ;Cargando datos al exponente
            mov termExp, 35h
            ;Cargando datos al coeficiente
            mov cl, rSign5
            mov bh, rnu5_1
            mov bl, rnu5_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp iDraw4
            noAssign5:
                ;Cargando datos al exponente
                mov termExp, 35h
                ;Cargando datos al coeficiente
                mov cl, rSign5
                mov bh, rnu5_1
                mov bl, rnu5_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                    
                call calculateTerm
                call acumTerm  
        iDraw4:
            cmp auxGrade, 34h
            jne noAssign4
                
            ;Cargando datos al exponente
            mov termExp, 34h
            ;Cargando datos al coeficiente
            mov cl, rSign4
            mov bh, rnu4_1
            mov bl, rnu4_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp iDraw3
            noAssign4:
                ;Cargando datos al exponente
                mov termExp, 34h
                ;Cargando datos al coeficiente
                mov cl, rSign4
                mov bh, rnu4_1
                mov bl, rnu4_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                 
                call calculateTerm
                call acumTerm
        iDraw3:
            cmp auxGrade, 33h
            jne noAssign3
                
            ;Cargando datos al exponente
            mov termExp, 33h
            ;Cargando datos al coeficiente
            mov cl, rSign3
            mov bh, rnu3_1
            mov bl, rnu3_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp iDraw2
            noAssign3:
                ;Cargando datos al exponente
                mov termExp, 33h
                ;Cargando datos al coeficiente
                mov cl, rSign3
                mov bh, rnu3_1
                mov bl, rnu3_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                    
                call calculateTerm
                call acumTerm
        iDraw2:
            cmp auxGrade, 32h
            jne noAssign2
                
            ;Cargando datos al exponente
            mov termExp, 32h
            ;Cargando datos al coeficiente
            mov cl, rSign2
            mov bh, rnu2_1
            mov bl, rnu2_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp iDraw1
            noAssign2:
                ;Cargando datos al exponente
                mov termExp, 32h
                ;Cargando datos al coeficiente
                mov cl, rSign2
                mov bh, rnu2_1
                mov bl, rnu2_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                    
                call calculateTerm
                call acumTerm
        iDraw1:
            cmp auxGrade, 31h
            jne noAssign1
                
            ;Cargando datos al exponente
            mov termExp, 31h
            ;Cargando datos al coeficiente
            mov cl, rSign1
            mov bh, rnu1_1
            mov bl, rnu1_0
            mov signCoef, cl
            mov coef_1, bh
            mov coef_0, bl
            call calculateTerm
                
            mov cl, signTerm
            mov bh, term_1
            mov bl, term_0
            mov gSign, cl
            mov gRes_1, bh
            mov gRes_0, bl
            jmp isAssign1
            noAssign1:
                ;Cargando datos al exponente
                mov termExp, 31h
                ;Cargando datos al coeficiente
                mov cl, rSign1
                mov bh, rnu1_1
                mov bl, rnu1_0
                mov signCoef, cl
                mov coef_1, bh
                mov coef_0, bl
                    
                call calculateTerm
                call acumTerm
            isAssign1:
                cmp isIntegral, 01d
                je notOperate
                ;Cargando datos al coeficiente
                mov cl, rSign0
                mov bh, rnu0_1
                mov bl, rnu0_0
                mov signTerm, cl
                mov term_1, bh
                mov term_0, bl
                    
                call acumTerm
                notOperate:
        ret
    calculateEQ endp
    
    generateTol proc
        mov ah, gTol_1
        mov al, gTol_0
        sub ah, 30h
        sub al, 30h
        aad
        
        mov cl, al
        printChar 2eh
        mov letterCont, 01d
        loopTol:
        printChar 30h
        cmp letterCont, cl
        je exitGenerateTol
        add letterCont, 01d
        jmp loopTol
        
        exitGenerateTol:
        ret
    generateTol endp
end main
