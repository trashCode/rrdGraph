<?php
	
if (!empty($_GET['size']) && preg_match('/[0-9]+x[0-9+]/',$_GET['size']) == 1){
	$size=$_GET['size'];
	$width=preg_replace('/([0-9]+)x[0-9]+/','\1',$size);
	$height=preg_replace('/[0-9]+x([0-9]+)/','\1',$size);
}else{
	$size='1024x768';
}
	
if (!empty($_GET['start']) && preg_match('/[0-9]+/',$_GET['start']) == 1){
	$start=$_GET['start'];
}
if (!empty($_GET['end']) && preg_match('/[0-9]+/',$_GET['end']) == 1){
	$end=$_GET['end'];
}


if (!empty($_GET['color']) && preg_match('/[0-F][0-F][0-F][0-F][0-F][0-F]/i',$_GET['color']) == 1){
	$color= '#' . $_GET['color'];
}else{
	$color='#7fd5ff';
}




$cmd = 'rrdtool graph tmp.png ';
$options = "-t 'fw-verdun' --vertical-label 'reseau CSD <== PIX ==> Internet  ' ";
if (isset($width) && isset($height)) {
	$options .= "-w $width -h $height ";
}
if (isset($start)){ 
	$options .= "-s $start ";
}
if (isset($end)){ 
	$options .= "-e $end ";
}
$defs= "DEF:in1=/tmp/interf1.rrd:in:AVERAGE ";
$defs.= "DEF:out1=/tmp/interf1.rrd:out:AVERAGE ";
$defs.= "DEF:in2=/tmp/interf2.rrd:in:AVERAGE "; 
$defs.= "DEF:out2=/tmp/interf2.rrd:out:AVERAGE ";
$defs.= "CDEF:min2=in2,-1,* ";
$defs.= "CDEF:mout2=out2,-1,* ";
$grahElems= 'AREA:in1#FF0000:"outside - entrant" ';
$grahElems.= 'AREA:min2#00FF00:"inside - entrant" ';
$grahElems.= 'LINE1:mout2#FF0000:"inside - sortant" ';
$grahElems.= 'LINE1:out1#00FF00:"outside - sortant" ';

exec($cmd . $options . $defs . $grahElems);
//exec('convert -size ' .$size. ' gradient:white-\'' .$color. '\' -fill black -pointsize 40 -gravity northeast -annotate +100+40 \'' .$text. '\' -pointsize 15 -gravity southeast -annotate 0 \'' .$text2. '\' -blur 0x4 -fill \'' .$color. '\' -annotate 0 \'' .$text2. '\' -fill white -pointsize 40 -gravity northeast -annotate +100+40 \'' .$text. '\' test6.png');

	if($flux = fopen('./tmp.png',r)){
		
		while (!feof($flux)){
			$source .= fgets($flux);
		}
		fclose($flux);
	header('Content-type: image/png');
	echo $source;
	}
?>
