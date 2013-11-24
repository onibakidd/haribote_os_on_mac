### このプロジェクトは以下の書籍、ブログを参考にしています。

[(書籍)  OS自作入門](http://taiyopworks.com/books/36)  
[(ブログ)  levelfourのブログ](http://cyberbird.indiesj.com/x86%E3%80%80os%E8%87%AA%E4%BD%9C%E5%85%A5%E9%96%80/?pageNo=4)  
[(wiki)  Wiki](http://hrb.osask.jp/wiki/?advance)  

[(github) sandai/30nichideosjisaku](https://github.com/sandai/30nichideosjisaku)  


[(nasm os_1)](http://blogger.fastriver.net/2010/12/gasos.html)
[(nasm os_2)](http://d.hatena.ne.jp/big-eyed-hamster/searchdiary?word=%2A%5BOS%BC%AB%BA%EE%C6%FE%CC%E7%5D)

[(nasm os_3)](http://d.hatena.ne.jp/mokehehe/20110215/nasm)
[(nasm_os_4)](http://pinako.blog33.fc2.com/blog-entry-50.html)


[(BIOS)](http://community.osdev.info/?(AT)BIOS)
[(MEMORY MAP)](http://community.osdev.info/?(AT)memorymap)


### 使用するツール・言語
bvi <= viコマンドが使えるバイナリエディタ  

qemu <= hariboteOSを動かすエミュレータ

nasm <= アセンブラ言語


### ----1DAY-----
###### --helloos1--
* 0x000080まで、アセンブラで値を手動入力. helloos.imgとしてファイルを保存.
* 以下のコマンドで、以降を0埋め
  * gcc -o make_binary make_binary.c
  * ./make_binary helloos1_1.img 1474560
* 0x0001F0周辺と0x001400周辺を編集。※編集後も0x168000までになるように0埋めを手動調整(調整内容はサンプルソースの任意の行を見てね。)
* 以下のコマンドでqemuを起動
  * qemu-system-i386 -fda helloos1_1.img

###### --helloos2--
* nasm version
* 以下のコマンドを実行してimg作成
  * nasm -o helloos1_2.img helloos.asm
* qemu-system-i386 -fda helloos1_2.img


### ----2DAY-----
* 以下のコマンドで、コンパイル及び実行
  * make




