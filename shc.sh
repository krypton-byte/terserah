#!/usr/bin/bash
#belajar bahasa pemrograman memanglah epik tapi
#pernah gk sih lo bikin program pake bahasa indonesia
shopt -s expand_aliases
. ./kamus.sh
pilihan(){
	cetakf '+---------------------------------------+\nuntuk mengcompile bash/sh/csh/zsh\npastikan di kasih header\n#!/data/data/com.termux/files/usr/bin/sh\n+---------------------------------------+\n'
	cetakf '\t1. compiler\n'
	cetakf '\t2. compiler + tanggal kedaluarsa\n'
	cetakf '\t3. keluar\n'
	cetakf '+---------------------------------------+\n'
	cetakf '\tpilih > ';baca -n 1 yn
	sementara benar
	melakukan
		jika [[ $yn == '1' ]]
		kemudian
			compel
		jika-lain [[ $yn == '2' ]]
		kemudian
			compelplus
		lain
			cetakf '\n\tyg anda pilih tidak ada\n'
			terus
		tmt
	selesai
}
compel(){
	bersih
	cetakf '\n\tfile  > '
	baca fil
	cetakf '\tout   > '
	baca out
	jika [[ -f $fil ]]
	kemudian
		./bin/shc -f $fil -o $out
		hapus -rf *.x.c
		keluar
	lain
		cetakf '\tfile tidak ada\n'
	tmt
}
compelplus(){
	bersih
	cetakf '\n\tfile      > ';baca fil
	cetakf '\ttanggal   > ';baca tgl
	cetakf '\tbulan     > ';baca bln
	cetakf '\ttahun     > ';baca thn
	cetakf '\tpesan exp > ';baca pesan
	cetakf '\tout       > ';baca out
	jika [[ -f $fil ]]
	kemudian
		./bin/shc -e "$tgl/$bln/$thn" -m "$pesan" -f $fil -o $out
		hapus *.x.c
		keluar
	lain
		cetakf '\tfile tidak ada'
	tmt
}
pilihan


