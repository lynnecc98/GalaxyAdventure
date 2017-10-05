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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r2, #0
	ldrh	ip, [sp, #12]
	ble	.L4
	mov	r4, #0
	ldr	lr, .L14
	rsb	r0, r0, r0, lsl #4
	ldr	lr, [lr]
	add	r0, r1, r0, lsl #4
	add	lr, lr, r0, lsl #1
	mov	r5, r3, asl #1
.L8:
	cmp	r3, #0
	ble	.L9
	mov	r1, lr
	add	r0, lr, r5
.L7:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L7
.L9:
	add	r4, r4, #1
	cmp	r2, r4
	add	lr, lr, #480
	bne	.L8
.L4:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawCircle
	.type	drawCircle, %function
drawCircle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	rsb	r6, r2, #0
	cmp	r2, r6
	blt	.L16
	mov	r7, r6
	mul	r4, r2, r2
	ldr	ip, .L25
	rsb	r0, r2, r0
	rsb	r5, r2, r1
	rsb	r0, r0, r0, lsl #4
	ldr	r1, [ip]
	add	r0, r5, r0, lsl #4
	add	r5, r1, r0, lsl #1
	add	ip, r2, #1
.L21:
	mov	r2, r6
	mov	r1, #0
	mul	lr, r7, r7
.L20:
	mla	r0, r2, r2, lr
	add	r2, r2, #1
	cmp	r0, r4
	strleh	r3, [r5, r1]	@ movhi
	cmp	r2, ip
	add	r1, r1, #480
	bne	.L20
	add	r7, r7, #1
	cmp	r7, ip
	add	r5, r5, #2
	bne	.L21
.L16:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	drawCircle, .-drawCircle
	.align	2
	.global	drawTriangle
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r5, #0
	ldr	ip, .L42
	rsb	lr, r0, r0, lsl #4
	add	lr, r1, lr, lsl #4
	ldr	r4, [ip]
	sub	r6, lr, #-2147483647
	add	r6, r4, r6, lsl #1
	add	lr, r4, lr, lsl #1
	mov	r7, r2, asl #1
.L29:
	cmp	r5, #0
	movge	ip, r6
	blt	.L32
.L30:
	strh	r3, [ip, #2]!	@ movhi
	cmp	ip, lr
	bne	.L30
.L32:
	add	r5, r5, #2
	cmp	r5, r7
	add	r6, r6, #480
	add	lr, lr, #484
	bne	.L29
	mov	ip, r5
	add	r2, r2, r0
	add	r1, r5, r1
	rsb	r2, r2, r2, lsl #4
	add	r2, r1, r2, lsl #4
	add	r0, r4, r2, lsl #1
.L34:
	mov	r1, ip, lsr #1
	mov	r1, r1, asl #2
	eor	r1, r1, #3
	mvn	r1, r1
	mov	r2, #0
.L33:
	strh	r3, [r0, r2]	@ movhi
	sub	r2, r2, #4
	cmp	r2, r1
	bne	.L33
	subs	ip, ip, #2
	add	r0, r0, #476
	bne	.L34
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L47
	ldr	r2, .L47+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L45:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L45
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L50:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L50
	mov	r2, #67108864
.L52:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L52
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	cmp	r2, #0
	add	r6, sp, #28
	ldmia	r6, {r6, r8}
	ble	.L61
	mov	r4, r0
	mov	ip, r1
	mov	lr, r2, asl #1
	add	r7, lr, r1
	add	r5, r6, r8
	add	r9, r8, r3
.L58:
	cmp	r1, r5
	bge	.L57
	cmp	r6, ip
	bge	.L57
	cmp	r9, r0
	ble	.L57
	cmp	r3, r4
	blt	.L63
.L57:
	add	ip, ip, #2
	cmp	ip, r7
	add	r4, r4, #1
	bne	.L58
	add	ip, lr, r1
	add	r2, r2, r0
	add	lr, r8, r3
.L60:
	cmp	r1, r5
	bgt	.L59
	cmp	r6, ip
	bgt	.L59
	cmp	r0, lr
	bgt	.L59
	cmp	r3, r2
	ble	.L63
.L59:
	sub	ip, ip, #2
	cmp	r1, ip
	add	r2, r2, #1
	bne	.L60
.L61:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L63:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
