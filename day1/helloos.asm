; DAY1#helloos
    bits    16
    global  _main

; 標準的なFAT12フォーマットフロッピーディスクのための記述
_main:
    db      0xeb, 0x4e, 0x90
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
    db      0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
    db      0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
    db      0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    db      0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    db      0xee, 0xf4, 0xeb, 0xfd

; メッセージ部分
    db      0x0a, 0x0a      ;改行を２つ
    db      'my name is taiyop. hello, world'
    db      0x0a            ;改行
    db      0

    times   0x1fe-($-$$) db 0   ; 0x001feまでを0x00で埋める命令

    db      0x55, 0xaa

; 以下はブートセレクタ以外の部分の記述
    db      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    times   4600 db 0
    db      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    times   1469432 db 0



