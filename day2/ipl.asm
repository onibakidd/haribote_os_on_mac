; DAY2#helloos
    bits    16
    org     0x7c00              ; このプログラムがどこに読み込まれるか
    jmp short   entry
    global  _main

; 標準的なFAT12フォーマットフロッピーディスクのための記述
_main:
    db      0x90
    db      "HELLOIPL"          ; ブートセクタの名前(8byte)
    dw      512                 ; Ⅰセクタの大きさ
    db      1                   ; クラスタの大きさ(Ⅰセクタにしなければならない)
    dw      1                   ; FATがどこから始まるか
    db      2                   ; FATの個数(2にしなければならない)
    dw      224                 ; ルートディレクトリの領域の大きさ(普通は224エントリ)
    dw      2880                ; このドライブの大きさ(2880にしなければならない)
    db      0xf0                ; メディアのタイプ(0xf0にしなければならない）
    dw      9                   ; FAT領域の長さ(9セクタにしなければならない)
    dw      18                  ; Ⅰトラックにいくつのセクタがあるか（18にしなければならない)
    dw      2                   ; ヘッドの数(2にしなければならない)
    dd      0                   ; パーティションを使ってないので、ここは必ず0
    dd      2880                ; このドライブの大きさをもう一度書く
    db      0,  0,  0x29        ; ??? よくわからないけどこの値にしておくと良いらしい<===========??
    dd      0xffffffff          ; おそらく、ボリュームシリアル番号
    db      "HELLO-OS   "       ; ディスクの名前(11バイト)
    db      "FAT12   "             ; フォーマットの名前(8byte)
    times   18 db 0             ; とりあえず18byteあけておく

; プログラム本体
entry:
    mov     AX, 0               ; レジスタ初期化
    mov     SS, AX
    mov     SP, 0x7c00
    mov     DS, AX
    mov     ES, AX

    mov     SI, msg

putloop:
    mov     AL, [SI]
    add     SI, 1
    cmp     AL, 0
    je short    fin
    mov     AH, 0x0e            ; １文字表示ファンクション
    mov     BX, 15              ; カラーコード
    int     0x10                ; ビデオBIOS書き出し
    jmp short   putloop

fin:
    hlt                         ; 何かあるまでCPUを停止
    jmp     fin                 ; 無限ループ

msg:
    db      0x0a, 0x0a;         ; 改行を2つ
    db      "hello, world"
    db      0x0a                ; 改行
    db      0

    times   0x1fe-($-$$) db 0   ; 0x001feまでを0x00で埋める命令

    db      0x55, 0xaa


; 以下はブートセレクタ以外の部分の記述
    db      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    times   4600 db 0
    db      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    times   1469432 db 0        ; 2879*512 = 1469432



