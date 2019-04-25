xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_SearchPrepaidWave/";

declare function xf:convierteKXM($kiloByte as xs:string ) as xs:string
{
    if (empty($kiloByte) or $kiloByte = '')then (
		let $kiloByteNew := '0'
		return $kiloByteNew
	)
	else(
		 let $kiloByteNewConvert := xs:string(round-half-to-even(xs:decimal(fn:number($kiloByte) div 1024),2))
		 return fn:substring($kiloByteNewConvert,1,8)
	)
    
};

declare function xf:convierteSegXMin($segundos as xs:string ) as xs:string
{
    if (empty($segundos) or $segundos = '')then (
		let $segundosNew := '0'
		return $segundosNew
	)
	else(
		 let $segundosNewConvert := xs:string(round-half-to-even(xs:decimal(fn:number($segundos) div 60),2))
		 return $segundosNewConvert
	)
    
};



(:	xf:OUT_XQ_SearchPrepaidWave
	Retorna un texto indicando el saldo del cliente en las diferentes bolsas o planes que tenga.
	Cuando no le queda saldo en un bucket no se muestra el dato.
	Para chequear si el saldo es cero se comprueba si es menor que 6 ya que los planes de datos estan en bytes
	y al hacer la conversion a kilobites recien da 0.01 por el redondeo.
	entonces lo minimo que le muestra al cliente es que le queda 0.01 MB. 
:)
declare function xf:OUT_XQ_SearchPrepaidWave(
	$totalSms as xs:string,
    $totalDatosSocial as xs:string,
    $totalVoz as xs:string,
    $totalDatos4G as xs:string,
    $totalDatos as xs:string,
    $saldoTotal as xs:string,
    $DatosWhatSapp as xs:string,
    $saldoPendienteEc as xs:string
) as element(ns0:ussdOperacionResponse) {
<ns0:ussdOperacionResponse>
<errorCode>0</errorCode>
<errorDescription>{concat('Saldo: ', $saldoTotal,', 
Voz: ', if(fn:upper-case($totalVoz) = 'ILIMITADO') then ($totalVoz) else (concat(xf:convierteSegXMin($totalVoz) ,' Minutos')) ,' 
Datos: ', if(fn:upper-case($totalDatos) = 'ILIMITADO') then ($totalDatos) else(concat(xf:convierteKXM($totalDatos),' MB')) ,


(:datos de redes sociales=  dinamico, si el saldo es cero no muestra nada.:)
if(fn:upper-case($totalDatosSocial) = 'ILIMITADO')then('
Datos RRSS: Ilimitado'
)else(
if(xs:int($totalDatosSocial)<6)then('')else('
Datos RRSS: ',concat(xf:convierteKXM($totalDatosSocial),' MB')
)
),


(:datos 4G= dinamico, si el saldo es cero no muestra nada.:)
if(fn:upper-case($totalDatos4G) = 'ILIMITADO')then('
Datos 4G: Ilimitado'
)else(
if(xs:int($totalDatos4G)<6)then('')else('
Datos 4G: ',concat(xf:convierteKXM($totalDatos4G),' MB')
)
),


(:DatosWhatSapp= fijo:)
' 
WhatsApp Free: ',$DatosWhatSapp,


(:
	datos Video dinamico: si el saldo es cero no muestra nada. 
	OJO! como sms ya no se usa se esta reutilizando la variable totalSms para
	los datos de video. ver xquery: /GestorUSSD/Resources/XQuery/XQ_OrdTotalesDatosSmsVoz.xq
	(solucion sucia y rapida a un cambio urgente) TODO: crear el campo totalVideo y corregir esto a penas se pueda.
:)
if(fn:upper-case($totalSms) = 'ILIMITADO')then('
Video: Ilimitado'
)else(
if(xs:int($totalSms)<6)then('')else('
Datos Video: ',concat(xf:convierteKXM($totalSms),' MB')
)
),


(:Deuda Extra Saldo= fijo:)
',
Deuda Extra Saldo: ', $saldoPendienteEc )}</errorDescription>
</ns0:ussdOperacionResponse>


};

declare variable $totalSms as xs:string external;
declare variable $totalDatosSocial as xs:string external;
declare variable $totalVoz as xs:string external;
declare variable $totalDatos4G as xs:string external;
declare variable $totalDatos as xs:string external;
declare variable $saldoTotal as xs:string external;
declare variable $DatosWhatSapp as xs:string external;
declare variable $saldoPendienteEc as xs:string external;




xf:OUT_XQ_SearchPrepaidWave(
	$totalSms,
	$totalDatosSocial,
	$totalVoz,
	$totalDatos4G,
	$totalDatos,
	$saldoTotal,
	$DatosWhatSapp,
	$saldoPendienteEc
)