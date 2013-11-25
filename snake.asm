assume cs:code,ds:data,ss:stack
data segment
;------------------------------------------------------------------------------------------------
    attr1       db    02h                            ; the color of '*', black and the green on |
    attr2       db    0Eh                            ; the color of '#', red           green    |
    attr3       db    04h                            ;                                          |
    attr4       db    0Ah                            ;                                          | 
    show00      db              "************************************************************$";|
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
;------------------------------------------------------------------------------------------------
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
;表示蛇的坐标
    s_locate    dw    546    dup(1024)
;这个表示食物出现的区域，表示一个数组
    food_locate dw    0532h,05d2h,0672h,0712h,07b2h,0852h,08f2h,0992h,0a32h,0ad2h,0b72h,0c12h,0cb2h
;9表示暂停0.5秒，18暂停1秒，36表示暂停2秒
    didas       db    72
;这块表示登陆界面中的 level 选项，默认是 1, 1 表示简单，2 表示中等，3 表示困难
    level       db    1
;0表示死亡，1表示程序退出，2表示胜利
    game_flag   db    0
;1024表示初始值，取值应该在0-545之间
    value_temp  dw    0
;表示所得分数
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
    snake_head  dw    1024
;0表示向上，1向下，2向左，3向右
    snake_dir   db    252
;这个用户输入的提示信息现实数据
    info        db    "please input (1 or 2 or 3):$"
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
    mov sp, 200
    call clear
    call display                            ; 登陆界面的显示
    call display_choose                     ; 登陆界面的选择处理
;   call wait_game
    call clear
    call init_menu
	call food_create
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
    mov cx, 13h                ; all of 19 line and loop 19 times
    mov ax, 0b81fh            ; the start address and show memory
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
    
    mov ax,253
    mov s_locate[252],ax
    mov ax,254
    mov s_locate[253],ax
    mov ax,0
    mov s_locate[254],ax
    ret
;--------------------------------------------------
;开始游戏
ingame:
    ;call is_alive
    ;mov bx,offset snake_alive
    ;mov dl,[bx]
    ;cmp dl,0
    ;je end_ingame
;   call go_snake
    ;call food_eat
    ;mov bx,offset eat_food
    ;mov dl,[bx]
    ;cmp dl,0
    ;je continue
    ;call scores_increase
;continue:
;    jmp ingame
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
    mov bx,offset value_temp
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
    mov bx,offset value_temp
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
    mov bl,snake_dir[0]
    mov ax,snake_head[0]
    cmp bl,0
    je up
    cmp bl,1
    je down
    cmp bl,2
    je left
    cmp bl,3
    je right
up:    
    cmp ax,42
    jb game_over
    sub ax,42
    jmp food
down:
    cmp ax,504
    jae game_over
    add ax,42
    jmp food
left:
    push ax
    mov bl,42
    div bl
    cmp ah,0
    je game_over
    pop ax
    sub ax,1
    jmp food
right:    
    push ax
    mov bl,42
    div bl
    cmp ah,41
    je game_over
    pop ax
    add ax,1
    jmp food
food:
    mov bx,snake_head[0]
    mov snake_head[0],ax
    mov si,ax
    mov cx,s_locate[si]   ;---------
    mov s_locate[si],bx
    mov value_temp[0],cx
continue:
    mov cx,s_locate[bx]
    cmp cx,0
    je compare
    mov bx,cx
    jmp continue
compare:
    mov bl,eat_food[0]
    cmp bl,1
    je go_end
    mov dx,0
    mov s_locate[bx],dx
    mov dx,1024
    mov bx,cx
    mov s_locate[bx],dx
    mov cx,s_locate[si]
    mov value_temp[0],cx
    jmp go_end
game_over:
    mov bl,0
    mov game_flag[0],bl
    jmp go_end
go_end:  
    ret
;--------------------------------------------------
;画蛇
draw_snake:
    mov ax,snake_head[0]
    mov bl,42
    div bl 
    mov bx,food_locate
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
    push ax
    push bx
    push cx
    push dx
    
    mov cx, 13h
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

    pop dx
    pop cx
    pop bx
    pop ax
    
    ret
;--------------------------------------------------
;登陆界面选项处理
display_choose:
    push ax
    push bx
    push cx

    mov dx, offset info
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    
    mov level[0], al
    
    pop cx
    pop bx
    pop ax

    ret
;--------------------------------------------------

code ends


end start
