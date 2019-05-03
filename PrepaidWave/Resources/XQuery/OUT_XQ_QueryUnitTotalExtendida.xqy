xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma bea:global-element-return element="ns1:unitTotalExtendidaResponse" location="../WSDL/PrepaidWaveService.xsd" ::)

declare namespace ns1 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace funcRBX = "http://www.rubix.nl/local";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_QueryUnitTotalExtendida/";

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

declare function xf:OUT_XQ_QueryUnitTotalExtendida(
    $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(ns1:unitTotalExtendidaResponse) {
        <ns1:unitTotalExtendidaResponse>
            <planAbonado>{ data($searchBalancesICC_response1/ns0:descPlan) }</planAbonado>
            <cantidadBucketAdq>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and ns0:tipoTrafico != 'DATOS_ROAMING' and ns0:tecnologia != '4G']) }</cantidadBucketAdq>
            <cantidadBucketPro>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'S' and ns0:tipoTrafico != 'DATOS_ROAMING' and ns0:tecnologia != '4G']) }</cantidadBucketPro>
            <listBucketUnidAdq>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef))  
                    let $MontoBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits))  
                    let $VigenciaHastaBucket  := (xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate)))  
                    let $TipoUnidad  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico))  
                    let $concatListBucket  := if (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo) = 'N' and data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico) != 'DATOS_ROAMING'
                    and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text() != '4G') then
                            (concat('|',$nombreBucket,'|', $TipoUnidad ,'|',$MontoBucket,'|',$VigenciaHastaBucket))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
</listBucketUnidAdq>
            <listBucketUnidPro>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef))  
                    let $MontoBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits))  
                    let $TipoUnidad  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico))  
                    let $VigenciaHastaBucket  := (xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate)))  
                    let $concatListBucket  := if (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo) = 'S' and data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico) != 'DATOS_ROAMING'
                    and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text() != '4G') then
                            (concat('|',$nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
</listBucketUnidPro>
            <listBucketUnidTot>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef))  
                    let $MontoBucket  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits))  
                    let $VigenciaHastaBucket  := (xf:cambioFormtDat(data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate)))  
                    let $TipoUnidad  := (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico))  
                    let $concatListBucket  := if (data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo) = ('S','N') and data($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico) != 'DATOS_ROAMING' 
                    and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text() != '4G') then
                            (concat('|',$nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
			</listBucketUnidTot>
            <totalDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia != '4G' ]/ns0:remainingUnits)))}</totalDatos>
            <totalVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:tecnologia != '4G' ]/ns0:remainingUnits)))}</totalVoz>
            <totalSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:tecnologia != '4G' ]/ns0:remainingUnits)))}</totalSms>
            <errorCode>0</errorCode>
            <errorDescription>
                {
                    if ((count($searchBalancesICC_response1/ns0:buckets[ns0:promo = ('S','N') and ns0:tipoTrafico != 'DATOS_ROAMING' and ns0:tecnologia != '4G']) <= 0 or empty($searchBalancesICC_response1/ns0:buckets[ns0:promo = ('S','N') and ns0:tipoTrafico != 'DATOS_ROAMING' and ns0:tecnologia != '4G'] ))) then
                        ('No se encuentran bucket para el cliente.')
                    else 
                        'Consulta Exitosa.'
                }
</errorDescription>
        </ns1:unitTotalExtendidaResponse>
};
 
declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:OUT_XQ_QueryUnitTotalExtendida(
    $searchBalancesICC_response1)