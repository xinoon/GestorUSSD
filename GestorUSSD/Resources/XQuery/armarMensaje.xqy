xquery version "2004-draft" encoding "UTF-8";

declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/armarMensaje/";

declare function xf:repeat-string
  ( $stringToRepeat as xs:string,
    $count as xs:integer )  as xs:string {

   string-join((for $i in 1 to $count return $stringToRepeat), '')
};

declare function xf:pad-integer-to-length
  ( $integerToPad as xs:string ,
    $length as xs:integer )  as xs:string {

   if ($length < string-length($integerToPad))
   then error(xs:QName('functx:Integer_Longer_Than_Length'))
   else concat
         (xf:repeat-string(
            '0',$length - string-length($integerToPad)),
          $integerToPad)
 } ;
(: ,'&#xa;','Bolsa Video: '
, xf:pad-integer-to-length($videoHoras, 2)
, ' H '
, xf:pad-integer-to-length($videoMinutos, 2)
, ' min &#xa;'
, 'Bolsa Musica: '
, xf:pad-integer-to-length($musicaHoras, 2)
, ' H '
, xf:pad-integer-to-length($musicaMinutos, 2)
, ' min':)

declare function xf:armarMensaje($videoHoras as xs:string,
    $videoMinutos as xs:string,
    $musicaHoras as xs:string,
    $musicaMinutos as xs:string,
    $whatsappIlimitado as xs:string,
    $whatsappIliPromo as xs:string,
    $vozIlimitada as xs:string)
    as xs:string {
    
      concat(
      	'Bolsa WhatSapp 12 meses: ',$whatsappIlimitado,', 
Bolsa de minutos ilimitados x 3 dias: ', $vozIlimitada
      )
    
};

declare variable $videoHoras as xs:string external;
declare variable $videoMinutos as xs:string external;
declare variable $musicaHoras as xs:string external;
declare variable $musicaMinutos as xs:string external;
declare variable $whatsappIlimitado as xs:string external;
declare variable $whatsappIliPromo as xs:string external;
declare variable $vozIlimitada as xs:string external;


xf:armarMensaje($videoHoras,
    $videoMinutos,
    $musicaHoras,
    $musicaMinutos,
    $whatsappIlimitado,
    $whatsappIliPromo,
    $vozIlimitada)