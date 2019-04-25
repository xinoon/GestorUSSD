xquery version "2004-draft";
(:: pragma bea:schema-type-parameter parameter="$sReturnVO1" type="ns0:SReturnVO" location="../../../../PCRF/WSDL/UPCCProvisioning.wsdl" ::)
(:: pragma bea:global-element-return element="listXmlBundle" location="../WSDLs/responseXmlCuotaDato.xsd" ::)

declare namespace ns0 = "rm:type";
declare namespace xf = "http://tempuri.org/LTInfoService/Resources/XQuery/XQ_OrdenBolsaDato/";
declare namespace funcGf = "http://tempuri.org/LTInfoService/Resources/XQuery/gestionFecha";


declare function funcGf:run($caracFecha as xs:string) as xs:string
{
  let $result :=  fn:concat(fn:substring($caracFecha,1,4),'-',fn:substring($caracFecha,5,2),'-',fn:substring($caracFecha,7,2) )
  return $result
};

declare function xf:XQ_OrdenBolsaDato($sReturnVO1 as element())
    as element(listXmlBundle) {
    <listXmlBundle> 
    {
 	for $subscribedService in $sReturnVO1/subscribedService
 	let $NomServ := data($subscribedService/attribute[key='SRVNAME']/value) 	
 	let $fechIniServ := if(data($subscribedService/attribute[key='SRVSTARTDATETIME']/value) eq '-1') then 'T' else 	funcGf:run(data($subscribedService/attribute[key='SRVSTARTDATETIME']/value))
 	let $fechFinNomServ := if( data($subscribedService/attribute[key='SRVENDDATETIME']/value) eq '-1') then 'T' else funcGf:run(data($subscribedService/attribute[key='SRVENDDATETIME']/value))
    return
        
            <listXmlBundles>
            	<bolsa>{ $NomServ}</bolsa>
                <fechaInicio>{$fechIniServ}</fechaInicio>
		        <fechaFin>{$fechFinNomServ }</fechaFin>
                {
                 	for $subscriberQuota in $sReturnVO1/subscriberQuota
				 	let $ConsQuoServ := data($subscriberQuota/attribute[key='QTAVALUE']/value)
				 	let $ConsNomQuoServ := data($subscriberQuota/attribute[key='SRVNAME']/value)
				 	return
		                if($NomServ eq $ConsNomQuoServ) then
		                 <cuotaBolsa>{$ConsQuoServ }</cuotaBolsa>
		                else()
                }
                {
                 	for $subscriberQuota in $sReturnVO1/subscriberQuota
				 	let $BalQuoServ := data($subscriberQuota/attribute[key='QTACONSUMPTION']/value)
				 	let $BalNomQuoServ := data($subscriberQuota/attribute[key='SRVNAME']/value)
				 	return
		                if($NomServ eq $BalNomQuoServ) then
		                <cuotaOcupada>{$BalQuoServ }</cuotaOcupada>
		                else()
                }
                 {
                 	for $subscriberQuota in $sReturnVO1/subscriberQuota
				 	let $QuoServ := data($subscriberQuota/attribute[key='QTABALANCE']/value)
				 	let $NomQuoServ := data($subscriberQuota/attribute[key='SRVNAME']/value)
				 	return
				 	if($NomServ eq $NomQuoServ) then
		                <cuotaDisponible>{ $QuoServ}</cuotaDisponible>
		                 else()
                }
            </listXmlBundles>
    }
    </listXmlBundle>
};

declare variable $sReturnVO1 as element() external;

xf:XQ_OrdenBolsaDato($sReturnVO1)