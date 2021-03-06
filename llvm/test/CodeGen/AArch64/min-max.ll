; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-eabi %s -o - | FileCheck %s

; These tests just check that the plumbing is in place for @llvm.smax, @llvm.umax,
; @llvm.smin, @llvm.umin.

declare i8 @llvm.smax.i8(i8 %a, i8 %b) readnone

define i8 @smaxi8(i8 %a, i8 %b) {
; CHECK-LABEL: smaxi8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sxtb w8, w1
; CHECK-NEXT:    sxtb w9, w0
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, gt
; CHECK-NEXT:    ret
  %c = call i8 @llvm.smax.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.smax.i16(i16 %a, i16 %b) readnone

define i16 @smaxi16(i16 %a, i16 %b) {
; CHECK-LABEL: smaxi16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sxth w8, w1
; CHECK-NEXT:    sxth w9, w0
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, gt
; CHECK-NEXT:    ret
  %c = call i16 @llvm.smax.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.smax.i32(i32 %a, i32 %b) readnone

define i32 @smaxi32(i32 %a, i32 %b) {
; CHECK-LABEL: smaxi32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, gt
; CHECK-NEXT:    ret
  %c = call i32 @llvm.smax.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.smax.i64(i64 %a, i64 %b) readnone

define i64 @smaxi64(i64 %a, i64 %b) {
; CHECK-LABEL: smaxi64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, gt
; CHECK-NEXT:    ret
  %c = call i64 @llvm.smax.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.smax.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @smax8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: smax8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.smax.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.smax.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @smax16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: smax16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.smax.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <4 x i16> @llvm.smax.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @smax4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: smax4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.smax.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.smax.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @smax8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: smax8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.smax.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <2 x i32> @llvm.smax.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @smax2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: smax2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.smax.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.smax.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @smax4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: smax4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <1 x i64> @llvm.smax.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @smax1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-LABEL: smax1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    fmov x8, d1
; CHECK-NEXT:    fmov x9, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, gt
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %c = call <1 x i64> @llvm.smax.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.smax.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @smax2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: smax2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov x8, v1.d[1]
; CHECK-NEXT:    mov x9, v0.d[1]
; CHECK-NEXT:    fmov x10, d1
; CHECK-NEXT:    fmov x11, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, gt
; CHECK-NEXT:    cmp x11, x10
; CHECK-NEXT:    csel x9, x11, x10, gt
; CHECK-NEXT:    fmov d0, x9
; CHECK-NEXT:    mov v0.d[1], x8
; CHECK-NEXT:    ret
  %c = call <2 x i64> @llvm.smax.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare i8 @llvm.umax.i8(i8 %a, i8 %b) readnone

define i8 @umaxi8(i8 %a, i8 %b) {
; CHECK-LABEL: umaxi8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, #0xff
; CHECK-NEXT:    and w9, w0, #0xff
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, hi
; CHECK-NEXT:    ret
  %c = call i8 @llvm.umax.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.umax.i16(i16 %a, i16 %b) readnone

define i16 @umaxi16(i16 %a, i16 %b) {
; CHECK-LABEL: umaxi16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, #0xffff
; CHECK-NEXT:    and w9, w0, #0xffff
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, hi
; CHECK-NEXT:    ret
  %c = call i16 @llvm.umax.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.umax.i32(i32 %a, i32 %b) readnone

define i32 @umaxi32(i32 %a, i32 %b) {
; CHECK-LABEL: umaxi32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, hi
; CHECK-NEXT:    ret
  %c = call i32 @llvm.umax.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.umax.i64(i64 %a, i64 %b) readnone

define i64 @umaxi64(i64 %a, i64 %b) {
; CHECK-LABEL: umaxi64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, hi
; CHECK-NEXT:    ret
  %c = call i64 @llvm.umax.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.umax.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @umax8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: umax8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.umax.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.umax.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @umax16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: umax16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.umax.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <4 x i16> @llvm.umax.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @umax4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: umax4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.umax.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.umax.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @umax8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: umax8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.umax.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <2 x i32> @llvm.umax.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @umax2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: umax2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.umax.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.umax.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @umax4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: umax4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.umax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <1 x i64> @llvm.umax.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @umax1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-LABEL: umax1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    fmov x8, d1
; CHECK-NEXT:    fmov x9, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, hi
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %c = call <1 x i64> @llvm.umax.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.umax.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @umax2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: umax2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub v1.2d, v1.2d, v0.2d
; CHECK-NEXT:    add v0.2d, v0.2d, v1.2d
; CHECK-NEXT:    ret
  %c = call <2 x i64> @llvm.umax.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare i8 @llvm.smin.i8(i8 %a, i8 %b) readnone

define i8 @smini8(i8 %a, i8 %b) {
; CHECK-LABEL: smini8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sxtb w8, w1
; CHECK-NEXT:    sxtb w9, w0
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, lt
; CHECK-NEXT:    ret
  %c = call i8 @llvm.smin.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.smin.i16(i16 %a, i16 %b) readnone

define i16 @smini16(i16 %a, i16 %b) {
; CHECK-LABEL: smini16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sxth w8, w1
; CHECK-NEXT:    sxth w9, w0
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, lt
; CHECK-NEXT:    ret
  %c = call i16 @llvm.smin.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.smin.i32(i32 %a, i32 %b) readnone

define i32 @smini32(i32 %a, i32 %b) {
; CHECK-LABEL: smini32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, lt
; CHECK-NEXT:    ret
  %c = call i32 @llvm.smin.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.smin.i64(i64 %a, i64 %b) readnone

define i64 @smini64(i64 %a, i64 %b) {
; CHECK-LABEL: smini64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, lt
; CHECK-NEXT:    ret
  %c = call i64 @llvm.smin.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.smin.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @smin8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: smin8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.smin.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.smin.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @smin16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: smin16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.smin.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <4 x i16> @llvm.smin.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @smin4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: smin4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.smin.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.smin.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @smin8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: smin8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.smin.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <2 x i32> @llvm.smin.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @smin2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: smin2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.smin.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.smin.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @smin4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: smin4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.smin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <1 x i64> @llvm.smin.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @smin1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-LABEL: smin1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    fmov x8, d1
; CHECK-NEXT:    fmov x9, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, lt
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %c = call <1 x i64> @llvm.smin.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.smin.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @smin2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: smin2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov x8, v1.d[1]
; CHECK-NEXT:    mov x9, v0.d[1]
; CHECK-NEXT:    fmov x10, d1
; CHECK-NEXT:    fmov x11, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, lt
; CHECK-NEXT:    cmp x11, x10
; CHECK-NEXT:    csel x9, x11, x10, lt
; CHECK-NEXT:    fmov d0, x9
; CHECK-NEXT:    mov v0.d[1], x8
; CHECK-NEXT:    ret
  %c = call <2 x i64> @llvm.smin.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare i8 @llvm.umin.i8(i8 %a, i8 %b) readnone

define i8 @umini8(i8 %a, i8 %b) {
; CHECK-LABEL: umini8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, #0xff
; CHECK-NEXT:    and w9, w0, #0xff
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, lo
; CHECK-NEXT:    ret
  %c = call i8 @llvm.umin.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.umin.i16(i16 %a, i16 %b) readnone

define i16 @umini16(i16 %a, i16 %b) {
; CHECK-LABEL: umini16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, #0xffff
; CHECK-NEXT:    and w9, w0, #0xffff
; CHECK-NEXT:    cmp w9, w8
; CHECK-NEXT:    csel w0, w9, w8, lo
; CHECK-NEXT:    ret
  %c = call i16 @llvm.umin.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.umin.i32(i32 %a, i32 %b) readnone

define i32 @umini32(i32 %a, i32 %b) {
; CHECK-LABEL: umini32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, lo
; CHECK-NEXT:    ret
  %c = call i32 @llvm.umin.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.umin.i64(i64 %a, i64 %b) readnone

define i64 @umini64(i64 %a, i64 %b) {
; CHECK-LABEL: umini64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, lo
; CHECK-NEXT:    ret
  %c = call i64 @llvm.umin.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.umin.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @umin8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: umin8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.umin.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.umin.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @umin16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: umin16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.umin.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <4 x i16> @llvm.umin.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @umin4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: umin4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.umin.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.umin.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @umin8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: umin8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.umin.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <2 x i32> @llvm.umin.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @umin2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: umin2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.umin.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.umin.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @umin4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: umin4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.umin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <1 x i64> @llvm.umin.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @umin1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-LABEL: umin1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    fmov x8, d1
; CHECK-NEXT:    fmov x9, d0
; CHECK-NEXT:    cmp x9, x8
; CHECK-NEXT:    csel x8, x9, x8, lo
; CHECK-NEXT:    fmov d0, x8
; CHECK-NEXT:    ret
  %c = call <1 x i64> @llvm.umin.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.umin.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @umin2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: umin2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub v1.2d, v0.2d, v1.2d
; CHECK-NEXT:    sub v0.2d, v0.2d, v1.2d
; CHECK-NEXT:    ret
  %c = call <2 x i64> @llvm.umin.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}
