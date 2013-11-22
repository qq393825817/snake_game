assume cs:code,ds:data,ss:stack
data segment
;0表示没有结束，1表示死亡，2表示程序退出，3表示胜利
	game_ove    db    0
;表示所得分数
	score       db    0
;0表示蛇已经死了，1表示还活着
	snake_alive db    1
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
	call clear
	call display
	call ingame	
	nop

	mov ax,4c00h
	int 21h
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
	mov ah,0
	int 1ah
	mov ax,dx
	and ah,3
	mov dl,9
	div dl
	mov bl,ah

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
