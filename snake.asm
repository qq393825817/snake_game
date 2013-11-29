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
    snake17     db    0ah, 0dh, "*          3.easy        2.middle       1.hard             *$";|
    snake18     db    0ah, 0dh, "************************************************************$";|
;------------------------------------------------------------------------------------------------
    game00     db              "************************************************************$";|
    game01     db    0ah, 0dh, "*                        Snake Game                        *$";| 
    game02     db    0ah, 0dh, "************************************************************$";|
    game03     db    0ah, 0dh, "#                                                          #$";|
    game04     db    0ah, 0dh, "#           @@@@@      @      @@     @@  @@@@@@@@@         #$";|
    game05     db    0ah, 0dh, "#        @@           @ @     @ @   @ @  @                 #$";|
    game06     db    0ah, 0dh, "#       @@           @   @    @  @ @  @  @@@@@@            #$";|
    game07     db    0ah, 0dh, "#        @@   @@@   @ @ @ @   @   @   @  @                 #$";|
    game08     db    0ah, 0dh, "#          @@@  @  @       @  @       @  @@@@@@@@@         #$";|
    game09     db    0ah, 0dh, "#                                                          #$";|
    game10     db    0ah, 0dh, "#            ###    #      #  ########  #######            #$";|
    game11     db    0ah, 0dh, "#          ##  ##    #    #   #         #      #           #$";|
	game12     db    0ah, 0dh, "#         #      #   #    #   #####     #######            #$";|
    game13     db    0ah, 0dh, "#          ##  ##     #  #    #         #    #             #$";|
    game14     db    0ah, 0dh, "#           ###        ##     ########  #     #            #$";|
    game15     db    0ah, 0dh, "*                                                          #$";|          
	game16     db    0ah, 0dh, "*     please to choose:                                    #$";|
    game17     db    0ah, 0dh, "*                4 : quit     5 : restart                  #$";|
    game18     db    0ah, 0dh, "************************************************************$";|
;------------------------------------------------------------------------------------------------
    success00     db              "************************************************************$";|
    success01     db    0ah, 0dh, "*                        Snake Game                        *$";| 
    success02     db    0ah, 0dh, "************************************************************$";|
    success03     db    0ah, 0dh, "#                                                          #$";|
    success04     db    0ah, 0dh, "#           @@@@@      @      @@     @@  @@@@@@@@@         #$";|
    success05     db    0ah, 0dh, "#        @@           @ @     @ @   @ @  @                 #$";|
    success06     db    0ah, 0dh, "#       @@           @   @    @  @ @  @  @@@@@@            #$";|
    success07     db    0ah, 0dh, "#        @@   @@@   @ @ @ @   @   @   @  @                 #$";|
    success08     db    0ah, 0dh, "#          @@@  @  @       @  @   @   @  @@@@@@@@@         #$";|
    success09     db    0ah, 0dh, "#                                                          #$";|
    success10     db    0ah, 0dh, "#                                                          #$";|
    success11     db    0ah, 0dh, "#           $         $  $ $ $ $ $   $ $    $              #$";|
	success12     db    0ah, 0dh, "#            $   $   $       $       $  $   $              #$";|
    success13     db    0ah, 0dh, "#             $ $ $ $        $       $   $  $              #$";|
    success14     db    0ah, 0dh, "#              $   $     $ $ $ $ $   $    $ $              #$";|
    success15     db    0ah, 0dh, "*                                                          #$";|          
	success16     db    0ah, 0dh, "*     please to choose:                                    #$";|
    success17     db    0ah, 0dh, "*                4 : quit     5 : restart                  #$";|
    success18     db    0ah, 0dh, "************************************************************$";|
;------------------------------------------------------------------------------------------------
;音频信息——节拍和频率
    mus         dw 262, 262, 294, 262, 349
                dw 330, 262, 262, 294, 262
                dw 392, 349, 262, 262, 523
                dw 440, 349, 262, 262, 466
                dw 466, 440, 262, 392, 349, -1

    time        dw 1, 1, 2, 2, 2
                dw 2, 2, 1, 1, 2
                dw 2, 2, 2, 1, 1
                dw 2, 2, 2, 2, 2
                dw 1, 2, 2, 2, 2
;--------------
    music_si    dw    0
    music_di    dw    0
;--------------
;表示蛇的坐标
    s_locate    dw    546    dup(1)
;这个表示食物出现的区域，表示一个数组
    coordinate  dw    0532h,05d2h,0672h,0712h,07b2h,0852h,08f2h,0992h,0a32h,0ad2h,0b72h,0c12h,0cb2h
;这块表示登陆界面中的 level 选项，默认是 1, 3 表示简单，2 表示中等，1 表示困难
    level       db    1
;0表示死亡，1表示程序退出，2表示胜利
    game_flag   db    2
;这一向用来保存退出界面的选项：1、表示退出。2、表示重新开始
	game_choose db    1
    value_temp  dw    100    dup(0)
;表示所得分数
    score       dw    0
    char_score  db    0,0,0
    food_x      db    (?)
    food_y      db    (?)
;coordinate_x表示列，coordinate_y表示行
    coordinate_x db   (?)
    coordinate_y db   (?)
;0表示没有存在食物，1表示存在
    exit_food   db    1
;0表示没有吃到食物，1表示食物被吃掉了
    eat_food    db    0
    snake_head  dw    440
;0表示向上，1向下，2向左，3向右
    snake_dir   db    0
;这个用户输入的提示信息现实数据
    info        db    "please input (can't over 3 times error input):$"
data ends

stack segment
    db 200 dup(?)
stack ends

code segment
    assume cs:code,ds:data,ss:stack
main proc far
start:
    mov ax,data
    mov ds,ax
    mov ax, stack
    mov ss, ax
    mov sp, 200
    mov dl, 0
    call clear
    call display                            ; 登陆界面的显示
    call display_choose                     ; 登陆界面的选择处理
    call clear
    call init_menu
    call food_create
    call ingame

    mov ax,4c00h
    int 21h
main endp
;--------------------------------------------------
;music open
music:
    push cx
    push bx
p:    
    mov si,music_si[0]
    mov di,music_di[0]
    mov cx,mus[si]
    cmp cx, -1
    je p
    mov bx,time[di]
    call sound
    add si, 2            ; 取下一频率值
    add di, 2            ; 取下一时间节拍值
    cmp si, 50
    jne q
    mov si, 0
    mov di, 0
q:    
    mov music_di[0], di
    mov music_si[0], si
    pop bx
    pop cx
    ret

sound:
    push dx
    mov al, 0b6h        ; 向计数器写控制字
                        ; 方式3、双字节写和二进制计数方式写到控制口
    out 43h, al            ; 公用的控制寄存器（I/O 端口 43H）
    mov dx, 08h
    mov ax, 208h
    div cx                ; 除以频率，其商 ax 为计数值
                        ; 计数器2（I/O 端口 42H）用来控制扬声器发生
    out 42h, al            ; 计数值先送低 8 位
    mov al, ah
    out 42h, al            ; 计数值后送高 8 位
    in al, 61h
    mov ah, al
    or al, 3
    out 61h, al
l:
    push dx
    push ax
    mov dx, 8h
    mov ax, 0f05h

s:
    sub ax, 1
    sbb dx, 0            ; 这条语句表示只要 ax 不错位，那么 CF 就等于 0，dx - CF = dx 不影响 dx 的值。当 ax 减没了，错位了，dx 才减少 1
    jnz s
    pop ax
    pop dx
    dec bx
    jnz l
    mov al, ah
    out 61h, al
    pop dx
    ret
;--------------------------------------------------
;wait the game
wait_game proc near
    mov al,level[0]
    push ax
    mov ah,2ch
    int 21h
    pop ax
    add dh,al
    mov bl,dh
    cmp bl,3ch
    jb wait_time
    sub bl,60
wait_time:
    push bx
    mov ah,2ch
    int 21h
    pop bx
    cmp bl,dh
    je wait_end
    jmp wait_time
wait_end:
    mov ah,1
    int 16h
    jz wait_quit
    mov ah,0
    int 16h
    cmp al,'w'
    je dir_w
    cmp al,'s'
    je dir_s
    cmp al,'a'
    je dir_a
    cmp al,'d'
    je dir_d
dir_w:
    mov al,0
    jmp wait_dir
dir_s:
    mov al,1
    jmp wait_dir
dir_a:
    mov al,2
    jmp wait_dir
dir_d:
    mov al,3
    jmp wait_dir
wait_dir:
    mov snake_dir[0],al
wait_quit:
    ret 
wait_game endp
;--------------------------------------------------
;初始化游戏
init_menu proc near
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
    
    mov ax,442
    mov s_locate[440],ax
    mov ax,444
    mov s_locate[442],ax
    mov ax,2048
    mov s_locate[444],ax
    mov ax,0b870h
    mov es,ax
    mov al,level[0]
    add al,30h

    mov es:[2],al

    mov al,level[0]
    ret
init_menu endp
;--------------------------------------------------
;开始游戏
ingame proc near
    call wait_game
    call go_snake 
    call music
    call is_alive
    mov bx,offset game_flag
    mov dl,[bx]
    cmp dl,0
    je end_ingame
    call draw_snake
    mov bx,offset eat_food
    mov dl,[bx]
    cmp dl,0
    je ingame
    call scores_increase
    call food_create
    mov dl,0
    mov eat_food[0],dl
    jmp ingame
end_ingame:
    call end_deal
    ret
ingame endp
;--------------------------------------------------
end_deal proc near
    push ax
	push bx
	push cx
	push dx
	push si
	push di
	mov bx, offset game_flag
	mov dl, [bx]
    mov cx, 13h                ; all of 19 line and loop 19 times
    mov ax, 0b81fh            ; the start address and show memory
    mov es, ax
	cmp dl, 0
	je show_gameover
	cmp dl, 1
	je show_gameover 
	cmp dl, 2
	je show_gamesuccess
show_gameover:
    call clear
    mov bx, offset game00
	jmp row2
show_gamesuccess:
	mov bx, offset success00
	jmp row2
row2:
    push cx
    mov cx, 60
    mov si, 0h
col2:
    mov al, [bx]
    mov es:[si], al

    cmp al, 2ah  
    je color12
    
    cmp al, 23h
    je color22
    
    jmp color32

color12:
    mov di, 0h
    jmp loop02

color22:
    mov di, 1h
    jmp loop02

color32:
    mov di, 2h
    jmp loop02

color42:
    mov di, 3h

loop02:
    mov ah, [di]
    mov es:[si + 1], ah
    inc bx
    add si, 2
    loop col2
    pop cx

    mov ax, es
    add ax, 0ah
    mov es, ax
    add bx, 3
    loop row2
	
	call display_choose
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
end_deal endp
;--------------------------------------------------
;分数增加
scores_increase proc near
    mov bx,offset score
    mov ax,[bx]
    inc ax
    mov [bx],ax
    mov ax,0b852h
    mov es,ax
    mov si,4
    call trans_char 
    mov bx,offset value_temp
    mov cx,[bx+0]
    mov bx,offset char_score
increase:
    mov al,[bx]
    inc bx
    mov es:[si],al
    sub si,2
    loop increase
    ret
scores_increase endp
;--------------------------------------------------
;将十进制数转化为字符型
trans_char proc near
    mov bx,offset score
    mov ax,[bx]
    mov dl,10
    mov cx,0
    mov bx,offset char_score
trans_loop:
    cmp ax,0
    je trans_end
    div dl
    add ah,30h
    mov [bx],ah
    inc bx
    inc cx
    mov ah,0
    jmp trans_loop
trans_end:
    mov bx,offset value_temp
    mov [bx],cx
    ret
trans_char endp
;--------------------------------------------------
;判断食物是否被吃掉
food_eat proc near
    mov bl,food_y[0]
    mov al,84
    mul bl
    mov dx,ax
    mov bl,food_x[0]
    mov bh,0
    mov al,bl
    mov bl,2
    mul bl
    add dx,ax
    mov ax,dx
    mov dx,snake_head[0]
    cmp ax,dx
    je eat
    mov dl,0
    mov eat_food[0],dl
    jmp eat_end
eat:    
    mov dl,1
    mov eat_food[0],dl
    jmp eat_end
eat_end:
    ret
food_eat endp
;--------------------------------------------------
is_alive proc near
    mov al,game_flag[0]
    cmp al,0
    je alive_end
    mov al,eat_food[0]
    cmp al,1
    je eated
    mov ax,value_temp[8]
    cmp ax,1
    je alive
    cmp ax,2048
    je alive
    mov al,0
    mov game_flag[0],al
    jmp alive_end
alive:
    mov al,2
    mov game_flag[0],al
    jmp alive_end
eated:
    mov ax,value_temp[8]
    cmp ax,1
    je alive
    mov al,0
    mov game_flag[0],al
    jmp alive_end
alive_end:
    ret
is_alive endp
;--------------------------------------------------
;让蛇朝着snake_dir的方向走
go_snake proc near
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
    cmp ax,84
    jb relay
    sub ax,84
    jmp food
down:
    cmp ax,1008
    je relay
    add ax,84
    jmp food
left:    
    push ax
    mov bl,84
    div bl
    cmp ah,0
    je relay
    pop ax
    sub ax,2
    jmp food
right:    
    push ax
    mov bl,84
    div bl
    cmp ah,82
    je relay
    pop ax
    add ax,2
    jmp food
relay:
    jmp snake_over
food:
    mov bx,snake_head[0]
    mov snake_head[0],ax
    mov si,ax
    push bx
    mov bx,offset s_locate
    mov cx,[bx+si]
    pop bx
    mov s_locate[si],bx
    mov value_temp[8],cx
    cmp cx,1
    jne snake_over
continue:
    mov cx,s_locate[bx]
    cmp cx,2048
    je compare
    mov ax,bx
    mov bx,cx
    jmp continue
compare:
    mov value_temp[10],bx
    push bx
    push ax
    call food_eat
    pop ax
    pop bx
    mov dl,eat_food[0]
    cmp dl,1
    je go_end
    mov dx,1
    mov s_locate[bx],dx
    mov dx,2048
    mov bx,ax
    mov s_locate[bx],dx
    jmp go_end
snake_over:
    mov bl,0
    mov game_flag[0],bl
    jmp go_end
go_end:  
    ret
go_snake endp
;--------------------------------------------------
;画蛇
draw_snake proc near
    mov ax,snake_head[0]
    push ax
    mov bl,84
    div bl
    mov coordinate_y,al
    mov al,ah
    mov ah,0
    mov bl,2
    div bl
    mov coordinate_x,al
    call locate
    mov es,value_temp[0]
    mov si,value_temp[2]
    mov dl,'@'
    mov es:[si],dl
    pop ax
draw_body:
    mov bx,ax
    mov ax,s_locate[bx]
    push ax
    mov dl,84
    div dl
    mov coordinate_y,al
    mov al,ah
    mov ah,0
    mov dl,2
    div dl
    mov coordinate_x,al
    pop ax
    cmp ax,2048
    je draw_tail
    push ax
    call locate
    mov es,value_temp[0]
    mov si,value_temp[2]
    mov dl,'-'
    mov es:[si],dl
    pop ax
    jmp draw_body
draw_tail:    
    mov ax,bx
    push ax
    mov dl,84
    div dl
    mov coordinate_y,al
    mov al,ah
    mov ah,0
    mov bl,2
    div bl
    mov coordinate_x,al
    call locate
    mov es,value_temp[0]
    mov si,value_temp[2]
    mov dl,'>'
    mov es:[si],dl
    pop ax
    mov bx,value_temp[10]
    cmp ax,bx
    je draw_end
    call clear_tail
draw_end:    
    ret
draw_snake endp
;--------------------------------------------------
clear_tail proc near
    mov ax,value_temp[10]
    mov dl,84
    div dl
    mov coordinate_y,al
    mov al,ah
    mov ah,0
    mov bl,2
    div bl
    mov coordinate_x,al
    call locate
    mov es,value_temp[0]
    mov si,value_temp[2]
    mov dl,' '
    mov es:[si],dl
    ret
clear_tail endp
;--------------------------------------------------
;随机放置食物
food_create proc near
food_begin:
    mov ah,0
    int 1ah
    mov ax,dx
    and ah,3
    mov dl,13
    div dl
    mov bx,offset coordinate_y
    mov food_y[0],ah
    mov [bx],ah    
    
    mov ah,0
    int 1ah
    mov ax,dx
    and ah,3
    mov dl,43
    div dl
    mov bx,offset coordinate_x
    mov food_x[0],ah
    mov [bx],ah
    
    call locate
    mov es,value_temp[0]
    mov si,value_temp[2]
    mov dl,' '
    cmp es:[si],dl
    je food_end
    jmp food_begin

food_end:
    mov dl,'&'
    mov es:[si],dl

    ret
food_create endp
;--------------------------------------------------
;确实放置区域
locate proc near
    mov bx,offset coordinate_y
    mov dl,[bx]
    mov al,2
    mul dl
    mov si,ax
    mov bx,offset coordinate
    mov ax,[bx+si]
    push ax

    mov bx,offset coordinate_x
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

    mov value_temp[0],es
    mov value_temp[2],si
    ret
locate endp
;--------------------------------------------------
;清屏函数
clear proc near
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
clear endp
;--------------------------------------------------
;显示信息    
display proc near
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
display endp
;--------------------------------------------------
;登陆界面选项处理
display_choose proc near
    push ax
    push bx
    push cx
	push dx
	push si
	push di
	mov cx, 3
ag:
	mov ax, 0b8f1h
	mov es, ax
    mov bx, offset info
	mov si, 0h
	push cx
	xor cx, cx
    mov cx, 46
y:
	mov al, [bx]
	mov es:[si], al
	mov di, 0h
	mov ah, [di]
	mov es:[si + 1], ah
	inc bx
	add si, 2
	loop y
	pop cx
	mov ah, 2
	mov bh, 0
	mov dh, 24
	mov dl, 54
	int 10h
    mov ah, 01h
    int 21h
    sub al, 30h
	cmp al, 1
	je p1
	cmp al, 2
	je p1
	cmp al, 3
	je p1
	cmp al, 4
	je p2
	cmp al, 5
	je p3
	loop ag
	jmp p2
p1:
    mov level[0], al
	jmp end_show
p2:
	mov ax, 4c00h
	int 21h
p3:
	mov game_choose, al
end_show:   
	pop di
	pop si
	pop dx
	pop cx
    pop bx
    pop ax

    ret
display_choose endp
;--------------------------------------------------

code ends


end start
