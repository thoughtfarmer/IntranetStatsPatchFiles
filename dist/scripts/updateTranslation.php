<?php

function updateLangFile($path)
{
	$translations = array();

	if( file_exists($path) )
	{
		require $path;
	}

	foreach($translations as $k => $v)
	{

		if( $k == "General_PiwikIsACollaborativeProjectYouCanContribute")
		{
			$translations[$k] = '<a target=\'new\' href=\'http://www.intranetstatistics.com\'>Intranet Statistics</a> is based on %1$s Piwik %2$s. %3$sPiwik is a collaborative project. Check out %4$s How to participate in Piwik?%5$s';
		}
		else
		{
			$translations[$k] = str_replace("Piwik","Intranet Statistics",$v);
		}
	}
	
	writeLangFile($path, $translations);
}

function writeLangFile($path, $translations)
{
	$tstr = '<?php '."\n";
	$tstr .= '$translations = array('."\n";

	foreach($translations as $key => $value)
	{
		$tstr .= "\t'".$key."' => '".addcslashes($value,"'")."',\n";
	}

	$tstr .= ');';

	$f = fopen($path, "w");

	fwrite($f, $tstr);
	fclose($f);
}

$langFiles = glob( 'lang/*.php' );

foreach($langFiles as $f)
{
	echo "Processing " . $f . "\n";

	updateLangFile($f);
}


