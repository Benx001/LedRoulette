  ;Autor: Benx001
  ;Date: 28/11/2020
  ;Description: Led roulette with six leds
    
    #include <xc.inc>
  CONFIG  WDTE = OFF
  CONFIG  CP = OFF
  CONFIG  MCLRE = OFF
    delayv1    equ 10h
    delayv2    equ 11h
    delayv3    equ 12h
  ORG 0x0000
  movlw	0b11011111
  OPTION
start:
    ;Z01 -led0
    ;Z10 -led1
    ;01Z -led2
    ;10Z -led3
    ;0Z1 -led4
    ;1Z0 -led5
    movlw   0ah
    addwf   delayv3,1
    call    led0
    call    delay
    call    led1
    call    delay
    call    led2
    call    delay
    call    led3
    call    delay
    call    led4
    call    delay
    call    led5
    call    delay
    goto    start
delay:
    nop
    movf    delayv3,0
    movwf   delayv1
delayb:
    movf    delayv3,0
    movwf   delayv2
    decfsz  delayv1,1
    goto    delayc
    retlw   00h
delayc:
    nop
    nop
    decfsz  delayv2,1
    goto    delayc
    goto    delayb
led0:
    movlw   0B00000100
    tris    GPIO
    nop
    bcf	    GPIO,1
    nop
    bsf	    GPIO,0
    nop
    retlw   00h
led1:
    movlw   0B00000100
    tris    GPIO
    nop
    bcf	    GPIO,0
    nop
    bsf	    GPIO,1
    nop
    retlw   00h
led2:
    movlw   0B00000001
    tris    GPIO
    nop
    bcf	    GPIO,2
    nop
    bsf	    GPIO,1
    nop
    retlw   00h
led3:
    movlw   0B00000001
    tris    GPIO
    nop
    bcf	    GPIO,1
    nop
    bsf	    GPIO,2
    nop
    retlw   00h
led4:
    movlw   0B00000010
    tris    GPIO
    nop
    bcf	    GPIO,2
    nop
    bsf	    GPIO,0
    nop
    retlw   00h
led5:
    movlw   0B00000010
    tris    GPIO
    nop
    bcf	    GPIO,0
    nop
    bsf	    GPIO,2
    nop
    retlw   00h
offleds:
    movlw   0B00000111
    tris    GPIO
    retlw   00h
  END
