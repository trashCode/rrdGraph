<?php
$cliniques = array(1=>'verdun',2=>'partdieu',3=>'villeurbanne',4=>'oullins',6=>'saintfons',7=>'caluire',9=>'etatsunis',10=>'jeanmace');

if (!empty($_GET['clinique']) && preg_match('/\D/',$_GET['clinique']) == 0){
	$clinique = $cliniques[$_GET['clinique']];
}else{
	$clinique='verdun';
}

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


if (!empty($_GET['color1']) && preg_match('/[0-F][0-F][0-F][0-F][0-F][0-F]/i',$_GET['color1']) == 1){
	$color1= '#' . $_GET['color1'];
}else{
	$color1='#FF0000';
}

if (!empty($_GET['color2']) && preg_match('/[0-F][0-F][0-F][0-F][0-F][0-F]/i',$_GET['color2']) == 1){
	$color2= '#' . $_GET['color2'];
}else{
	$color2='#00FF00';
}

if (!empty($_GET['if']) && preg_match('/[^0-9\,]/',$_GET['if']) == 0 ){ //tous les characteres sont pas un nombre ou une virgule
	$rs=array();
	preg_match_all('/[0-9]+/',$_GET['if'],$rs);
	$interfaces = $rs[0];
}



$cmd = "rrdtool graph $clinique.png ";
$options = "-t '$clinique' ";
if (isset($width) && isset($height)) {
	$options .= "-w $width -h $height ";
}
if (isset($start)){ 
	$options .= "-s $start ";
}
if (isset($end)){ 
	$options .= "-e $end ";
}
//foreach ($interfaces as $key=>$val){
//todo : generer pour chaque interface demandée, une definition de donnée, un element du graph.
//}

$defs= "DEF:in1=data/$clinique.rrd:in1:AVERAGE ";
$defs.= "DEF:out1=data/$clinique.rrd:out1:AVERAGE ";
//$defs.= "DEF:in2=/tmp/interf2.rrd:in:AVERAGE "; 
//$defs.= "DEF:out2=/tmp/interf2.rrd:out:AVERAGE ";
//$defs.= "CDEF:min2=in2,-1,* ";
//$defs.= "CDEF:mout2=out2,-1,* ";
//$grahElems.= 'AREA:min2#00FF00:"inside - entrant" ';
//$grahElems.= 'LINE1:mout2#FF0000:"inside - sortant" ';
$grahElems= 'AREA:out1' .$color2. ':"trafic sortant" ';
$grahElems.= 'LINE1:in1' .$color1. ':"trafic entrant" ';


if ($_GET['debug'] == 1){
	echo $cmd . $options . $defs . $grahElems;
}
exec($cmd . $options . $defs . $grahElems);
//exec('convert -size ' .$size. ' gradient:white-\'' .$color. '\' -fill black -pointsize 40 -gravity northeast -annotate +100+40 \'' .$text. '\' -pointsize 15 -gravity southeast -annotate 0 \'' .$text2. '\' -blur 0x4 -fill \'' .$color. '\' -annotate 0 \'' .$text2. '\' -fill white -pointsize 40 -gravity northeast -annotate +100+40 \'' .$text. '\' test6.png');

	if($flux = fopen("./$clinique.png",r)){
		
		while (!feof($flux)){
			$source .= fgets($flux);
		}
		fclose($flux);
	header('Content-type: image/png');
	echo $source;
	}
?>
