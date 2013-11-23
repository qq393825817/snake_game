assume cs:code,ds:data,ss:stack
data segment
;------------------------------------------------------------------------------------------------
    attr1       db    02h                            ; the color of '*', black and the green on |
    attr2       db    0Eh                            ; the color of '#', red           green    |
	attr3       db    04h							 ;                                          |
	attr4       db    0Ah                            ;                                          | 
    show00      db              "************************************************************$";   |
    show01      db    0ah, 0dh, "*                   This is a snake game                   *$";|
    show02      db    0ah, 0dh, "************************************************************$";|
    show03      db    0ah, 0dh, "                                                            $";|
    show04      db    0ah, 0dh, "**************  ############################################$";|
    show05      db    0ah, 0dh, "* sorce:000  *  #                                          #$";|
    show06      db    0ah, 0dh, "*            *  #                                          #$";|
    show07      db    0ah, 0dh, "*            *  #                                          #$";|
    show08      db    0ah, 0dh, "* level:0    *  #                                          #$";|
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
    snake00     db              "************************************************************$";|
    snake01     db    0ah, 0dh, "*                  Welcome to Snake Game                   *$";| 
    snake02     db    0ah, 0dh, "************************************************************$";|
    snake03     db    0ah, 0dh, "#           /^\/^\                                         #$";|
    snake04     db    0ah, 0dh, "#        _|_o_|_o_|                                        #$";|
    snake05     db    0ah, 0dh, "#  \/   /~        \_/ \                                    #$";|
    snake06     db    0ah, 0dh, "# \___|__________/  \   \                                  #$";|
    snake07     db    0ah, 0dh, "#          \_____ _      \                                 #$";|
    snake08     db    0ah, 0dh, "#                   \    |      ~_ ~     \ ~               #$";|
    snake09     db    0ah, 0dh, "#                    |   /    /  _   \    \  \             #$";|
    snake10     db    0ah, 0dh, "#                   /  /    /  /  \   \    \   \           #$";|
    snake11     db    0ah, 0dh, "#                  /  /   /  /     \   \    \    |         #$";|
    snake12     db    0ah, 0dh, "#                 /  /  /  /       |   |     |   /         #$";|
    snake13     db    0ah, 0dh, "#                |  \__/  /         \   \ ~ /   /          #$";|
    snake14     db    0ah, 0dh, "#                ~______~             ~____~__/            #$";|
    snake15     db    0ah, 0dh, "************************************************************$";|
    snake16     db    0ah, 0dh, "* please to choose the level:                              *$";|
    snake17     db    0ah, 0dh, "*          1.low        2.middle       3.high              *$";|
    snake18     db    0ah, 0dh, "************************************************************$";|
;------------------------------------------------------------------------------------------------
;这个表示食物出现的区域，表示一个数组
	food_locate dw    0532h,05d2h,0672h,0712h,07b2h,0852h,08f2h,0992h,0a32h,0ad2h,0b72h,0c12h,0cb2h
;9表示暂停0.5秒，18暂停1秒，36表示暂停2秒
	didas        db    72
;0表示没有结束，1表示死亡，2表示程序退出，3表示胜利
	game_over   db    0
;表示所得分数
	value_cx    db    (?)
	score       dw    0
	char_score  db    0,0,0
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
	snake_head  db    (?)
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
	call wait_game
	call clear
	call init_menu
	call ingame	
	nop

	mov ax,4c00h
	int 21h
;--------------------------------------------------
;wait the game,the times save in didas
wait_game:
	mov bx,offset didas
	xor ax,ax
	int 1ah
	mov si,dx
	mov di,cx
time_out:
	xor ax,ax
	int 1ah
	sub dx,si
	sbb cx,di
	cmp dx,[bx]
	jb time_out

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
	;call is_alive
	;mov bx,offset snake_alive
	;mov dl,[bx]
	;cmp dl,0
	;je end_ingame
	;call go_snake
	;call food_eat
	;mov bx,offset eat_food
	;mov dl,[bx]
	;cmp dl,0
	;je continue
	;call scores_increase
;continue:
;	jmp ingame
;end_ingame:
	mov bx,offset game_over
	mov dl,1
	mov [bx],dl
	ret

;--------------------------------------------------
;分数增加
scores_increase:
	mov bx,offset score
	mov ax,[bx]
	inc ax
	mov [bx],ax
	mov ax,0b852h
	mov es,ax
	mov si,4
	call trans_char 
	mov bx,offset value_cx
	mov cl,[bx]
	mov ch,0
	mov bx,offset char_score
increase:
	mov al,[bx]
	inc bx
	mov es:[si],al
	sub si,2
	loop increase
	call food_create
	ret
;--------------------------------------------------
;将十进制数转化为字符型
trans_char:
	mov bx,offset score
	mov ax,[bx]
	mov dl,10
	mov cl,0
	mov bx,offset char_score
trans_loop:
	cmp ax,0
	je trans_end
	div dl
	add ah,30h
	mov [bx],ah
	inc bx
	inc cl
	mov ah,0
	jmp trans_loop
trans_end:
	mov bx,offset value_cx
	mov [bx],cl
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
food_begin:
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
	mov dl,43
	div dl
	mov bx,offset food_x
	mov [bx],ah

	mov bx,offset food_y
	mov dl,[bx]
	mov dh,0
	mov al,2
	mul dl
	mov si,ax
	mov bx,offset food_locate
	mov ax,[bx+si]
	push ax

	mov bx,offset food_x
	mov dl,[bx]
	mov al,2
	mul dl
	mov dx,ax

	pop ax
	add ax,dx
	mov dx,ax
	push ax
	mov cl,4
	shr dx,cl
	mov ax,0b800h
	add ax,dx
	mov es,ax
	pop ax
	mov dl,0fh
	and al,dl
	
	mov ah,0
	mov si,ax
	mov dl,' '
	cmp es:[si],dl
	je food_end
	jmp food_begin

food_end:
	mov dl,'&'
	mov es:[si],dl

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
        mov ax, data
        mov ds, ax

        mov ax, stack
        mov ss, ax

        mov cx, 13h

        mov sp, 800h
        mov ax, 0b81fh
        mov es, ax	
	
        mov bx, offset snake00
row1:
        push cx
        mov cx, 60
        mov si, 0h
col1:
	mov al, [bx]
	mov es:[si], al

	cmp al, 2ah  
	je color11
	
	cmp al, 23h
	je color21
	
	jmp color31

color11:
	mov di, 0h
	jmp loop01

color21:
	mov di, 1h
	jmp loop01

color31:
	mov di, 2h
	jmp loop01

color41:
	mov di, 3h

loop01:
	mov ah, [di]
	mov es:[si + 1], ah
	inc bx
	add si, 2
	loop col1
	pop cx

	mov ax, es
	add ax, 0ah
	mov es, ax
	add bx, 3
	loop row1

	mov ah, 01h
	int 21h
	sub al, 30h

	ret
;清屏和初始化蛇和食物
;--------------------------------------------------

code ends


end start
