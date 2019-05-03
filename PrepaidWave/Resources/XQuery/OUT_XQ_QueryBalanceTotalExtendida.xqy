xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma bea:global-element-return element="ns1:balanceTotalExtendidoResponse" location="../WSDL/PrepaidWaveService.xsd" ::)

declare namespace ns1 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";

declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_QueryBalanceTotalExtendida/";

declare function xf:cambioFormtDat($fecha as xs:string ) as xs:string
{
    if (empty($fecha) or $fecha = '')then (
		let $StartTime := ''
		return $StartTime
	)
	else(
		let $LCInicioFecha := fn:substring(xs:string($fecha),0,11)
		let $LCInicioHora  := fn:substring(xs:string($fecha),12,8)
		let $StartTime     := fn:concat(fn-bea:date-to-string-with-format("yyyyMMdd",xs:date($LCInicioFecha)),"",fn-bea:time-to-string-with-format("HHmmss",xs:time($LCInicioHora)))
		return $StartTime
	)
    
};

declare function xf:OUT_XQ_QueryBalanceTotalExtendida(
    $flagTotalBucket as xs:string,
    $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(ns1:balanceTotalExtendidoResponse) {
        <ns1:balanceTotalExtendidoResponse>
            <sumTotal>{ data($searchBalancesICC_response1/ns0:totalBalance) }</sumTotal>
            <planAbonado>{ data($searchBalancesICC_response1/ns0:descPlan) }</planAbonado>
            <listBucket> 
                {
                
               
					if($flagTotalBucket = 'N' and xs:int(count($searchBalancesICC_response1/ns0:buckets)) > 0) then (
					

 						 let $balance := data($searchBalancesICC_response1/ns0:balance)
                         let $vigenciaBalance := xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:dateBalance))
                         let $concatMain := (concat('|MAIN_BALANCE|',$balance,'|',$vigenciaBalance))                          
                        
                         for $indice  in ( 1 to count($searchBalancesICC_response1/ns0:buckets))  
		                    let $nombreBucket  := data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef) 
		                    let $MontoBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits))  
		                    let $VigenciaHastaBucket  := xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate))  
		                    
	
		                    let $concatListBucket  := if (xs:int($indice) =1) then (concat($concatMain,'|',$nombreBucket,'|',$MontoBucket,'|',$VigenciaHastaBucket)) else(
		                    concat('|',$nombreBucket,'|',$MontoBucket,'|',$VigenciaHastaBucket) )
		                    return
	                        ($concatListBucket)
	                       
	                      
	                 )else( 
	                  	 let $balance := data($searchBalancesICC_response1/ns0:balance)
                         let $vigenciaBalance := xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:dateBalance))
                         return if($flagTotalBucket = 'N') then (concat('|MAIN_BALANCE|',$balance,'|',$vigenciaBalance)) else()
	                 )
                }
</listBucket>
            <errorCode>{if($flagTotalBucket = 'N') then (
            if(empty($searchBalancesICC_response1/ns0:buckets) or count($searchBalancesICC_response1/ns0:buckets) <= 0) then
            (1)else(0))
            else(
            0)}</errorCode>
            <errorDescription>{if($flagTotalBucket = 'N') then (
            if(empty($searchBalancesICC_response1/ns0:buckets) or count($searchBalancesICC_response1/ns0:buckets) <= 0 ) then
            ('No se encuentran bucket para el cliente.') else ('Consulta Exitosa.')
            )else('Consulta Exitosa.')}</errorDescription>
        </ns1:balanceTotalExtendidoResponse>
};

declare variable $flagTotalBucket as xs:string external;
declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:OUT_XQ_QueryBalanceTotalExtendida(
    $flagTotalBucket,
    $searchBalancesICC_response1)