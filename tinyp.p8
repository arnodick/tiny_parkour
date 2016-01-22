pico-8 cartridge // http://www.pico-8.com
version 5
__lua__
--tiny parkour
--by ashley pringle
debug=true
doff=0
function items_i(r)
if r==2 then
makeitem_s( 16,14, -7,1, 8, 9,12,14, 6, 2, 3, 0,1)--1 stairs top left
	makeitem(  23,25, -2,1, 8, 9,       2,25,23, 0,1)--2 crossroad
	makeitem(  37,15, -3,1, 8, 9,       2, 6,19,14,2)--3 pilings
	makeitem(  49,36, -9,1, 8, 9,       4,19,14, 0,1)--4 arches middle
	makeitem(  71,35, -4,1,10,11,       4,31, 0, 0,2,3)--5 arches secret! 
	makeitem(  49,14,-13,1, 3,11,       0,17,33, 0,0,4)--6 on top of the wall
	makeitem(  61,15,-10,1, 8, 9,       4,19, 0, 0,1)--7 leap of faith
	makeitem(  24, 0, -5,1, 0, 0,      20, 9, 0, 0,1)--8 top curve jump
	makeitem(  60, 0,-13,1, 8,12,       4,10,16, 0,1)--9 top long jump
	makeitem(  76,11, -5,1, 4, 9,       4,36, 0, 0,1,9)--10 back to mid jump
	makeitem( 125,14, -5,1, 8,12,      10, 0, 0, 0,1)--11 far right hazards
	makeitem(  10, 0, -9,1, 8, 9,       4, 0, 0, 0,1)--12 weird top left secret
	makeitem(  44, 2, -5,1, 8, 9,       4, 7, 0, 0,1)--13 top detour
	makeitem(  71,35, -4,1, 9, 8,       9,31, 0, 0,1,2)--14 false leap of faith
makeitem_s( 68,11,-10,1,12,11,64,11,12,35, 0, 0,2,6)--15 secret reveal!
	makeitem(  93, 1,-13,1, 8,12,       4,37,26, 0,2)--16 top hook jumps
	makeitem(  85,14,-10,1,10,11,      12,11, 0, 0,1)--17 secret climb
makeitem_s( 31,11, -2,1, 0, 0,28,11, 4,15, 0, 0,1)--18 invisible checkpoint
	makeitem( 	76,15, -1,1, 8, 9,       9,28, 0, 0,0,1)--19 post lof
	makeitem( 	11, 1, -3,1, 8, 9,       3,22, 0, 0,0)--20 start easy
	makeitem( 	12,22, -3,1, 0, 0,       3,29, 0, 0,1)--21 s route secret
	makeitem(  	5, 7, -3,1, 8, 9,       3, 1, 0, 0,0)--22 2nd easy
	makeitem(  	5,25, -1,1,12,13,       8,27, 0, 0,1,7)--23 s route
makeitem_s( 14, 0,-10,1,10,11,11, 0,24, 0, 0, 0,1)--24 secret get!
	makeitem( 	32,26, -5,1, 8, 9,       2, 4, 5, 0,0)--25 crossroad
makeitem_s(101, 0,-13,1,12,10,99, 0, 4,24, 0, 0,0,11)--26 top innaccess
makeitem_s( 16,45, -3,1, 8, 9, 3,39, 4,32, 0, 0,1)--27 s route
	makeitem( 	87,26, -4,1, 8, 9,       4,30, 0, 0,0)--28 pilar challenge
	makeitem( 	18,32, -3,1,10,14,       8,34, 0, 0,3,8)--29 s route secret
makeitem_s(117,21, -5,1, 8, 9,111,21,0,17, 0, 0,0)--30 
	makeitem(	121,35, -5,1, 8, 9,       2, 0, 0, 0,1)--31 crossroad
makeitem_s( 85,61, -4,1, 8, 9,83,61,14, 0, 0, 0,1)--32 s puzzle final
	makeitem( 	58,48,  0,1, 8, 9,       0,32, 0, 0,1,5)--33 mid secret reveal
makeitem_s( 36,49, -3,0, 8, 9,38,63, 0,32, 0, 0,0)--34 indy bridge
makeitem_s(116,11,  0,0, 8, 9,125,11,0, 0, 0, 0,2)--35 inv bridge
	makeitem(60,20,   	0,0, 8, 9,       0,31, 0, 0,1)--36 top to mid end
	makeitem(116,2,   -4,0, 8,12,       4,0,  0, 0,1,10)--37 top standard
	
--	makeitem( 93,56,-mget(93,56),1,14,11,0,0,0,0,0)--31 post lof
--	makeitem(101,56,-mget(101,56),1,14,11,0,0,0,0,0)--35 post lof
--	makeitem( 95,56,-mget(95,56),1,14,11,0,0,0,0,0)--32 post lof
--	makeitem( 99,56,-mget(99,56),1,14,11,0,0,0,0,0)--34 post lof
--	makeitem_s( 97,58,-mget(97,58),1,14,11,0,0,0,0,0)--33 post lof
	
	add(items,item_list[8])
	add(items,item_list[18])
	add(items,item_list[20])
	add(items,item_list[21])
end
--if r==1 then

--end
end

function buttons_i(r)
if r==1 then
	doff=30
	local ro=rooms[r]
	if ro.gen==true then
		player[1].z=-85
		sfx(19,-1,0)
		ro.gen=false
	end
	for b=1,126 do for a=2,30 do mset(b,a,0) end end	
	makebutton(70,20,0,0,6,2,70,20,0,1,1,true)
	makeexit(17,0,-20,1)
end
if r==2 then
	doff=0
	local ro=rooms[r]
	if ro.gen==true then
		timer=0
		makeclouds(14,3,rnd(10))
		bubblei=200
		for a=1,bubblei do
			makebubble(flr(rnd(ro.w)),flr(rnd(ro.h)),rnd(0.6)+0.1,2+flr(rnd(2)-1))
		end
		ro.gen=false
	end
	
	for b=0,2 do
		for a=0,2 do makebutton(49, 20,-11,0,13,5,57+b,37-a,0,8,-1,true) end
	end
	for a=1,2 do makebutton(45, 2, -4,  0,13,5,49, a,22,5,1,true) end
	makebutton(101, 0,-mget(101,0), 0,13,5,101,0,22,1,1,false)
	makebutton(85, 0, -mget(85,0),  0,13,5,78, 0,22,4,1,false)
	makebutton(87, 0, -mget(85,0),  0,13,5,71, 0,25,6,1,false)
	makebutton(89, 0, -mget(85,0),  0,13,5,64, 0,25,10,1,false)
	makebutton(91, 0, -mget(85,0),  0,13,5,57, 0,22,10,1,false)
	makebutton(93, 0, -mget(85,0),  0,13,5,50, 0,22,10,1,false)
	makebutton(85, 0, -mget(85,0),  0,13,5,45, 0,23,10,1,false)
	makebutton(97, 0, -mget(85,0),  0,13,5,97, 0,0,1,-1,false)
	makebutton(95, 0, -mget(85,0),  0,13,5,95, 0,0,1,-1,false)
	
	makebutton(18, 32,-3, 0,13,5,36,49,3, 1, 1,false)
	makebutton(64, 11,-mget(64,11), 0,13,5,72,11,8,4, 1,false)
	--makebutton(64, 11,-mget(64,11), 1,13,5,68,11,7,4, 1,false)
	makebutton(72, 11,-8, 0,13,5,76,11,8,4, 1,false)
	makebutton(72, 11,-8, 0,13,5,75,11,0,1,-1,false)
	makebutton(72, 11,-8, 0,13,5,77,11,0,1,-1,false)
	makebutton(76, 11,-8, 0,13,5,80,11,8,1, 1,false)
	makebutton(22, 25,-mget(23,25), 0,13,5,23,25,2,30,1,true)
	makebutton(85, 21,-mget(85,21), 0,13,5,85,15,9,10,1,false)
	makebutton(117, 26,-mget(117,26), 0,13,5,117,21,5,10,1,false)
	
	for a=0,2 do makebutton(92,1,-8,2,13,5,96+a,1,12,1, 1,false) end
	
	makebutton(91, 14,-mget(91,14), 0,13,5,91, 14,0,20,-1,false)
	makebutton(97, 14,-mget(97,14), 0,13,5,97, 14,0,20,-1,false)
	makebutton(103,14,-mget(103,14),0,13,5,103,14,0,20,-1,false)
	makebutton(107,14,-mget(107,14),0,13,5,107,14,0,20,-1,false)
	makebutton(111,14,-mget(111,14),0,13,5,111,14,0,20,-1,false)
	makebutton(117,14,-mget(117,14),0,13,5,117,14,0,20,-1,false)
	makebutton(81,35,-mget(81,35),0,13,5,81,35,0,10,-1,false)
	makebutton(90,35,-mget(90,35),0,13,5,90,35,0,10,-1,false)
	makebutton(97,35,-mget(97,35),0,13,5,97,35,0,10,-1,false)
	for a=0,7 do makebutton(3 ,25,-3, 0,13,5,3, 25+a,0,12-a, -1,false) end
	for a=0,7 do makebutton(10,32,-3,0,13,5,10+a,32,0,12-a-flr(rnd(3)), -1,false) end
	for a=0,4 do makebutton(12,22,-3,0,13,5,5+a,22,0,4+flr(rnd(4)), -1,true) end
	makebutton(12,22,-3,0,13,5,5,23,0,2, -1,false)
	makebutton(12,22,-3,0,13,5,5,24,0,2, -1,false)
	makebutton(92,1,-8,2,13,5,92,1,0,1, -1,false)
	makebutton(64,14,-12,2,0,5,64,14,0,1, -1,false)
	makebutton(80,14,-5,4,0,5,82,14,0,1, -1,false)
	makebutton(74,14,-5,2,13,5,76,14,1,1, -1,false)
	makebutton(63,60,-19,0,0,5,57,60,22,1, 1,false)
	makebutton(51,60,-16,0,0,5,51,60,160,1, 1,false)
	makebutton(0,62,-8,0,13,5,0,62,200,1, 1,true)

	makebutton_s(2,  38,-mget(3,39),  1,8,9,3,  50,6,3,3,3,20, 62,-5)
	makebutton_s(100,35,-mget(100,35),0,8,9,104,35,4,4,1,3,121,35,-5)

 switchy=0
	makebutton_p(3,50,-3,1,-1)
	makebutton_p(9,50,-3,1,1)
	makebutton_p(15,50,-3,1,0)
	makebutton_p(3,56,-3,1,3)
	makebutton_p(9,56,-3,1,2)
	makebutton_p(15,56,-3,1,-1)
	makebutton_p(3,62,-3,1,4)
	makebutton_p(9,62,-3,1,5)
	makebutton_p(15,62,-3,1,6)

	makebutton_c(18,32,-3,0,0,0,19,32,3,1,3,false,1,0,0,6)	
	makebutton_c(24,32,-3,0,0,0,25,32,2,1,1,false,1,0,-1,2)	
	makebutton_c(24,32,-3,0,0,0,24,33,3,1,3,false,0,1,0,17)	
	makebutton_c(24,39,-3,0,0,0,25,39,3,1,3,false,1,0,0,10)	
	makebutton_c(25,49,-2,0,0,0,25,49,3,1,3,false,1,0,0,5)	
	makebutton_c(34,39,-3,0,0,0,35,39,2,1,1,false,1,0,-1,2)	
	makebutton_c(10, 0,-8,0,0,0,11, 0,0,1,-8,false,-1,0,0,11)	
	makebutton_c(0,  1,-8,0,0,0, 0, 0,0,1,-8,false,0,1,0,61)	
	makebutton_c(80,11,-8,0,0,0,81,11,8,1, 8,false,1,0,0,26)
	makebutton_c(82,11,-8,0,0,0,81,11,0,1,-8,false,1,0,0,25)	
	makebutton_c(106,11,-8,0,0,0,108,11,8,1, 1,false,2,0,0,5)	
	makebutton_c( 76,20,-1,0,0,0, 75,20,2,1, 1,false,-1,0,1,10)	

	makebutton_l(42,1,-4,0,13,5,44,2,4,15,1,false,1,0,0,2)
	makebutton_l(44,0,-22,0,13,5,122,1,8,30,1,true,1,0,1,4)
	makebutton_l(99,0,-22,0,13,5,102,0,0,1,-1,false,-2,0,0,9)	
	makebutton_l(72,11,-8,0,13,5,75,10,0,1,-1,false,1,0,0,2)	
	makebutton_l(72,11,-8,0,13,5,75,12,0,1,-1,false,1,0,0,2)	
	makebutton_l(72,11,-8,0,13,5,75,13,0,1,-1,false,1,0,0,2)	
	makebutton_l(76,14,-1,0,13,5,76,19,1,1, 1,false,0,1,0,1)	
	
	maketele(31,62,-19,1,83,61)
	maketele(58,31,-1,0,58,48)
	maketele(58,48,-1,0,83,61)
	maketele(36,49,-3,0,38,63)
end
end

function sky_i(r)
if r==1 then
	tut_c=1
	tut={}
	tut[1]="hold button 1 to jump"
	tut[2]="hold button 2 to walk"
	tut[3]="d pad + button 1 or 2 to move"
	tut[4]="welcome to tiny parkour!"
	tut[5]="everyone forgot how to parkour"
	tut[6]="so god of parkour is enraged.."
	tut[7]="we send our   best   parkourer"	
	tut[8]="you are ... ... the chosen one"
	tut[9]="defeat   the parkour challenge"
	tut[10]="become   champion of parkour!"
end
if r==2 then
	star1={} star2={}
	for a=1,100 do star1[a]=rnd(127) star2[a]=rnd(100) end
	moon1={} moon2={}
	for a=1,30 do moon1[a]=92+rnd(15) moon2[a]=-32-rnd(15) end
	thunder=200+flr(rnd(1000))
end
end

function makeroom(mw,mh,c1,c2,flc,dest,src,len,px,py)
	local r={}
	r.w=mw
	r.h=mh
	r.c1=c1
	r.c2=c2
	r.flc=flc
	r.dest=dest
	r.src=src
	r.len=len
	r.px=px
	r.py=py
	r.gen=true
	add(rooms,r)
end

function makeexit(x,y,z,w)
	local e={}
	e.x=x
	e.y=y
	e.z=z
	e.w=w
	e.pressed=false
	add(exits,e)
end

function makeactor(x,y,z,w,c1,c2)
	local a={}
	a.x=x
	a.y=y
	a.z=z
	a.w=w
	a.c1=c1
	a.c2=c2
	--add(actor,a)
	return a
end

function makeplayer(x,y,z,w,c1,c2,s)
	local p=makeactor(x,y,z,w,c1,c2)
	p.speedi=s
	p.speed=s
	p.xspeed=0
	p.yspeed=0
	p.zspeed=0
	p.xs=17 p.ys=1
	p.fall=0
	p.ground=0
	p.id=#player
	add(player,p)
end

function makeclouds(n,h,s)
	cloudy={}
	cloudh={}
	clouds={}
	for i=1,n do 
		cloudy[i]=flr(rnd(42)-48)
		cloudh[i]=flr(rnd(h))
		clouds[i]=rnd(s)+2
	end
end

function makepart(x,y,xs,ys,c)
	local p={}
	p.x=x
	p.y=y
	p.xs=rnd(xs)-xs/2
	p.ys=rnd(ys)-ys/2
	p.c=c
	p.ts=timer
	add(parts,p)
end

function makebubble(x,y,s,c)
	local b={}
	b.x=x
	b.y=y
	b.xs=s
	b.ys=0
	b.c=c
	b.d=1
	add(bubbles,b)
	return b
end

function makeitem(x,y,z,w,c1,c2,b,ic1,ic2,ic3,v,r)
	local i=makeactor(x,y,z,w,c1,c2)
	i.xs=x i.ys=y--spawn point is where checkpoint is
	i.b=b--bounce height
	i.ic1=ic1--checkpoints spawned by get
	i.ic2=ic2
	i.ic3=ic3
	i.v=v
	i.r=r
	i.n=#item_list
	add(item_list,i)
	return i
end

function makeitem_s(x,y,z,w,c1,c2,xs,ys,b,ic1,ic2,ic3,v,r)
	local is=makeitem(x,y,z,w,c1,c2,b,ic1,ic2,ic3,v,r)
	is.xs=xs--spawn point is customized
	is.ys=ys
end

function makebutton(x,y,z,w,c1,c2,px,py,pz,spd,di,vis)
	local b=makeactor(x,y,z,w,c1,c2)
	b.px=px
	b.py=py
	b.pz=pz
	b.spd=spd
	b.di=di
	b.vis=vis
	b.pressed=false
	--b.n=#buttons
	add(buttons,b)
	return b
end

function makebutton_s(x,y,z,w,c1,c2,stx,sty,sp,c,r,h,xs,ys,zs)
	local b=makeactor(x,y,z,w,c1,c2)
	b.stx=stx
	b.sty=sty
	b.sp=sp
	b.c=c
	b.r=r
	b.h={0,h}
	b.xs=xs
	b.ys=ys
	b.zs=zs
	b.pressed=false
	b.switch=1
	add(buttons_s,b)
end

function makebutton_p(x,y,z,w,v)
	local b={}
	b.x=x
	b.y=y
	b.z=z
	b.w=w
	b.v=v
	b.pressed=false
	add(buttons_p,b)
end

function makebutton_c(x,y,z,w,c1,c2,px,py,pz,spd,di,vis,xd,yd,zd,l)
	local b=makebutton(x,y,z,w,c1,c2,px,py,pz,spd,di,vis)
	del(buttons,b)
	b.xd=xd
	b.yd=yd
	b.zd=zd
	b.l=l
	b.li=0
	add(buttons_c,b)
	return b
end

function makebutton_l(x,y,z,w,c1,c2,px,py,pz,spd,di,vis,xd,yd,zd,l)
	local b=makebutton_c(x,y,z,w,c1,c2,px,py,pz,spd,di,vis,xd,yd,zd,l)
	del(buttons_c,b)
	add(buttons_l,b)
end

function maketele(x,y,z,w,xt,yt)
	local t={}
	t.x=x
	t.y=y
	t.z=z
	t.w=w
	t.xt=xt
	t.yt=yt
	t.pressed=false
	add(teles,t)
end

function makefinish(x,y,z)
	local e={}
	e.x=x
	e.y=y
	e.z=z
	e.pressed=false
	add(finish,e)
end

function makeending(x,y,z)
	local e={}
	e.x=x
	e.y=y
	e.z=z
	e.w=0
	e.pressed=false
	add(ending,e)
end

function makeboss(x,y,z)
	local b={}
	b.x=x
	b.y=y
	b.z=z
	b.xs=x
	b.ys=y
	b.zs=z
	b.r=0
	b.eh=0.01
	b.t=timer
	b.ti=120
	b.tk=360
	b.text_c=1
	b.dial={}
	b.dial[1]="try again, mortal"
	b.dial[2]="well done... now die"
	b.dial[3]="i may be impressed..."
	b.dial[4]="where did you learn parkour?"
	b.dial[5]="better than most mortals, mortal"
	b.dial[6]="you have become champion of parkour"
	b.dial[7]="you have become champion of parkour"
	b.dial[8]="you have become champion of parkour"
	b.dial[9]="you have become champion of parkour"
	b.dial[10]="you have become champion of parkour"
	b.dial[11]="you have become champion of parkour"
	add(boss,b)
end

function makemenu()
	local m={}
	m.opt={}
	m.opt[1]="continue"
	m.opt[2]="restart"
	m.opt[3]="quit"
	m.sel=0
	add(menus,m)
end

function doplayer(p)
	--if p.z==-15 then music(0,0,1) end
	--if p.z>15 then music(-1,0,1) end
	local r=rooms[room]
	p.xspeed=0 p.yspeed=0
	local gh=mget(p.x,p.y)
	if(btn (5,p.id) or btn(4,p.id)) then
	if btn(5,p.id) then p.speed=0.3 else p.speed=0.5 end
		if(btn (0,p.id))then p.xspeed=-p.speed end
		if(btn (1,p.id))then p.xspeed=p.speed end
		if(btn (2,p.id))then p.yspeed=-p.speed end
		if(btn (3,p.id))then p.yspeed=p.speed end
	else p.x=flr(p.x) p.y=flr(p.y)
	end
	--if on the ground then
	if p.z>=-gh then
	 --can jump
	 if p.ground>0 then
			if(btnp(4,p.id)) then p.zspeed=p.speed sfx(3,-1) end
		end
		--if hit bottom, die
		if r.flc==0 then
			if gh==0 then
				deaths+=1
				dset(63,dget(63)+1)
				sfx(2,2)
				if #bubbles>bubblei+6 then while #bubbles>bubblei do bubbles[#bubbles]=nil end end
				--if #bubbles>bubblei+6 then while #bubbles>bubblei do del(bubbles,bubbles[#bubbles]) end end
				makebubble(p.x,p.y,rnd(0.1)+0.1,p.c1)
				makebubble(p.x,p.y,rnd(0.1)+0.1,p.c2)
 			
 			for k,v in pairs(parts) do parts[k]=nil end
	 		for a=1,30 do makepart(player[1].x,player[1].y-mget(player[1].x,player[1].y),3,3,player[1].c2) end

	 		for k,v in pairs(player) do player[k]=nil end
	 		rtimer=timer
			end
		end
		p.fall=0 p.ground+=1
	end	
	
	--if not next to a wall, move
	if(p.z-1<=-mget(p.x+p.xspeed,p.y+p.yspeed)) then
		p.x+=p.xspeed p.y+=p.yspeed
	end
	p.z-=p.zspeed
	
	--if in the air, fall
	if(p.z<-mget(p.x,p.y)) then p.zspeed-=0.09 p.ground=0
		if p.zspeed<0 then p.fall+=1 p.speed=0.5 end
	--if not, stand at map's height
	else p.z=-mget(p.x,p.y) --fall=0
	end
end

function doitem(i)
	local p=player[1]
	if p!=nil then
	if i.x==flr(p.x) and i.y==flr(p.y) and (flr(i.z)==flr(p.z) or flr(i.z)==flr(p.z-1)) then
		score+=i.v
		for a=1,20 do makepart(i.x,i.y+i.z,1,1,i.c1) end
		if i.v==0 then sfx(4,-1)
		else sfx(6+score,-1) end
		rooms[room].px=i.xs rooms[room].py=i.ys
		local ic={}
		ic[1]=i.ic1
		ic[2]=i.ic2
		ic[3]=i.ic3
		if i.r!=nil then route=i.r rc[1]=i.c1 rc[2]=i.c2 end
		for k,v in pairs(items) do items[k]=nil end
		for a=1,3 do
			add(items,item_list[ic[a]])
			if route>0 then
				if ic[a]!=0 then items[#items].c1=rc[1] items[#items].c2=rc[2] end
			end
		end
		doprogress(score,true)
	else
		i.z=(-abs(cos(timer*1/40))*i.b)-mget(i.x,i.y)
		if timer%19==0 then
			local col1=i.c1 local col2=i.c2
			i.c1=col2
			i.c2=col1
		end
	end
	end
end

function dopart(p)
	p.x+=p.xs
	p.y+=p.ys
	if timer-p.ts>=20 then
		for k,v in pairs(parts) do parts[k]=nil end
	end
end

function dobubble(b)
	local r=rooms[room]
	if mget(flr(b.x)+1,b.y)==0 then
		b.x+=b.xs
		if rnd(1)<0.02 then b.y-=b.d b.d=-b.d end --b.d=cos(timer)-1 end
	else
		if mget(flr(b.x),flr(b.y)+1)>0 then
			b.x=flr(rnd(r.w/2)+10) b.y=flr(rnd(r.h))
		else b.y+=b.xs
		end
	end
	if b.x>r.w then b.x=0 b.y=flr(rnd(r.h)) end
end

function dobuttonpress(b)
	if player[1]!=nil then
	local p=player[1]
	if b.x<=flr(p.x) and b.x+b.w>=flr(p.x) and b.y<=flr(p.y) and b.y+b.w>=flr(p.y) and (flr(b.z)==flr(p.z)) then
		if b.pressed==false then
			b.pressed=true
			b.vis=false
			sfx(6,-1)
			return b.pressed
		end
	end
	end
end

function dobutton(b)
	dobuttonpress(b)
	if b.pressed==true then
		if timer%b.spd==0 then
			local h=mget(b.px,b.py)
			if h!=b.pz then
				mset(b.px,b.py,h+b.di)
				sfx(5,-1)
			else return true
			end
		end
	end
end

function dobutton_s(b)
	dobuttonpress(b)
	if player[1]!=nil then
	local p=player[1]
	if b.xs<=flr(p.x) and b.xs+b.w >=flr(p.x)  and b.ys<=flr(p.y) and b.ys+b.w>=flr(p.y)  and b.zs==flr(p.z) then
		b.pressed=false
	end
	if b.pressed==true then
		if timer%40==0 then
			sfx(5,-1)
			local sw=b.switch
			for x=0,b.c-1 do
				for y=0,b.r-1 do
					mset(b.stx+b.sp*x,    b.sty+b.sp*y,b.h[sw+1])
					mset(b.stx+b.sp*x+b.w,b.sty+b.sp*y,b.h[sw+1])
					mset(b.stx+b.sp*x,    b.sty+b.sp*y+b.w,b.h[sw+1])
					mset(b.stx+b.sp*x+b.w,b.sty+b.sp*y+b.w,b.h[sw+1])
					sw=bxor(sw,1)
				end
			end
			b.switch=bxor(b.switch,1)
		end
	end
	end
end

function dobutton_p(b)
	local p=dobuttonpress(b)
	if p==true then
		if b.v==-1 then switchy=0
		else
			switchy=bxor(switchy,2^b.v)
		end
		local s=switchy
		for a=0,7 do
			if band(s,1)==1 then mset(20+a,62,1+4+a*2) mset(20+a,63,1+4+a*2)
			else mset(20+a,62,0) mset(20+a,63,0) end
			s=shr(s,1)
		end
	end
end

function dobutton_c(b)
--	dobuttonpress(b)
	if b.li<b.l then
		if dobutton(b)==true then
			b.x+=b.xd b.y+=b.yd b.z-=b.zd
			b.px+=b.xd b.py+=b.yd b.pz+=b.zd
			b.pressed=false
			b.li+=1
		end
	end
end

function dobutton_l(b)
	dobuttonpress(b)
	if b.pressed==true then
		if timer%b.spd==0 then
			for a=0,b.l do
				local h=mget(b.px+a*b.xd,b.py+a*b.yd)
				if h!=b.pz+a*b.zd then
					mset(b.px+a*b.xd,b.py+a*b.yd,h+b.di)
					sfx(5,-1)
				end
			end
		end
	end
end

function dotele(t)
	local b=dobuttonpress(t)
	if b==true then
		local p=player[1]
		sfx(12,-1)
		p.x=t.xt p.y=t.yt p.z=-100
		p.zspeed=0
		for a=0,50 do makepart(p.x,p.y+p.z,4,4,rnd(15)) end
		t.pressed=false
	end
end

function changeroom(ro)
		rtimer=0
		room=ro
		if room>#rooms then room=#rooms end
		local r=rooms[room]
--		for b=0,127 do for a=0,63 do mset(a,b,0) end end
		for k,v in pairs(exits) do exits[k]=nil end
		for k,v in pairs(finish) do finish[k]=nil end
		for k,v in pairs(ending) do ending[k]=nil end
		for k,v in pairs(boss) do boss[k]=nil end
		for k,v in pairs(items) do items[k]=nil end
	 for k,v in pairs(item_list) do item_list[k]=nil end	 	
		for k,v in pairs(buttons) do buttons[k]=nil end
		for k,v in pairs(buttons_s) do buttons_s[k]=nil end
		for k,v in pairs(buttons_p) do buttons_p[k]=nil end
		for k,v in pairs(buttons_c) do buttons_c[k]=nil end
		for k,v in pairs(buttons_l) do buttons_l[k]=nil end
		for k,v in pairs(teles) do teles[k]=nil end	 		
		for k,v in pairs(parts) do parts[k]=nil end
		--for k,v in pairs(bubbles) do bubbles[k]=nil end
		reload(r.dest,r.src,r.len)
		cam=-r.h camera(0,cam)
--				makeplayer(r.px,r.py,10,1,14-flr(rnd(2))*10,3,ps) --0.5
--		player[1].x=r.px player[1].y=r.py
		items_i(room)
		buttons_i(room)
		sky_i(room)
--	 	doprogress(score,false)
-- end
end

function doexit(e)
	p=dobuttonpress(e)
--	if e.pressed==true then
		if p==true then
			sfx(12,0,-1)
			for k,v in pairs(parts) do parts[k]=nil end
			for a=1,20 do makepart(e.x,e.y-20,1,1,flr(rnd(6))) end	
			for k,v in pairs(player) do player[k]=nil end
			rtimer=timer
		end
--	end 
end

function doprogress(s,i)--i:add ethereal flames
	if score>0 then
		local s=score
		if s>5 then s=5 end
		for b=1,s do
			for a=57,63 do
				mset(81+b*2,a,b*2)
				mset(82+b*2,a,b*2-1)
				mset(112-b*2,a,b*2-1)
				mset(113-b*2,a,b*2)
			end
			if i==true then
--				add(items,item_list[#item_list-5+b])
			end
		end
	end
	if score==5 then
	local h=200
	makefinish(97,59,-16)
	makeending(97,58,-203)
	makebutton(97,59,-16,0,13,5,97,59,h,  2,1,false)
	makebutton(97,59,-16,0,13,5,97,58,h+3,2,1,false)
	makebutton(97,59,-16,0,13,5,98,59,h+2,2,1,false)
	makebutton(97,59,-16,0,13,5,96,59,h+2,2,1,false)
	makebutton(97,59,-16,0,13,5,98,58,h+2,2,1,false)
	makebutton(97,59,-16,0,13,5,96,58,h+2,2,1,false)	
	makebutton(97,59,-16,0,13,5,95,56,h+6,2,1,false)
	makebutton(97,59,-16,0,13,5,99,56,h+6,2,1,false)
	makebutton(97,59,-16,0,13,5,93,56,h+6,2,1,false)
	makebutton(97,59,-16,0,13,5,101,56,h+6,2,1,false)
	end
end

function doending(e)
	local r=rooms[room]
	local p=dobuttonpress(e)
	if p==true then
		for k,v in pairs(items) do items[k]=nil end
		dset(route-1,dget(route-1)+1)
		makeboss(45,58,-r.h*2.5)
	end
end

function doboss(b)
	b.x=b.xs+cos(timer*1/40)*3
	b.z=b.zs+sin(timer*1/70)*10
	if b.r<20 then b.r+=0.5 end
	if timer-b.t==b.ti then b.eh=0.4 sfx(18,-1,0) end
	if timer-b.t==b.tk then
		timescore=timer
		sfx(20,0,-1)
		for k,v in pairs(parts) do parts[k]=nil end
		for a=1,20 do makepart(player[1].x,player[1].y+player[1].z,1,1,flr(rnd(6))) end	
		for k,v in pairs(player) do player[k]=nil end
	end
	if parts[1]==nil and player[1]==nil then
		room=3
		makeroom(127,31,0,0,0,0x2000,0x0000,4096,0,0)--menu
		changeroom(room)
		for b=0,127 do for a=0,31 do mset(b,a,0) end end	
	end
end

function domenu(m)
	if btnp(2) then m.sel-=1 end
	if btnp(3) then m.sel+=1 end
	m.sel=m.sel%3
	local r=rooms[room]
	if btnp(4) then
		if m.sel==0 then--continue
			makeplayer(r.px,r.py,10,1,14-flr(rnd(2))*10,3+flr(rnd(2))*9,ps) --0.5
			sfx(12,-1)
			for a=1,40 do makepart(player[1].x,player[1].y-mget(player[1].x,player[1].y),1,1,flr(rnd(6))) end
	 	reload(r.dest,r.src,r.len)
	 	for k,v in pairs(finish) do finish[k]=nil end
	 	for k,v in pairs(ending) do ending[k]=nil end
	 	for k,v in pairs(boss) do boss[k]=nil end
	 	for k,v in pairs(buttons) do buttons[k]=nil end
	 	for k,v in pairs(buttons_s) do buttons_s[k]=nil end
	 	for k,v in pairs(buttons_p) do buttons_p[k]=nil end
	 	for k,v in pairs(buttons_c) do buttons_c[k]=nil end
	 	for k,v in pairs(buttons_l) do buttons_l[k]=nil end
	 	for k,v in pairs(teles) do teles[k]=nil end
	 	buttons_i(room)
	 	doprogress(score,false)
	 	for k,v in pairs(menus) do menus[k]=nil end
	 end
	 if m.sel==1 then--restart
	 	score=0 route=0 timer=0 deaths=0
	 	r.px=17 r.py=1
	 	changeroom(2)
	 	for k,v in pairs(menus) do menus[k]=nil end
	 end
	 if m.sel==2 then--quit
	 	score=0 route=0 timer=0 start=0 deaths=0
	 	for k,v in pairs(bubbles) do bubbles[k]=nil end
	 	room=1
			rooms[room].gen=true	 	
	 	makeplayer(rooms[room].px,rooms[room].py,10,1,14-flr(rnd(2))*10,3+flr(rnd(2))*9,ps) --0.5			
	 	changeroom(room)
--	 	buttons_i(room)
	 	for k,v in pairs(menus) do menus[k]=nil end
	 end
	end
end

function drawactor(a)
	if player[1]!=nil then
 pset(a.x,a.y-mget(a.x,a.y),5)
 pset(a.x,a.y+a.z,a.c2)
 pset(a.x,a.y-1+a.z,a.c1)
 end
end

function drawsky(r)
if r==1 then
	if start==0 then
		tut_c=drawtext(tut,(128-#tut[tut_c]/2)-timer%256,46,tut_c,1,3,start)
	else
		tut_c=drawtext(tut,(128-#tut[tut_c]/2)-timer%256,46,tut_c,4,10,start)
	end
end
if r==2 then
	if finish[1]!=nil then
		for a=1,100 do if timer%(a*5)==0 then pset(star1[a],star2[a]-200,12+flr(rnd(2))) end end
	end

	circfill(100,-40,10,6)
	for a=1,30 do pset(moon1[a],moon2[a],5) end

	local cdist=180
	local sp=4
	for a=1,#cloudy do
		--rectfill((timer/sp)%cdist+8-cloudx[a],-25-cloudy[a],(timer/sp)%cdist+8-cloudx[a]-30,-25-cloudy[a]-30,5)
		--rectfill((timer/clouds[a])%cdist+cloudx[a],cloudy[a],(timer/clouds[a])%cdist+cloudx[a]-30,cloudy[a]-10,5)
		line((timer/clouds[a])%cdist,cloudy[a],(timer/clouds[a])%cdist-30,cloudy[a]-cloudh[a],5)
		line((timer/clouds[a])%cdist,cloudy[a],(timer/clouds[a])%cdist-30,cloudy[a]-cloudh[a]-1,5)
	end	
	line(((timer/sp)%cdist)+8-40,-41,((timer/sp)%cdist)-8,-40,5)
		
	local sp=3
	line(((timer/sp)%cdist)+8-40,-41,((timer/sp)%cdist)-8,-40,7)
	line(((timer/sp)%cdist)+3-40,-40,((timer/sp)%cdist),-39,7)
	line(((timer/sp)%cdist)+5-40,-39,((timer/sp)%cdist)-5,-39,6)
	
	sp=2	line(((timer/sp)%cdist)+6-20,-43,((timer/sp)%cdist)-6,-43,7)
	line(((timer/sp)%cdist)+3-20,-42,((timer/sp)%cdist),-42,7)
	line(((timer/sp)%cdist)+5-20,-41,((timer/sp)%cdist)-5,-41,6)
	
	sp=2.5
	line(((timer/sp)%cdist)+3-15,-39,((timer/sp)%cdist),-39,7)
	line(((timer/sp)%cdist)+5-15,-38,((timer/sp)%cdist)-5,-38,6)
	
	foreach(bubbles,drawpart)--disintegrating sea
	if timer%thunder==0 then pal(0,7,-1) sfx(13,-1) thunder=200+flr(rnd(1000))--thunder
	else pal()
	end
end
end

function drawtext(t,x,y,c,mi,ma,w)
	if timer%255==0 then c+=1 if c>ma then c=mi end end
	for a=1,#t[c] do
		print(sub(t[c],a,a),x+a*4,y  +(sin((timer+a)/20)*3)*w,8)
		print(sub(t[c],a,a),x+a*4,y-1+(cos((timer+a)/20)*3)*w,7)
	end
	return c
end

function drawbutton(b)
	if b.vis==true then
			pset(b.x,b.y+b.z-1,b.c1)
			if b.pressed==false then
				pset(b.x,b.y+b.z,b.c2)
			end
	end
end

function drawpart(p)
	pset(p.x,p.y,p.c)
end

function drawitem(i)
 pset(i.x,i.y-mget(i.x,i.y),5)
 line(i.x,i.y+i.z,i.x,i.y-1+i.z,i.c1)
 pset(i.x,i.y-2+i.z,i.c2)
 if debug==true then
	print(i.n+1,i.x,i.y,4)
	print(i.v,i.x+8,i.y,3)
	print(i.r,i.x,i.y+6,3)
	end
end

function drawfinish(e)
	local i=-mget(97,59)
	for a=0,4 do line(93+a*2,i+52-(a%2)*2,93+a*2,i-47,12) end
	--if timer%5==0 then pal(12,13,1) else pal() end
end

function drawboss(b)
	pal(4,4+flr(rnd(3)),1)
	local t={}
	t[1]="you've come this way "..dget(route-1).." times"
	t[2]="find a new route tiny mortal"
	if dget(route-1)>1 then
		b.text_c=drawtext(t,(128-#t[1]/2)-timer%255,b.z+30,b.text_c,1,2,1)
	else
		t[1]="you completed route "..route
		t[2]=b.dial[route]
		b.text_c=drawtext(t,(128-#t[1]/2)-timer%255,b.z+30,b.text_c,1,2,1)
--		for a=1,#t do
--		print(sub(t,a,a),(128-#t/2)-timer%256+a*4,b.z+30+(sin((timer+a)/20)*3),8)
--		print(sub(t,a,a),(128-#t/2)-timer%256+a*4,b.z+31+(cos((timer+a)/20)*3),7)
--		end
	end
	circfill(b.x,b.z,b.r,12)
	circ(b.x,b.z,b.r,3)
	rectfill(b.x-b.r,b.z-b.r/2,b.x+b.r,b.z,1)
	rectfill(b.x+0.3*b.r,b.z-0.5*b.r,b.x+0.5*b.r,b.z+b.eh*b.r,4)
	rectfill(b.x-0.3*b.r,b.z-0.5*b.r,b.x-0.5*b.r,b.z+b.eh*b.r,4)
	rectfill(b.x-0.2*b.r,b.z+0.4*b.r,b.x+0.2*b.r,b.z+0.6*b.r+(cos(timer*1/40)),0)
	if player[1]!=nil then
	if timer-b.t>b.ti then
		line(b.x-0.3*b.r,b.z,player[1].x,player[1].y+player[1].z,4)
		line(b.x+0.3*b.r,b.z,player[1].x,player[1].y+player[1].z,4)
	end
	end
--	if timescore>0 then
--		print("time: "..timescore,b.x,b.z,8)
--	end
end

function drawmenu(m)
	for a=1,#m.opt do
		local w=0 if m.sel+1==a then w=1 end
		drawtext(m.opt,63-#m.opt[a]*2,-50+a*9,a,a,a,w)
	end
end

function _init()
	cartdata("ap_tinyp")
--	for a=0,10 do dset(a,0) end
	rooms={}
	room=1
	makeroom(127,31,6,12,1,0x2000,0x0000,4096,60,20)--intro
	makeroom(127,63,6, 1,0,0x1000,0x1000,0x2000,17,1)--main
	local r=rooms[room]
--	for b=0,127 do for a=0,63 do mset(a,b,0) end end
	reload(r.dest,r.src,r.len)
	timer=0
	rtimer=0
	start=0
	
	score=0
	route=0
	rc={}
	timescore=0
	deaths=0
	ps=0.5
	
	cam=-rooms[room].h
	camera(0,cam)

	player={}
	parts={}
	bubbles={}
	item_list={}
	items={}
	buttons={}
	buttons_s={}
	buttons_p={}
	buttons_c={}
	buttons_l={}
	teles={}
	exits={}
	finish={}
	ending={}
	boss={}
	menus={}

	makeplayer(rooms[room].px,rooms[room].py,10,1,14-flr(rnd(2))*10,3+flr(rnd(2))*9,ps) --0.5
--	makeplayer(16,1,10,1,12,2,ps)
	
--	makeplayer(97,60,16,1,14,3,ps) --0.5
	--makeplayer(16,1,10,1,12,2,ps)
--	score=5
--	route=8
--	doprogress()
	
	items_i(room)
	buttons_i(room)	
	sky_i(room)
end

function _draw()
	local r=rooms[room]
	local p=player[1]
	local p2=player[2]
	cls()
	if r.flc!=0 then rectfill(0,0,r.w,r.h,r.flc) end
--	if timer%3==0 then pal(12,12+rnd(2)-1,1) end
	drawsky(room)	
	for y=0,r.h do	--loop through every map cell
		for x=0,r.w do
		 local h=mget(x,y)
			if h>0 then--draw each map cell
				pset(x,y-h,r.c1+h%2)--floors
				line(x,y-h+1,x,y,(r.c2+(y%2)))--walls
			end
		end
		if p!=nil then
		if flr(p.y)==y then
			drawactor(p)
		end
		end
		if p2!=nil then
		if flr(p2.y)==y then
			drawactor(p2)
		end
		end
	end


	foreach(buttons,drawbutton)
	foreach(buttons_l,drawbutton)
	foreach(items,drawitem)
	foreach(finish,drawfinish)
	foreach(boss,drawboss)
	foreach(parts,drawpart)
	foreach(menus,drawmenu)
	
	if room==3 then
		local m=flr((timescore/30)/60)
		local s=(timescore/30)-m*60
		local z="" if s<10 then z="0" end
		print("time: "..m..":"..z..s,20,31,7)
		print("deaths: "..deaths,20,41,7)
		print("press button to continue",20,61,8)
		if btnp(4) then
			score=0 route=0 timer=0 start=0 deaths=0
	 	for k,v in pairs(bubbles) do bubbles[k]=nil end
	 	room=1
			rooms[room].gen=true	 	
	 	makeplayer(rooms[room].px,rooms[room].py,10,1,14-flr(rnd(2))*10,3+flr(rnd(2))*9,ps) --0.5			
	 	changeroom(room)
	 end
	end
	--debug
	if debug==true then
		for a=0,10 do print(dget(a),r.w/2-55+a*8,cam+r.h-50+doff,11) end
		print(timer,r.w-20,cam+r.h-50+doff,11)
		print(stat(0),10,cam+r.h-40+doff,11)
		print(stat(1),r.w-27,cam+r.h-40+doff,11)
		print("room: "..room,r.w-27,cam+r.h-20+doff,11)
		if p!=nil then
		print(p.x,10,cam+r.h-30+doff,11)
		print(p.y,25,cam+r.h-30+doff,11)
		print(p.z,35,cam+r.h-30+doff,11)
		print("f "..p.fall,80,cam+r.h-30+doff,11)
		end
		print("sc "..score,r.w/2-10,cam+r.h-40+doff,11)
		print("rt "..route,r.w/2-10,cam+r.h-30+doff,11)
		print("rtimer "..rtimer,10,cam+r.h-20+doff,11)
		print("deaths "..deaths,53,cam+r.h-20+doff,11)
		print("timescore "..timescore,53,cam+r.h-10+doff,11)		
		print("d "..dget(63),100,cam+r.h-30+doff,11)
--		print(#items,10,-10,11)
--		print(#item_list,20,-10,11)=
--		print(#ending,20,-10,11)
--		print(#bubbles,20,0,11)
	end
--	print(stat(1),mw-30,-30,11)
end

function _update()
	local r=rooms[room]
	local p=player[1]
	if room==1 then
		if start==0 then
			if flr(p.x)==70 and flr(p.y)==20 and flr(p.z)==0 then
				--if start==0 then rtimer=timer end
				reload(r.dest,r.src,r.len)
				start=1
				tut_c=4				
				add(items,makeitem(17,1,-20,0,8,9,4,0,0,0,0,0))
				maketele(56,2,0,3,61,5)
				maketele(98,1,0,4,104,5)
			end
		end
		if start==1 then--fireworks
			if timer<500 then
			if parts[1]==nil then
			if timer%flr(rnd(120))==0 then
				local x=flr(rnd(127)) local y=flr(rnd(30)-40)
				for a=1,30 do
					sfx(20,0,-1)
					makepart(x,y,4,4,flr(rnd(15)))
				end
			end
			end
			end
		end
		if rtimer!=0 then
			if timer-rtimer==60 then
				room=room+1
				del(rooms,rooms[2])
				makeroom(127,63,6, 1,0,0x1000,0x1000,0x2000,17,1)--main
				--rooms[room].gen=true
				changeroom(room)
				--rooms[room].gen=true
			end
		end
	end
	
	if room==2 then
		if timer==60 then
			sfx(12,-1)
			makeplayer(r.px,r.py,10,1,14-flr(rnd(2))*10,3+flr(rnd(2))*9,ps) --0.5
			for a=1,40 do makepart(r.px,r.py-4,1,1,flr(rnd(6))) end	
		end
		if rtimer>0 then
		if timer-rtimer==30 then
			makemenu()
			rtimer=0
		end
		end
	end
	
	foreach(player,doplayer)
--	for p in all(player) do doplayer(p,rooms[room]) end
	foreach(ending,doending)
	foreach(items,doitem)
	foreach(parts,dopart)
	foreach(buttons,dobutton)
	foreach(buttons_s,dobutton_s)
	foreach(buttons_p,dobutton_p)
	foreach(buttons_c,dobutton_c)
	foreach(buttons_l,dobutton_l)
	foreach(bubbles,dobubble)
	foreach(teles,dotele)
	foreach(exits,doexit)
	foreach(boss,doboss)
	foreach(menus,domenu)
	if p!=nil then
--	if p.z>=-120 then cam=-r.h camera(p.x-64,cam+p.y+p.z) end
	if p.z>=-120 then cam=-r.h camera(0,cam) end
	if p.z<-120 then cam=-r.h*2 camera(0,cam) end
	if p.z<-190 then cam=-r.h*3.5 camera(0,cam) end
	if room==1 then cam=-r.h*2 camera(0,cam) end
	end
	
	timer+=1
end
__gfx__
c0c0e0e00101e0e0c0c0e0e001012121414121210101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0
c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0
c0c0e0e00101e0e0c0c0e0e001012121414121210101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0
c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0c0c0e0e00101e0e0
800000000000000000000000009090a0b0c0d0e0e0e0e04040000000004040404040000000000000000000000000004040404040404040400000004040404040
00000000008080000060600000404000000000808060604040000000004040404040000000000040404040400000000030303030300000000030303030300080
80000000000000000000000000909090807060504040404040000000004040404040000000000000000000000000004040404040000000400000004040404040
00000000008080000060600000404000000000808060604040000000004040404040000000000040404040400000000030303030300000000030303030300080
80000000000000000000000000000000000000000000000000000000003030303030000000000000000000000000004040404040000000400000004040404040
00000000008080000060600000404000000000808060604040000000004040404040405060504040404040400000000030303030300000000030303030300080
80000000000000000000000000000000000000000000000000000000003030303030000000004040404040000000004040404040000000400000004040404040
00000000008080000060600000404000000000808060604040000000004040404040405060504040404040400000000030303030300000000030303030300080
80000000000000000000000000000000000000000000000000000000003030303030000000004040404040000000004040404040000000404040404040404040
00000000008080000060600000404000000000808060604040000000004040404040000000000040404040400000000030303030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000101010101010100000001010101010101000001000000000000010001000000000001000000000000000101010101010000000101010
10101010000000101010101010000010000000001000000010101010100000001000000000001000001010101010100000000000100000000000000000000080
80000000000000000000000000100000000000000000001000000000001010000000000010000010000000100000000000000000100000000000100000100000
00000010000000100000000000100010000000100000001000000000001000001000000000001000001000000000001000000000100000000000000000000080
80000000000000000000000000100000000000000000001000000000001000100000000010000000100010000000000000000000100000000000100000100000
00000010000000100000000000100010000010000000001000000000001000001000000000001000001000000000001000000000100000000000000000000080
80000000000000000000000000100000000000000000001000000000001000001000000010000000001000000000000000000000100000000000100000100000
00000010000000100000000000100010001000000000001000000000001000001000000000001000001000000000001000000000100000000030303030300080
80000000000000000000000000100000000000000000001000000000001000000010000010000000001000000000000000000000101010101010000000101010
10101010000000101010101010000010100000000000001000000000001000001000000000001000001010101010100000000000100000000030303030300080
80000000000000000000000000100000000000000000001000000000001000000000100010000000001000000000000000000000100000000000000000100000
00000010000000100000000000100010001000000000001000000000001000001000000000001000001000000000001000000000000000000030303030300080
80000000000000000000000000100000000000000000001000000000001000000000001010000000001000000000000000000000100000000000000000100000
00000010000000100000000000100010000010000000001000000000001000001000000000001000001000000000001000000000000000000030303030300080
80000000000000000000000000100000000000000000001000000000001000000000000010000000001000000000000000000000100000000000000000100000
00000010000000100000000000100010000000100000001000000000001000001000000000001000001000000000001000000000000000000030303030300080
80000000000000000000000000100000000000001010101010101000001000000000000010000000001000000000000000000000100000000000000000100000
00000010000000100000000000100010000000001000000010101010100000000010101010100000001000000000001000000000100000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010202030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010202030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010202030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010202030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010202030300000000030303030300080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080
80303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030
30303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303080
80000030303030303030303030303030303030000000000000000000000000005000000000000000000000000000000000700000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000030000000000000000000000000005000000000000000000000000000000000700000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000030000000000000000000000000005000000000000000000000000000000000700000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000030000000000000000000000000005000000000000070709090b0b000d0b0007000b0d0000000d0d0d0d0d0000000
00000000000000303030303000003000003000003000300000003000003000000030000030000000000000000000000000000000000000003050007040407000
80000000000000000000000000000000000030000000000000000000000000005050500000000070709090b0b0808080808080808080808080b0b0b080808000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000030000000000000000000000000000000000000000070709090b0b000000080808000000000000080808000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000030303030303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070404070
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407000
80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000011c03100000031c0110000000000000000000000000000000000000000007040407000
800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f0000000000000000000000000
0000000000000000000000000000000000000000000000000000000000c0c0f0000000f0c0c00000000000000000000000000000000000000000007040407000
800000000000000000000000000000000000000000000000000000000000000000000000000070707060504030000000000000f0000000000000000000000000
0000000000000000000000000000000000000000000000000000000000c0c0f0213121f0c0c00000000000000000000000000000000000000000007040407000
800000000000000000000000000000000000000000000000000000000000000000000000000070c0c0b0a0903000000000002121210000000000000000005151
5100000000000000000000000000000000000000000000000000000000c0c0f0210121f0c0c00000000000000000000000000000000000000000007040407000
800000000000000000000000000000000000000000000000000000000000000000000000000070c0f0f0d09030000000f0f0210121f0f00000000000f0f05131
5111113131000000000000000000000000000000000000000000000000c0c0f0210121f0c0c00000000000000000000000000000000000000000007040407000
800000000000000000000000000000000000000000000000000000000000000000000000000070c0c0d0d0903000000000002121210000000000000000005151
5100000000000000000000000000000000000000000000000000000000c0c0f0e0e0e0f0c0c00000000000000000000020202020303030304040404040400000
800000000000000000000000000000000000000000000000000000000000003131000000000070708080909030000000000000f0000000000000000000000001
0000000000000000000000000000000000000000000000000000000000c0c0c0c0c0c0c0c0c00000000000000000000000000000000000000000000000000000
800000000000000000000000000000000000000000000000000000000000003131000000000010102020303030000000000000f0000000000000000000000001
0000000000000000000000000000000000000000000000000000000000c0b0c0b0c0b0c0b0c00000000000000000000000000000000000000000000000000000
__gff__
0000010200000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0808080808080808080808080000000000080808080808080404000000000616161616161919191919191919161616161616130000000000000000000c0000000000000c0000000000000c080808080808080c0c0c160c160c160c160c160c160c160c160c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c
080000000000000000000503030000000303050000000000000000000000060008000a000c0404040404040c0d0e0f10111213000000000000000000000000000000000000000000000000080808000000000c0c0808080c0808080c0808080c0808080c0808080c0c000008080808080808080808080808080800000000000c
0800000000000000000005030300000003030500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008070605000000000404040404040404040404040404040404040405
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000005030300000003030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000005030300000003030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000010101010101010100010101020304050506070707070708090909090909000000090909090909090909000000000000000000000505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000000000000000000000000000000000000000010000080600060600060800000000000000000000000000000000000000000000000000000000000000000000000000000000000505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000003030300000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
080000000303030000010203040000000000000000010101010100000000000000000006060808080a0a0a0a0a0a0c0c0c0c0c0c0c0000000c0c0c0c0c0c0c0c0c000000000000050709050505050509050505050509070500000009000000000009000000000009000000090000000900000000000900000000000704040700
0800000000000000000000000000000000000000000101010101000000000000000000000002000004000006000007070707070707070707070808080808080000000000000000000101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
08000000000000000000000000000000000000000001010101010000010000010000010000010000000000000000000c0c070c0c0000000000000b000b000b0000000000000000000000010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
08000000000000000000000000000000000000000000010101000000000000000000000000000000000000000000000c0c070c0c0000000000000b000b000b0000000000000000000000000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0c070c0c0000000000000b000b000b0000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0c070c0c0000000000000b000b000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0c070c0c0000000000000b000b000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
0800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000005000000000005000000000005000000000005000000050000000500000000000000000000000704040700
0800000000030303030303030300000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000704040700
0800000000030000000000000300000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000000030000000000000300000000000000000001010100000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000303030000000000000303030303000000000001010100000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000300000000000000000000000000000000000001010100000102030405050000000000000000000000000000000007000000000000000000000000000000000000000000000000000001010101010101010101010100000000000001000000000002000000000200000002000000000200000300000000000007040407
0800000300000000000000000000000000000000000000000000000000000000050000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000300000000000000000000000000000000000000000000000000000000050000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000300000000000000000000000000000000000000000000000000000000050000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000300000000000000000000000000000000000000000000000000000000050000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
0800000300000000000000000000000000000000000000000000000000000000050000000000000000000000000000000007000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007040407
__sfx__
000100000a10009170091700b1700d1700f17011170121701417015170161701717018170191701a1701d1701f1702217025170261702617026170211001e1001910015100111000e1000c1000a1000910007100
00010000091700a1700a1700a1700b1700b1700c1700c1700e1700f1701217015170171701a1701e17021170251702617027170281702a1702b1700d600106000c6000b600066000a60009600076000540000000
000200002c1702c1702b1702a1702a1702a17029170281702717026170231702417022170201701d1701a1701717013170101700c1700a1700617003170011000310002100011000000000000000000000000000
000300000d1700f1701117014170171701b1702017021170161001b10020100211000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400002477025770287702777036770367703677000000367703670036770367003677000000000002970038300373003730028700000000000000000000000000000000000000000000000000000000000000
000400000a6400c6400d6400a6400a640096400764003640036400364016600016000f60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001365011650286500c650296500a6500965028650076000000014650196501f650266503e650206503d650106503f65000000000000000000000000000000000000000000000000000000000000000000
00030000013700137001370013700337003370053700537006370063700737007370083700737008370093700a3700b3700c3700c3700d3700e370103701137012370133701437016370183701a3701b3701e370
0003000005370053700537005370053700537006370073700837008370093700a3700b3700b3700c3700d3700f37010370113701237012370143701737018370193701b3701c3701d3701f370213702337027370
000300000837008370093700a3700b3700c3700d3700e3700f3701037011370123701437014370153701737019370193701a3701b3701c3701d3701d3701f3702037022370233702437025370273702a3702f370
00030000103701037011370113701137011370113701237012370123701337013370133701437014370153701537016370163701737018370193701b3701c3701d370213702337025370293702e3703337037370
000800002447000000000002647000000000002147000000000002b47000000000002d47000000024002747000000000000000000000000000000000000000000000000000000000000000000000000000000000
00020000304702e47028370304701c3702f4702b47019370214702f4701477026470204701c47014370183702a57019470295701a4702857015770214701a3702547028470244701a3701f470262703027034270
000400003a67039670016500165002650066400363001630026200260006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00160000116601565014640126300d6300a62007620066200562005620046300563007650096700e6601263014620116300f6400e6400d6400d6400c6400b6400a63009620096200762005620036200462004620
0010000023600236001c6101c6201b6201b6301a6401a6401a6501866013640106300e6200d6200d6200c6300a6200a6200a6300a6300a6500a6600b6600c6500d6400d6400d6400c64009630056300363002630
0010000002640036400d6501665017640156401464013640136401364013630156201662016620166301663015630126301363017630186301762016630146401364013630136301463017630146300d62001610
0004000006630017300660001600006000363001730036000160008600056000f600096000a600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000700200423004240042400425004230042200423004240042200423004250042200422004240042500423004230042400424004240042600423004240042600425004240042200424004230042300423004230
000600003f0703d0703d0703c0703b0703a0703a0703907039070380703807037070370703607035070340703407033070320703107030070300702f0702e0702d0702c0702a0702707007470074700747007470
00040000106700f6600f6500d6500c6500a6500964008640076400664005640046400364001640016400164001640016400163001630016200162001610016100160001600016000160001600016000160001600
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002473024730247302473024730247302473024730247302473024730247302473024730247302473024730247302473024730247302473024730247302473024730247302473024730247302473024730
000100001574015740157401574015740157401574015740157401574015740157401574015740157401574015740157401574015740157401574015740157401574015740157401574015740157401574015740
__music__
00 0f4e4344
00 0e424344
00 10424344
00 0e424344
00 3f024344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

