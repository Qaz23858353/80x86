;�Ⱝ�P
;411262764�i�P��
;411261564 ���f��
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
deck dword 53 dup (?)
player1 dword 14 dup(0)
player2_count dword 13
player3_count dword 13
player4_count dword 13
player1_count dword 14
player2 dword 13 dup(0)
player3 dword 13 dup(0)
player4 dword 13 dup(0)
player_offset dword ?
deck_ptr dword offset deck
ranNum dword ?
message_suit1 byte "�®�",0
message_suit2 byte "����",0
message_suit3 byte "���",0
message_suit4 byte "����",0
message_suit5 byte "���P",0
message_player byte "���a��P�G",0
message_player2_count byte "���a2�٦��h�ֵP�G",0
message_player2 byte "���a2��P�G",0
message_player3 byte "���a3��P�G",0
message_player4 byte "���a4��P�G",0
message_player2_zero byte "���a2�S�P���L",0
message_player1_zero byte "���a�S�P",0
message_what_want_to_choose byte "�n����i:",0
erro_massege byte "����",0
flag dword ?
player dword ?
player_count dword 0
choose dword 0
p1 dword 0
message_lost_player1 byte "���a1��F�I",0
message_lost_player2 byte "���a2��F�I",0
message_lost_player3 byte "���a3��F�I",0
message_lost_player4 byte "���a4��F�I",0

end_game_flag dword 0
z_flag dword 0
.code
main proc
	call initializeDeck			; ��l�ƵP��

	call shuffles				; �~�P
	call fapie                  ;�o�P

    call writeall;��P�e�Ҧ��H����P
    mov ecx,player1_count
    mov esi, offset player1   ; ���a1����P��m
    call look
    mov eax, 0Ah  
    call WriteChar  ;����
     mov eax, 0Ah  
    call WriteChar  ;����

   ;�������a��P
    mov ecx,player1_count
    mov esi, offset player1
    call bubbleSort 
    mov ecx,player1_count
    mov esi, offset player1
    mov player,offset player1
    call dio_pie
    mov player1_count,edi

    mov ecx,player2_count
    mov esi, offset player2   
    call bubbleSort 
    mov ecx,player2_count
    mov esi, offset player2
    mov player,offset player2
    call dio_pie
    mov player2_count,edi

    mov ecx,player3_count
    mov esi, offset player3   
    call bubbleSort 
    mov ecx,player3_count
    mov esi, offset player3
    mov player,offset player3
    call dio_pie
    mov player3_count,edi


    mov ecx,player4_count
    mov esi, offset player4   
    call bubbleSort 
    mov ecx,player4_count
    mov esi, offset player4
    mov player,offset player4
    call dio_pie
    mov player4_count,edi


    






 game_loop:  ;�C���j��
 mov esi,offset player1   ;�P�_�C�����p
    mov ecx,player1_count
    mov ebx,1
    call game_check
    cmp end_game_flag,0
    jne l22

    mov esi,offset player2
    mov ecx,player2_count
     mov ebx,2
    call game_check
    cmp end_game_flag,0
    jne l22

     mov esi,offset player3
    mov ecx,player3_count
     mov ebx,3
    call game_check
    cmp end_game_flag,0
    jne l22

    mov esi,offset player4
    mov ecx,player4_count
     mov ebx,4
    call game_check
     cmp end_game_flag,0
    jne l22
 call writeall
   
    cmp player2_count,0
    je n1
    mov ecx,player1_count   ;1��2
    mov esi, offset player1   ; ���a1����P��m
    call look
    mov eax, 0Ah  
    call WriteChar  ;����
    mov edx,offset message_player2_count   ;���a2�t�P��
    call WriteString
    mov eax,player2_count
    call WriteDec
     mov eax, 0Ah  
    call WriteChar
    call player_choose    ;���a��P



    cmp player1_count,1   ;�Ѥ@�i���αƧǤ]���Υ�P
    je  n1
    cmp player1_count,0
    je n1
    mov ecx,player1_count   ;�⧹��P
    mov esi, offset player1
    call bubbleSort 
    mov ecx,player1_count
    mov esi, offset player1
    mov player,offset player1
    call dio_pie
    mov player1_count,edi

    
  
n1:
     cmp player3_count,0
    je n2
    mov ebx,player3_count   ;2��3
    mov ecx,player2_count
    mov esi,offset player2
    mov edi,offset player3
    call cmp_choose
    add player2_count,1
    sub player3_count,1

 

    cmp player2_count,1   ;�Ѥ@�i���αƧǤ]���Υ�P
    je  n2
    cmp player2_count,0
    je n2
    mov ecx,player2_count   ;�⧹��P
    mov esi, offset player2
    call bubbleSort 
    mov ecx,player2_count
    mov esi, offset player2
    mov player,offset player2
    call dio_pie
    mov player2_count,edi



n2:
      cmp player4_count,0
    je n3
    mov ebx,player4_count   ;3��4
    mov ecx,player3_count
    mov esi,offset player3
    mov edi,offset player4
    call cmp_choose
    add player3_count,1
    sub player4_count,1

 

    cmp player3_count,1   ;�Ѥ@�i���αƧǤ]���Υ�P
    je  n3
    cmp player3_count,0
    je n3
    mov ecx,player3_count   ;�⧹��P
    mov esi, offset player3
    call bubbleSort 
    mov ecx,player3_count
    mov esi, offset player3
    mov player,offset player3
    call dio_pie
    mov player3_count,edi


   
n3:
      cmp player1_count,0
    je game_loop
    mov ebx,player1_count   ;4��1
    mov ecx,player4_count
    mov esi,offset player4
    mov edi,offset player1
    call cmp_choose
    add player4_count,1
    sub player1_count,1



    cmp player4_count,1   ;�Ѥ@�i���αƧǤ]���Υ�P
    je  game_loop
    cmp player4_count,0
    je game_loop
    mov ecx,player4_count   ;�⧹��P
    mov esi, offset player4
    call bubbleSort 
    mov ecx,player4_count
    mov esi, offset player4
    mov player,offset player4
    call dio_pie
    mov player4_count,edi

    mov esi,offset player1   ;�P�_�C�����p
    mov ecx,player1_count
    mov ebx,1
    call game_check
     cmp end_game_flag,0
    jne l22

    mov esi,offset player2
    mov ecx,player2_count
     mov ebx,2
    call game_check
     cmp end_game_flag,0
    jne l22

     mov esi,offset player3
    mov ecx,player3_count
     mov ebx,3
    call game_check
     cmp end_game_flag,0
    jne l22

    mov esi,offset player4
    mov ecx,player4_count
     mov ebx,4
    call game_check
    cmp end_game_flag,0
    jne l22
 
  jmp game_loop
l22:
   cmp end_game_flag,1   ;�P�_�Ѯa
   je lost_1
   cmp end_game_flag,2
   je lost_2
   cmp end_game_flag,3
   je lost_3
   cmp end_game_flag,4
   je lost_4
lost_1:
   mov edx,offset message_lost_player1
   call WriteString
   ret
lost_2:
   mov edx,offset message_lost_player2
   call WriteString
   ret
lost_3:
   mov edx,offset message_lost_player3
   call WriteString
   ret
lost_4:
   mov edx,offset message_lost_player4
   call WriteString
   ret
main endp
;****************************************

initializeDeck proc
    mov ecx, 52                    ; �]�m�j�馸�Ƭ� 52 �i�P
    mov eax, 0101h                 ; AH=0, AL=1, ��l�P���Ʀr�� 1�]�P���Ʀr�G1�A���G0�^
Start:
    mov esi, deck_ptr              ; �N deck_ptr ���V���a�}�s�x�� esi
    mov [esi], eax                 ; �N eax�]�]�t���P�P���Ʀr�^�s�x��P�զ�m
    cmp al, 13                     ; ��P���Ʀr�F�� 13 �ɡA�������
    je J1
    inc eax                        ; �W�[�P���Ʀr
    add deck_ptr, sizeof dword     ; ���ʨ�U�@�i�P����m
    loop Start                     ; ���� 52 ��
J1:
    mov al, 1                      ; ���m�P���Ʀr�� 1
    inc ah                         ; �W�[���
    add deck_ptr, sizeof dword     ; ���ʨ�U�@�i�P����m
    loop Start                     ; ���� 52 ��

    ; �K�[���P
    mov eax, 0                     ; �ϥ� 0 ��ܰ��P
    mov esi, deck_ptr              ; ���V�ثe�P�ժ��U�@�Ӧ�m
    mov [esi], eax                 ; �N���P�s�J�P��

    ret
initializeDeck endp


;****************************************
shuffles proc
	mov ecx, 53
	call Randomize						;re-seed generator
	mov deck_ptr, offset deck			;deck[i=0]
L1:
	mov esi, deck_ptr
	mov eax, [esi]
	push deck_ptr
	push eax

	mov eax, 53							;get random 0 to 53
	call RandomRange
	mov ranNum,eax						;save random number
	mov edx, sizeof dword
	mul edx
	mov deck_ptr, offset deck
	add deck_ptr, eax					;deck[random]

	mov esi, deck_ptr
	mov edx, [esi]						;edx = deck[random]
	pop eax
	mov [esi], eax						;deck[random] = deck[i]
	pop deck_ptr
	mov esi, deck_ptr
	mov [esi], edx						;deck[i] = edx

	add deck_ptr, sizeof dword			;deck[i++]
	loop L1
	mov deck_ptr, offset deck			;deck_ptr -> deck[0]
	ret
shuffles endp

fapie proc   ;�o�P
mov ecx, 14              ;���a1�o14�i
mov esi, offset deck ; deck_ptr
mov edi, offset player1 

L1:
    mov eax, [esi]    
    mov [edi], eax          
    add edi, sizeof dword  
    add esi, sizeof dword 
    loop L1                 
mov ecx,13             ;���a2�o13�i
mov edi, offset player2
L2:
   mov eax, [esi]     
    mov [edi], eax          
    add edi, sizeof dword   
    add esi, sizeof dword 
	loop L2
mov ecx,13
mov edi, offset player3
L3:                       ;���a3�o13�i
   mov eax, [esi]    
    mov [edi], eax          
    add edi, sizeof dword   
    add esi, sizeof dword 
	loop L3
mov ecx,13
mov edi, offset player4
L4:                        ;���a4�o13�i
   mov eax, [esi]     
    mov [edi], eax         
    add edi, sizeof dword   
    add esi, sizeof dword 
	loop L4
  
  ret
fapie endp


look proc   ;�ݵP
    mov edx, offset message_player   
    call WriteString
    cmp ecx,0
    je zero
L1:


    mov eax, [esi]   
    
    cmp eax, 0     ;�P�_���
    je ghost
    cmp ah, 1                
    je black1
    cmp ah, 2
    je red1
    cmp ah, 3
    je fun
    cmp ah, 4
    je mei
goback:
    mov ah, 0
   
    call WriteDec             ; ��ܼƦr
    mov eax, " "              ; ��ܪŮ�
    call WriteChar            ; ��ܪŮ�
    add esi, sizeof dword     ; ���ʨ�U�@�i�P
    loop L1                   ; �`��������ܩҦ���P
    ret

black1:
    mov edx, offset message_suit1    ; ��ܶ®�
    call WriteString
    jmp goback

red1:
    mov edx, offset message_suit2    ; ��ܬ���
    call WriteString
    jmp goback

fun:
    mov edx, offset message_suit3    ; ��ܤ��
    call WriteString
    jmp goback

mei:
    mov edx, offset message_suit4    ; ��ܱ���
    call WriteString
    jmp goback
ghost:
    mov edx, offset message_suit5    ; ��ܰ��P
    call WriteString
    jmp goback
zero:
    mov edx, offset message_player1_zero   
    call WriteString
    ret
ret
look endp
;-----------------------------------------------------------------------------------------------



bubbleSort proc  ;�w�w�Ƨ�
        
    dec ecx                        
          

outer_loop:
    mov edi, esi                   
    mov ebx, ecx                

inner_loop:
   
    mov eax, [edi]                ;�e�@�i
    mov edx, [edi + 4]             ;�U�@�i

   
    movzx eax, al                  ;�Ʀr����
    movzx edx, dl                 

    cmp eax, edx                  ;�p�G�e������p�N���Υ洫
    jna skip_swap                  

   
    mov eax, [edi]                 ;�e������j�洫
    mov edx, [edi + 4]             
    mov [edi], edx               
    mov [edi + 4], eax             

skip_swap:
   
    add edi, sizeof dword          
    dec ebx                      
    jnz inner_loop               

    
    dec ecx                       
    jnz outer_loop                

    ret
bubbleSort endp






dio_pie proc   ;��P
    ; ESI: ���V���a��P���_�l�a�}
    ; ECX: ���a��P�ƶq

    mov edi, esi           ; EDI: ���V�s����P��m

L1:
    ; �T�{�O�_�٦����B�z���d��
    cmp ecx, 0             ; �p�G�Ѿl�d���� 0�A����
    je finalize

    ; ������e�d���I��
    mov eax, [esi]         ; ��e�d��
    movzx ebx, al          ; ������e�d�����I�ơ]�C��r�`�^

    ; ���ʨ�U�@�i�d���]���ȮɫO�d��e�d���^
    add esi, sizeof dword  ; ���ʨӷ�����
    dec ecx                ; ��ֳѾl�d����

    ; �ˬd�O�_���ۦP�I�ƪ��d��
    mov flag, 0            ; ��l�Ƽлx��]�O�_�o�{���ơ^

L2:
    cmp ecx, 0             ; �p�G�Ѿl�d���Ƭ� 0�A�������h�ˬd
    je finalize_check

    mov edx, [esi]         ; �����U�@�i�d��
    movzx edx, dl          ; �����U�@�i�d�����I��

    cmp ebx, edx           ; ����I��
    jne finalize_check     ; �p�G�I�Ƥ��P�A���L�ˬd

    ; �o�{�ۦP�I�ơA�]�m�лx��
    mov flag, 1            ; �лx��]�m�� 1
    add esi, sizeof dword  ; ���L���ƥd��
    dec ecx                ; ��ֳѾl�d����
    jmp L2                 ; �~���ˬd�U�@�i�d��

finalize_check:
    cmp flag, 1            ; �ˬd�лx��
    je skip_card           ; �p�G�����ƥd���A���L�O�s

    ; �p�G�S�����ơA�O�d��e�d��
    mov [edi], eax         ; �N��e�d���O�s��s�ϰ�
    add edi, sizeof dword  ; ��s�ؼЫ���

skip_card:
    jmp L1                 ; �~��B�z�U�@�i�d��

finalize:
    ; ��s���a��P�ƶq
    sub edi, player ; �p��s��P���ס]�H�줸�խp��^
    shr edi, 2              ; ���⦨�d���ƶq
   
    ret
dio_pie endp






player_choose proc   ;���a��P
choose_another:
    cmp player2_count,0
    je zero
    mov edx, offset message_what_want_to_choose   
    call WriteString
    call ReadInt
    mov choose, eax
    cmp eax,player2_count
    ja return
    cmp eax,0
    je return
    jna return
    mov ebx,choose
    sub choose,1
    shl choose,2  ;�b���a2������m

    mov esi,offset player1   ;���a1�Y
    mov edi,offset player2   ;���a2�Y

    add edi,choose   ;�n�⪺�P
    mov eax,[edi]    ;���i�P
    mov ecx,player1_count
    shl ecx,2
    add esi,ecx     ;���a�@���̫�@�i�a�@
    mov [esi],eax
    add player1_count,1

    ;�����a2��P����
    mov ecx,player2_count   ;��̫�@�i��������
    cmp ecx,ebx
    je n2
    sub ecx,ebx
    
    add edi,4
deleate_loop:     ;��⨫���P�R�� ��᭱�����e��
    mov eax, [edi]                    
    mov esi,edi
    sub esi, 4                        
    mov [esi], eax                     
    add edi, 4                        
    dec ecx                            
    cmp ecx,0
    jnz deleate_loop                     
    je n
n2:
  sub player2_count,1
  ret
n:
 sub player2_count,1
 ret

 return:
    mov edx, offset erro_massege   
    call WriteString
     mov eax, 0Ah  
    call WriteChar 
    jmp choose_another
zero:
     mov edx, offset message_player2_zero   
    call WriteString
     mov eax, 0Ah  
    call WriteChar 
    ret
player_choose endp




    












;--------------------------------------------------------------------



cmp_choose proc   ;�q����P
    mov eax,ebx
    cmp ebx,0
    je n2
    call RandomRange
	mov ranNum,eax    ;�ü�0-ebx
    mov p1,eax
    shl ranNum,2   ;����bite
    add edi,ranNum   ;�n�⪺�d
    mov eax,[edi]    ;���eax
    shl ecx,2        ;���̫�@�i �첾�q
    add esi,ecx
    mov [esi],eax    ;���̫�@�i

   
    cmp p1,ebx      ;���̫�@�i��������   ebx�U�@�Ӫ��a  p1�ü�
    je n2
    mov ecx,ebx
    sub ecx,p1
    
    add edi,4
deleate_loop:        ;�s�P
    mov eax, [edi]                     
    mov esi,edi
    sub esi, 4                          
    mov [esi], eax                     
    add edi, 4                          
    dec ecx                            
    cmp ecx,0
    jnz deleate_loop                    
    je n2
n2:
 
  ret


    



cmp_choose endp


game_check proc      ;�C�����p
    ; esi: ���a��P�a�}
    ; eax: �ǤJ������]�ȥ��ϥΡA���O�d���f�^
    ;ebx ���a�X
  
    cmp ecx, 1             ; �ˬd��P�O�_�u�Ѥ@�i
    jne gc_end             ; �Y���u�Ѥ@�i�P�A���L�ˬd

    mov edx, [esi]       ; �����a��W�Ĥ@�i�P���ƭ�
    cmp edx, 0             ; �ˬd�o�i�P�O�_�� 0
    jne gc_end             ; �Y���O 0�A���L�ˬd

    ; �ŦX����A�C������
    call writeall          ; ��X�Ҧ����a���A
    mov end_game_flag, ebx             ; �]�m enp_game_flag�N���a
   
    ret

gc_end:
    ret                    ; ��^
game_check endp






writeall proc     ;�ݩҦ��H����
    
mov ecx,player2_count    
   mov edx,offset message_player2   
   call WriteString
    mov esi, offset player2   
    call look
    mov eax, 0Ah  
    call WriteChar
     mov eax,player2_count
     call WriteDec
     mov eax, 0Ah  
    call WriteChar
    mov edx,offset message_player3  
   call WriteString
mov ecx,player3_count
    mov esi, offset player3  
    call look
    mov eax, 0Ah  
    call WriteChar
     mov eax,player3_count
     call WriteDec
     mov eax, 0Ah  
    call WriteChar
    mov edx,offset message_player4  
   call WriteString
mov ecx,player4_count
    mov esi, offset player4   
    call look
    mov eax, 0Ah  
    call WriteChar
     mov eax,player4_count
     call WriteDec
     mov eax, 0Ah  
    call WriteChar
    ret
writeall endp



end main