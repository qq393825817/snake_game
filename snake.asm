assume cs:code,ds:data,ss:stack
data segment
;------------------------------------------------------------------------------------------------
    attr1       db    02h                            ; the color of '*', black and the green on |
    attr2       db    0Eh                            ; the color of '#', red           green    |
	attr3       db    04h							 ;                                          |
	attr4       db    0Ah                            ;                                          | 
    show00      db           "************************************************************$";   |
    show01      db    0ah, 0dh, "*                   This is a snake game                   *$";|
    show02      db    0ah, 0dh, "************************************************************$";|
    show03      db    0ah, 0dh, "                                                            $";|
    show04      db    0ah, 0dh, "**************  ############################################$";|
    show05      db    0ah, 0dh, "* sorce:___  *  #                                          #$";|
    show06      db    0ah, 0dh, "*            *  #                                          #$";|
    show07      db    0ah, 0dh, "*            *  #                                          #$";|
    show08      db    0ah, 0dh, "* level:___  *  #                                          #$";|
    show09      db    0ah, 0dh, "*            *  #                                          #$";|
    show10      db    0ah, 0dh, "*            *  #          @->                             #$";|
    show11      db    0ah, 0dh, "* operate:   *  #                                          #$";|
    show12      db    0ah, 0dh, "*  up:     w *  #                                          #$";|
    show13      db    0ah, 0dh, "*  down:   s *  #                                          #$";|
    show14      db    0ah, 0dh, "*  right:  a *  #                                          #$";|
    show15      db    0ah, 0dh, "*  left:   d *  #                                          #$";|
    show16      db    0ah, 0dh, "*            *  #                                          #$";|
    show17      db    0ah, 0dh, "*            *  #                                          #$";|
    show18      db    0ah, 0dh, "**************  ############################################$";|
;------------------------------------------------------------------------------------------------
;这个表示食物出现的区域，表示一个数组
	food_locate dw   
			0532h,0534h,0536h,0538h,053ah,053ch,053eh,0540h,0542h,0544h,0546h,0548h,054ah,054ch,054eh,0550h,0552h,0554h,0556h,0558h,055ah,
			055ch,055eh,0560h,0562h,0564h,0566h,0568h,056ah,056ch,056eh,0570h,0572h,0574h,0576h,0578h,057ah,057ch,057eh,0580h,0582h,0584h,
			05d2h,05d4h,05d6h,05d8h,05dah,05dch,05deh,05e0h,05e2h,05e4h,05e6h,05e8h,05eah,05ech,05eeh,05f0h,05f2h,05f4h,05f6h,05f8h,05fah,
			05fch,05feh,0600h,0602h,0604h,0606h,0608h,060ah,060ch,060eh,0610h,0612h,0614h,0616h,0618h,061ah,061ch,061eh,0620h,0622h,0624h,
			0672h,0674h,0676h,0678h,067ah,067ch,067eh,0680h,0682h,0684h,0686h,0688h,068ah,068ch,068eh,0690h,0692h,0694h,0696h,0698h,069ah,
			069ch,069eh,06a0h,06a2h,06a4h,06a6h,06a8h,06aah,06ach,06aeh,06b0h,06b2h,06b4h,06b6h,06b8h,06bah,06bch,06beh,06c0h,06c2h,06c4h,
			0712h,0714h,0716h,0718h,071ah,071ch,071eh,0720h,0722h,0724h,0726h,0728h,072ah,072ch,072eh,0730h,0732h,0734h,0736h,0738h,073ah,
			073ch,073eh,0740h,0742h,0744h,0746h,0748h,074ah,074ch,074eh,0750h,0752h,0754h,0756h,0758h,075ah,075ch,075eh,0760h,0762h,0764h,
			07b2h,07b4h,07b6h,07b8h,07bah,07bch,07beh,07c0h,07c2h,07c4h,07c6h,07c8h,07cah,07cch,07ceh,07d0h,07d2h,07d4h,07d6h,07d8h,07dah,
			07dch,07deh,07e0h,07e2h,07e4h,07e6h,07e8h,07eah,07ech,07eeh,07f0h,07f2h,07f4h,07f6h,07f8h,07fah,07fch,07feh,0800h,0802h,0804h,
			0852h,0854h,0856h,0858h,085ah,085ch,085eh,0860h,0862h,0864h,0866h,0868h,086ah,086ch,086eh,0870h,0872h,0874h,0876h,0878h,087ah,
			087ch,087eh,0880h,0882h,0884h,0886h,0888h,088ah,088ch,088eh,0890h,0892h,0894h,0896h,0898h,089ah,089ch,089eh,08a0h,08a2h,08a4h,
			08f2h,08f4h,08f6h,08f8h,08fah,08fch,08feh,0900h,0902h,0904h,0906h,0908h,090ah,090ch,090eh,0910h,0912h,0914h,0916h,0918h,091ah,
			091ch,091eh,0920h,0922h,0924h,0926h,0928h,092ah,092ch,092eh,0930h,0932h,0934h,0936h,0938h,093ah,093ch,093eh,0940h,0942h,0944h,
			0992h,0994h,0996h,0998h,099ah,099ch,099eh,09a0h,09a2h,09a4h,09a6h,09a8h,09aah,09ach,09aeh,09b0h,09b2h,09b4h,09b6h,09b8h,09bah,
			09bch,09beh,09c0h,09c2h,09c4h,09c6h,09c8h,09cah,09cch,09ceh,09d0h,09d2h,09d4h,09d6h,09d8h,09dah,09dch,09deh,09e0h,09e2h,09e4h,
			0a32h,0a34h,0a36h,0a38h,0a3ah,0a3ch,0a3eh,0a40h,0a42h,0a44h,0a46h,0a48h,0a4ah,0a4ch,0a4eh,0a50h,0a52h,0a54h,0a56h,0a58h,0a5ah,
			0a5ch,0a5eh,0a60h,0a62h,0a64h,0a66h,0a68h,0a6ah,0a6ch,0a6eh,0a70h,0a72h,0a74h,0a76h,0a78h,0a7ah,0a7ch,0a7eh,0a80h,0a82h,0a84h,
			0ad2h,0ad4h,0ad6h,0ad8h,0adah,0adch,0adeh,0ae0h,0ae2h,0ae4h,0ae6h,0ae8h,0aeah,0aech,0aeeh,0af0h,0af2h,0af4h,0af6h,0af8h,0afah,
			0afch,0afeh,0b00h,0b02h,0b04h,0b06h,0b08h,0b0ah,0b0ch,0b0eh,0b10h,0b12h,0b14h,0b16h,0b18h,0b1ah,0b1ch,0b1eh,0b20h,0b22h,0b24h,
			0b72h,0b74h,0b76h,0b78h,0b7ah,0b7ch,0b7eh,0b80h,0b82h,0b84h,0b86h,0b88h,0b8ah,0b8ch,0b8eh,0b90h,0b92h,0b94h,0b96h,0b98h,0b9ah,
			0b9ch,0b9eh,0ba0h,0ba2h,0ba4h,0ba6h,0ba8h,0baah,0bach,0baeh,0bb0h,0bb2h,0bb4h,0bb6h,0bb8h,0bbah,0bbch,0bbeh,0bc0h,0bc2h,0bc4h,
			0c12h,0c14h,0c16h,0c18h,0c1ah,0c1ch,0c1eh,0c20h,0c22h,0c24h,0c26h,0c28h,0c2ah,0c2ch,0c2eh,0c30h,0c32h,0c34h,0c36h,0c38h,0c3ah,
			0c3ch,0c3eh,0c40h,0c42h,0c44h,0c46h,0c48h,0c4ah,0c4ch,0c4eh,0c50h,0c52h,0c54h,0c56h,0c58h,0c5ah,0c5ch,0c5eh,0c60h,0c62h,0c64h,
			0cb2h,0cb4h,0cb6h,0cb8h,0cbah,0cbch,0cbeh,0cc0h,0cc2h,0cc4h,0cc6h,0cc8h,0ccah,0ccch,0cceh,0cd0h,0cd2h,0cd4h,0cd6h,0cd8h,0cdah,
			0cdch,0cdeh,0ce0h,0ce2h,0ce4h,0ce6h,0ce8h,0ceah,0cech,0ceeh,0cf0h,0cf2h,0cf4h,0cf6h,0cf8h,0cfah,0cfch,0cfeh,0d00h,0d02h,0d04h,
;0表示一直暂停下去，正数表示暂停的时间
	time        db    0
;0表示没有结束，1表示死亡，2表示程序退出，3表示胜利
	game_over   db    0
;表示所得分数
	score       db    0
;0表示蛇已经死了，1表示还活着
	snake_alive db    1
;food_x表示列，food_y表示行
	food_x      db    (?)
	food_y      db    (?)
;0表示没有存在食物，1表示存在
	exit_food   db    0
;0表示没有吃到食物，1表示食物被吃掉了
	eat_food    db    0
;'w'表示向上，‘s’向下，‘a’向左，‘d’向右
	snake_dir   db    (?)
	snake_up    db    'w'
	snake_down  db    's'
	snake_left  db    'a'
	snake_right db    'd'
	game_name   db    "snake game$"
	author      db    "by lvwei,E-mail:xiyou.jike1101lw@gmail.com$"
	descripe    db    "Press w to up,s to down,a to left,d to right$"
	begin       db    "Press any key to start$"
	quit        db    "Press 'q' key to quit the game$"
data ends
stack segment
	db 200 dup(?)
stack ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov ax, stack
	mov ss, ax
	mov sp, 800h
	call clear
	call display
	call pause_game
	call clear
	call init_menu
;	call ingame	
	nop

	mov ax,4c00h
	int 21h
;--------------------------------------------------
;pause the game,the time save in time
pause_game:
	
	ret 
;--------------------------------------------------
;初始化游戏
init_menu:
	mov cx, 13h				; all of 19 line and loop 19 times
	mov ax, 0b81fh			; the start address and show memory
	mov es, ax
	
	mov bx, offset show00
row:
	push cx
	mov cx, 60
	mov si, 0h
col:
	mov al, [bx]
	mov es:[si], al

	cmp al, 2ah  
	je color1
	
	cmp al, 23h
	je color2
	
	jmp color3

color1:
	mov di, 0h
	jmp loop0

color2:
	mov di, 1h
	jmp loop0

color3:
	mov di, 2h
	jmp loop0

color4:
	mov di, 3h

loop0:
	mov ah, [di]
	mov es:[si + 1], ah
	inc bx
	add si, 2
	loop col
	pop cx

	mov ax, es
	add ax, 0ah
	mov es, ax
	add bx, 3
	loop row
	ret
;--------------------------------------------------
;开始游戏
ingame:
	call is_alive
	mov bx,offset snake_alive
	mov dl,[bx]
	cmp dl,0
	je end_ingame
	call go_snake
	call food_eat
	mov bx,offset eat_food
	mov dl,[bx]
	cmp dl,0
	je continue
	call scores_increase
continue:
	jmp ingame
end_ingame:
	mov bx,offset game_over
	mov dl,1
	mov [bx],dl
	ret

;--------------------------------------------------
;分数增加
scores_increase:

	call food_create
	ret

;--------------------------------------------------
;判断食物是否被吃掉
food_eat:
	
	ret
;--------------------------------------------------
;判断蛇是否撞墙或者撞到自身
is_alive:

	ret
;--------------------------------------------------
;让蛇朝着snake_dir的方向走
go_snake:
	
	ret
;--------------------------------------------------
;随机放置食物
food_create:
begin:
	mov ah,0
	int 1ah
	mov ax,dx
	and ah,3
	mov dl,13
	div dl
	mov bx,offset food_y
	mov [bx],ah	
	
	mov ah,0
	int 1ah
	mov ax,dx
	and ah,3
	mov dl,13
	div dl
	mov bx,offset food_x
	mov [bx],ah

	mov bx,offset food_y
	mov al,42
	mov dl,[bx]
	mul dl

	mov bx,offset food_x
	mov dl,[bx]
	mov dh,0
	add ax,dx

	mov bx,ax
	mov ax,[bx]
	cmp ax,' '
	jne begin
	mov ax,'@'
	mov [bx],ax

	ret
;--------------------------------------------------
;清屏函数
clear:
	push ds
	push cx
	push es
	mov ax,0b800h
	mov es,ax
	mov bx,0
	mov cx,2000
blank:
	mov byte ptr es:[bx],' '
	mov byte ptr es:[bx+1],07h
	add bx,2
	loop blank
	pop es
	pop cx
	pop ds

	ret
;--------------------------------------------------
;显示信息	
display:
	mov ax,0b872h
	mov es,ax
	mov cx,5
	mov ah,02h
	mov bx,0
dis1:
	mov si,0
dis2:
	mov al,[bx]
	cmp al,'$'
	je enddis
	mov es:[si],al
	mov es:[si+1],ah
	inc bx
	add si,2
	jmp dis2
enddis:
	mov ax,es
	inc bx
	add ax,0ah
	mov es,ax
	loop dis1
	ret
;清屏和初始化蛇和食物
;--------------------------------------------------

code ends


end start
