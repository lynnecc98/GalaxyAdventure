	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L10+4
	ldrh	r4, [r3]
	ands	r4, r4, #8
	sub	sp, sp, #12
	beq	.L9
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	mov	ip, #3
	mov	r9, #1
	ldr	lr, .L10+8
	ldr	r1, .L10+12
	ldr	r2, .L10+16
	mov	r0, r4
	ldr	r3, .L10+20
	str	r9, [lr]
	str	ip, [r1]
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r2, .L10+24
	ldr	r5, .L10+28
	ldr	r3, .L10+32
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r5
	mov	r8, #10
	mvn	fp, #0
	mov	r10, #15
	ldr	r7, .L10+36
	smull	r3, r1, r7, r0
	ldr	r2, [sp, #4]
	ldr	r6, .L10+40
	smull	r3, ip, r6, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r1, .L10+44
	sub	r0, r0, r3, asl #2
	mov	r3, r2, asr #31
	rsb	ip, r3, ip, asr #6
	ldr	lr, [r1, #4]
	ldr	r3, [r1]
	add	ip, ip, ip, lsl #2
	sub	ip, r2, ip, asl #5
	rsb	r0, r0, #220
	stmib	r1, {r0, r3, lr}
	str	r4, [r1, #16]
	str	ip, [r1]
	str	fp, [r1, #20]
	str	r10, [r1, #24]
	str	r8, [r1, #28]
	mov	lr, pc
	bx	r5
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r5
	smull	r3, r1, r7, r0
	ldr	r2, [sp, #4]
	smull	r3, ip, r6, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r1, .L10+48
	sub	r0, r0, r3, asl #2
	mov	r3, r2, asr #31
	rsb	ip, r3, ip, asr #6
	ldr	lr, [r1, #4]
	ldr	r3, [r1]
	add	ip, ip, ip, lsl #2
	sub	ip, r2, ip, asl #5
	rsb	r0, r0, #220
	stmib	r1, {r0, r3, lr}
	str	r4, [r1, #16]
	str	fp, [r1, #20]
	str	r10, [r1, #24]
	str	r8, [r1, #28]
	str	ip, [r1]
	mov	lr, pc
	bx	r5
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r5
	mov	lr, #60
	mov	ip, #20
	mov	r1, #17
	smull	r2, r3, r7, r0
	ldr	r2, [sp, #4]
	smull	r5, r6, r2, r6
	mov	r5, r0, asr #31
	rsb	r3, r5, r3, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, asl #2
	mov	r3, r2, asr #31
	ldr	r5, .L10+52
	ldr	r7, .L10+56
	rsb	r6, r3, r6, asr #6
	add	r6, r6, r6, lsl #2
	sub	r2, r2, r6, asl #5
	ldr	r3, [r7, #4]
	ldr	r6, [r5, #4]
	str	fp, [r5, #20]
	str	r4, [r5, #16]
	ldr	fp, [r5]
	ldr	r4, [r7]
	rsb	r0, r0, #220
	str	r10, [r5, #24]
	str	r8, [r5, #28]
	str	r0, [r5, #4]
	str	r6, [r5, #12]
	str	r2, [r5]
	str	fp, [r5, #8]
	str	r8, [r7, #28]
	str	r9, [r7, #16]
	str	r9, [r7, #20]
	str	r4, [r7, #8]
	str	lr, [r7]
	str	r3, [r7, #12]
	str	ip, [r7, #4]
	str	r1, [r7, #24]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	lives
	.word	bgColor
	.word	fillScreen
	.word	.LANCHOR0
	.word	rand
	.word	srand
	.word	1374389535
	.word	1717986919
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	player
	.size	start, .-start
	.align	2
	.global	initializeObjects
	.type	initializeObjects, %function
initializeObjects:
	@ Function supports interworking.
	@ args = 20, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	r4, sp, #16
	ldmia	r4, {r4, lr}
	ldr	r5, [sp, #12]
	ldr	ip, [sp, #24]
	str	r1, [r0]
	ldr	r1, [sp, #28]
	stmib	r0, {r2, r3, r5}
	str	r4, [r0, #16]
	str	lr, [r0, #20]
	str	ip, [r0, #24]
	str	r1, [r0, #28]
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
	.size	initializeObjects, .-initializeObjects
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L26
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L15
	ldr	r2, .L26+4
	ldrh	r0, [r2]
	ands	r2, r0, #8
	beq	.L24
.L15:
	tst	r3, #4
	beq	.L14
	ldr	r3, .L26+4
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L25
.L14:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L25:
	ldr	r1, .L26+8
	ldr	r0, .L26+12
	ldr	r2, .L26+16
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldmfd	sp!, {r4, lr}
	bx	lr
.L24:
	mov	lr, #1
	ldr	ip, .L26+8
	ldr	r1, .L26+20
	ldr	r3, .L26+16
	mov	r0, r2
	str	lr, [ip]
	strh	r2, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L15
.L27:
	.align	2
.L26:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	32767
	.word	fillScreen
	.word	bgColor
	.size	pause, .-pause
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #31
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L35
	mov	r0, r3
	ldr	r4, .L35+4
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r3, .L35+12
	ldrh	r0, [r3]
	ands	r3, r0, #8
	beq	.L34
.L28:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L34:
	ldr	r2, .L35+16
	mov	r0, r3
	strh	r3, [r5]	@ movhi
	str	r3, [r2]
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	bgColor
	.word	fillScreen
	.word	oldButtons
	.word	buttons
	.word	state
	.size	lose, .-lose
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r3, #0
	ldr	r0, .L38
	ldr	r1, .L38+4
	strh	r0, [r2]	@ movhi
	add	r2, r2, #256
	str	r3, [r1]
	ldr	r0, .L38+8
	ldrh	r1, [r2, #48]
	ldr	r2, .L38+12
	strh	r3, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	1027
	.word	state
	.word	oldButtons
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L68
	ldrh	r3, [r3, #48]
	tst	r3, #64
	sub	sp, sp, #12
	ldr	r7, .L68+4
	bne	.L41
	ldr	r3, [r7]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r7]
.L41:
	ldr	r3, .L68
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L42
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	add	r3, r2, r3, lsl #1
	cmp	r3, #159
	ldr	r3, .L68+4
	addle	r2, r2, #1
	strle	r2, [r3]
.L42:
	ldr	r3, .L68
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L43
	ldr	r3, [r7, #4]
	ldr	r2, .L68+4
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
.L43:
	ldr	r3, .L68
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L44
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #24]
	add	r3, r2, r3, lsl #1
	cmp	r3, #239
	ldr	r3, .L68+4
	addle	r2, r2, #1
	strle	r2, [r3, #4]
.L44:
	ldr	r4, .L68+8
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #4]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	rsb	r1, r2, r3
	cmp	r1, #0
	ble	.L46
	add	r3, r3, r2
	cmp	r3, #239
	bgt	.L46
.L47:
	ldr	r6, .L68+12
	ldr	r2, [r6, #28]
	ldr	r3, [r6, #4]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	rsb	r1, r2, r3
	cmp	r1, #0
	ble	.L49
	add	r3, r3, r2
	cmp	r3, #239
	bgt	.L49
.L50:
	ldr	r5, .L68+16
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #4]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	rsb	r1, r2, r3
	cmp	r1, #0
	ble	.L52
	add	r3, r3, r2
	cmp	r3, #239
	bgt	.L52
.L53:
	ldr	lr, [r4, #24]
	ldr	ip, [r4, #4]
	ldr	r2, [r7, #24]
	ldmia	r7, {r0, r1}
	ldr	r3, [r4]
	stmia	sp, {ip, lr}
	ldr	r8, .L68+20
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r9, .L68+8
	bne	.L66
.L55:
	ldr	lr, [r6, #24]
	ldr	ip, [r6, #4]
	ldr	r2, [r7, #24]
	ldmia	r7, {r0, r1}
	ldr	r3, [r6]
	stmia	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r9, .L68+12
	bne	.L67
.L58:
	ldr	lr, [r5, #24]
	ldr	ip, [r5, #4]
	ldr	r2, [r7, #24]
	ldmia	r7, {r0, r1}
	ldr	r3, [r5]
	stmia	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r7, .L68+16
	beq	.L61
	ldr	r2, [r7, #28]
	ldr	r10, .L68+24
	add	r2, r2, r2, lsr #31
	add	r0, r7, #8
	ldmia	r0, {r0, r1}
	mov	r2, r2, asr #1
	ldrh	r3, [r10]
	ldr	r9, .L68+28
	mov	lr, pc
	bx	r9
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	ip, #220
	ldr	r3, .L68+36
	smull	r1, r2, r3, r0
	ldr	r8, .L68+40
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	ldr	r1, [r8]
	ldr	r2, [r4, #28]
	add	lr, r3, r3, lsl #2
	sub	r0, r0, lr, asl #5
	add	r1, r1, r1, lsl #2
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldrh	r3, [r10]
	str	r0, [r7]
	mov	r1, r1, asl #2
	mov	r0, #20
	str	ip, [r7, #4]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
	sub	r3, r3, #1
	cmp	r3, #0
	moveq	r2, #3
	str	r3, [r8]
	ldreq	r3, .L68+44
	streq	r2, [r3]
.L61:
	ldr	lr, [r4]
	ldr	r2, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r0, [r6]
	add	lr, lr, r2
	add	ip, ip, r3
	ldr	r2, [r6, #16]
	ldr	r3, [r6, #4]
	ldr	r1, [r6, #20]
	add	r0, r0, r2
	add	r1, r3, r1
	ldr	r2, [r5, #16]
	ldr	r3, [r5]
	str	lr, [r4]
	add	r2, r3, r2
	ldr	lr, [r5, #20]
	ldr	r3, [r5, #4]
	add	r3, r3, lr
	str	ip, [r4, #4]
	stmia	r6, {r0, r1}
	stmia	r5, {r2, r3}
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L52:
	ldr	r3, .L68+24
	add	r0, r5, #8
	ldmia	r0, {r0, r1}
	ldrh	r3, [r3]
	ldr	r8, .L68+28
	mov	lr, pc
	bx	r8
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	r1, #220
	ldr	r3, .L68+36
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #5
	str	r3, [r5]
	str	r1, [r5, #4]
	b	.L53
.L49:
	ldr	r3, .L68+24
	add	r0, r6, #8
	ldmia	r0, {r0, r1}
	ldrh	r3, [r3]
	ldr	r5, .L68+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	r1, #220
	ldr	r3, .L68+36
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #5
	str	r3, [r6]
	str	r1, [r6, #4]
	b	.L50
.L46:
	ldr	r3, .L68+24
	add	r0, r4, #8
	ldmia	r0, {r0, r1}
	ldrh	r3, [r3]
	ldr	r5, .L68+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	r1, #220
	ldr	r3, .L68+36
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #5
	str	r3, [r4]
	str	r1, [r4, #4]
	b	.L47
.L67:
	ldr	r2, [r9, #28]
	ldr	fp, .L68+24
	add	r2, r2, r2, lsr #31
	add	r0, r9, #8
	ldmia	r0, {r0, r1}
	mov	r2, r2, asr #1
	ldr	ip, .L68+28
	ldrh	r3, [fp]
	mov	lr, pc
	bx	ip
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	ip, #220
	ldr	r3, .L68+36
	smull	r1, r2, r3, r0
	ldr	r10, .L68+40
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	ldr	r1, [r10]
	ldr	r2, [r4, #28]
	add	lr, r3, r3, lsl #2
	sub	r0, r0, lr, asl #5
	add	r1, r1, r1, lsl #2
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldrh	r3, [fp]
	str	r0, [r9]
	str	ip, [r9, #4]
	mov	r1, r1, asl #2
	mov	r0, #20
	ldr	ip, .L68+28
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	sub	r3, r3, #1
	cmp	r3, #0
	moveq	r2, #3
	str	r3, [r10]
	ldreq	r3, .L68+44
	streq	r2, [r3]
	b	.L58
.L66:
	ldr	r2, [r9, #28]
	ldr	fp, .L68+24
	add	r2, r2, r2, lsr #31
	add	r0, r9, #8
	ldmia	r0, {r0, r1}
	mov	r2, r2, asr #1
	ldr	ip, .L68+28
	ldrh	r3, [fp]
	mov	lr, pc
	bx	ip
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	mov	ip, #220
	ldr	r3, .L68+36
	smull	r1, r2, r3, r0
	ldr	r10, .L68+40
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	ldr	r1, [r10]
	ldr	r2, [r9, #28]
	add	lr, r3, r3, lsl #2
	sub	r0, r0, lr, asl #5
	add	r1, r1, r1, lsl #2
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldrh	r3, [fp]
	str	r0, [r9]
	str	ip, [r9, #4]
	mov	r1, r1, asl #2
	mov	r0, #20
	ldr	ip, .L68+28
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	sub	r3, r3, #1
	cmp	r3, #0
	moveq	r2, #3
	str	r3, [r10]
	ldreq	r3, .L68+44
	streq	r2, [r3]
	b	.L55
.L69:
	.align	2
.L68:
	.word	67109120
	.word	player
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	collision
	.word	bgColor
	.word	drawCircle
	.word	rand
	.word	1717986919
	.word	lives
	.word	state
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L77
	ldr	r2, [r6, #28]
	ldr	r5, .L77+4
	ldr	r9, .L77+8
	add	r2, r2, r2, lsr #31
	add	r0, r6, #8
	ldr	r7, .L77+12
	ldmia	r0, {r0, r1}
	ldrh	r3, [r5]
	mov	r2, r2, asr #1
	mov	lr, pc
	bx	r7
	ldr	r2, [r9, #28]
	ldr	r10, .L77+16
	add	r2, r2, r2, lsr #31
	add	r0, r9, #8
	ldrh	r3, [r5]
	ldmia	r0, {r0, r1}
	mov	r2, r2, asr #1
	mov	lr, pc
	bx	r7
	ldr	r2, [r10, #28]
	ldr	fp, .L77+20
	add	r2, r2, r2, lsr #31
	add	r0, r10, #8
	ldrh	r3, [r5]
	ldmia	r0, {r0, r1}
	mov	r2, r2, asr #1
	mov	lr, pc
	bx	r7
	add	r0, fp, #8
	ldr	r4, .L77+24
	ldrh	r3, [r5]
	ldr	r2, [fp, #24]
	ldmia	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	ldr	r2, [r6, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldmia	r6, {r0, r1}
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r7
	ldr	r2, [r9, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldmia	r9, {r0, r1}
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r7
	ldr	r2, [r10, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldmia	r10, {r0, r1}
	ldr	r3, .L77+28
	ldr	r8, .L77+32
	mov	lr, pc
	bx	r7
	mov	r3, #31744
	ldr	r2, [fp, #24]
	ldmia	fp, {r0, r1}
	mov	lr, pc
	bx	r4
	ldr	r3, [r8]
	cmp	r3, #0
	movgt	r5, #20
	movgt	r4, #0
	ble	.L73
.L72:
	ldr	r2, [r6, #28]
	add	r2, r2, r2, lsr #31
	mov	r3, #31
	mov	r1, r5
	mov	r2, r2, asr #1
	mov	r0, #20
	mov	lr, pc
	bx	r7
	ldr	r3, [r8]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #20
	bgt	.L72
.L73:
	ldmia	r6, {r1, r2}
	ldmia	r9, {r3, ip}
	str	r1, [r6, #8]
	ldr	r0, [r10]
	str	r2, [r6, #12]
	ldr	r1, [r10, #4]
	ldr	r2, [fp]
	str	r3, [r9, #8]
	ldr	r3, [fp, #4]
	str	ip, [r9, #12]
	str	r0, [r10, #8]
	str	r1, [r10, #12]
	str	r2, [fp, #8]
	str	r3, [fp, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	enemy1
	.word	bgColor
	.word	enemy2
	.word	drawCircle
	.word	enemy3
	.word	player
	.word	drawTriangle
	.word	32767
	.word	lives
	.size	draw, .-draw
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	update
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
	ldr	r3, .L85+8
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #2
	ldreq	r3, .L85+12
	streq	r2, [r3]
.L79:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #0
	ldr	r2, .L98
	stmfd	sp!, {r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r4, .L98+4
	ldr	r6, .L98+8
	ldrh	r3, [r4, #48]
	ldr	fp, .L98+12
	str	r0, [r6]
	strh	r3, [fp]	@ movhi
	ldr	r7, .L98+16
	ldr	r5, .L98+20
	ldr	r10, .L98+24
	ldr	r9, .L98+28
	ldr	r8, .L98+32
.L88:
	ldr	r2, [r7]
.L89:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	add	r2, r2, #1
	strh	r3, [fp]	@ movhi
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L89
.L91:
	.word	.L90
	.word	.L92
	.word	.L93
	.word	.L94
.L94:
	ldr	r3, .L98+36
	str	r2, [r7]
	mov	lr, pc
	bx	r3
.L95:
	ldr	r0, [r6]
	ldrh	r3, [fp]
	b	.L88
.L93:
	str	r2, [r7]
	mov	lr, pc
	bx	r8
	b	.L95
.L92:
	str	r2, [r7]
	mov	lr, pc
	bx	r9
	b	.L95
.L90:
	str	r2, [r7]
	mov	lr, pc
	bx	r10
	b	.L95
.L99:
	.align	2
.L98:
	.word	1027
	.word	67109120
	.word	state
	.word	buttons
	.word	.LANCHOR0
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.size	main, .-main
	.comm	lives,4,4
	.global	t
	.comm	state,4,4
	.comm	enemy3,32,4
	.comm	enemy2,32,4
	.comm	enemy1,32,4
	.comm	player,32,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	t, %object
	.size	t, 4
t:
	.word	270
	.ident	"GCC: (devkitARM release 45) 5.3.0"
