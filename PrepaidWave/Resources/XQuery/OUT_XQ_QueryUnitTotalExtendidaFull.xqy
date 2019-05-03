xquery version "2004-draft" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma bea:global-element-return element="ns1:unitTotalExtendidaFullResponse" location="../WSDL/PrepaidWaveService.xsd" ::)

declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_QueryUnitTotalExtendidaFull/";
declare namespace ns1 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";

declare function xf:cambioFormtDat($fecha as xs:string ) as xs:string
{
		let $LCInicioFecha := fn:substring(xs:string($fecha),0,11)
		let $LCInicioHora  := fn:substring(xs:string($fecha),12,8)
		let $StartTime     := fn:concat(fn-bea:date-to-string-with-format("yyyyMMdd",xs:date($LCInicioFecha)),"",fn-bea:time-to-string-with-format("HHmmss",xs:time($LCInicioHora)))
		return $StartTime
	
    
};


declare function xf:OUT_XQ_QueryUnitTotalExtendidaFull($searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(ns1:unitTotalExtendidaFullResponse) {
<ns1:unitTotalExtendidaFullResponse>
            <planAbonado>{ data($searchBalancesICC_response1/ns0:descPlan) }</planAbonado>
            <cantidadBucketAdq>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N']) }</cantidadBucketAdq>
            <cantidadBucketPro>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'S']) }</cantidadBucketPro>
            <listBucketUnidAdq>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $consumido := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text()
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()  
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                    let $ptecnologia  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()
                    let $basal  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    
                    
                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = 'N' and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text() != 'DATOS_ROAMING') then
                            (concat($nombreBucket,'|', $TipoUnidad ,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
			</listBucketUnidAdq>
            <listBucketUnidPro>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $consumido := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text()
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                    let $ptecnologia  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $basal := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()

                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = 'S' and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text() != 'DATOS_ROAMING' 
   					and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text() != 'SOC') then
                            (concat($nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket) 
                }
			</listBucketUnidPro>
            <listBucketRoamingUnidAdq>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $consumido := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text()
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()  
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                    let $ptecnologia  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()
                    let $basal  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    
                    
                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = 'N' and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text() = 'DATOS_ROAMING') then
                            (concat($nombreBucket,'|', $TipoUnidad ,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
			</listBucketRoamingUnidAdq>
            <listBucketRoamingUnidPro>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $consumido := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text()
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                                        let $ptecnologia  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $basal  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()

                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = 'S' and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text() = 'DATOS_ROAMING') then
                            (concat($nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket) 
                }
			</listBucketRoamingUnidPro>
            <listBucketUnidProSocial>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $consumido := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text()
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                    let $ptecnologia := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $basal  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()

                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = 'S' and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text() != 'DATOS_ROAMING' 
   					and $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text() = 'SOC') then
                            (concat($nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket) 
                }
			</listBucketUnidProSocial>			
			<listBucketUnidTot>
                {
                    for $indice  in (1 to count($searchBalancesICC_response1/ns0:buckets))  
                    let $nombreBucket  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:usageLabelRef/text()  
                    let $MontoBucket  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'ILI') then ('-1') else ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:remainingUnits/text()) 
                    let $VigenciaHastaBucket  := if(not(empty($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text()))) then (xf:cambioFormtDat($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:limitDate/text())) else() 
                    let $TipoUnidad  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tipoTrafico/text()
                    let $consumido :=  $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:initialQuantity/text() 
                    let $plataforma  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:plataforma/text()
                    let $ptecnologia  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tecnologia/text()
                    let $tecnologia  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:tematica/text() = 'S') then concat($ptecnologia,'-TEM') else($ptecnologia)
                    let $startDate  := $searchBalancesICC_response1/ns0:buckets[$indice]/ns0:startDate/text()
                    let $basal  := if($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:basal/text() = 'S') then ('BASAL') else ('NOBASAL')
                    let $startDateFormat := if(not(empty($startDate))) then (xf:cambioFormtDat($startDate)) else()
                    
                    let $concatListBucket  := if ($searchBalancesICC_response1/ns0:buckets[$indice]/ns0:promo/text() = ('S','N')) then
                            (concat($nombreBucket,'|', $TipoUnidad,'|',$MontoBucket,'|',$VigenciaHastaBucket,'|',$consumido,'|',$plataforma,'|',$basal,'|',$tecnologia,'|',$startDateFormat,';'))
                        else 
                            ''
                          
                    return
                        ($concatListBucket)
                }
			</listBucketUnidTot>	
            <totalVigDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia != 'WSP' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigDatos>
            <totalVigVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVoz>
            <totalVigSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigSms>
            <totalConsDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia != 'WSP' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsDatos>
            <totalConsVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ']/ns0:initialQuantity)))}</totalConsVoz>
            <totalConsSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS']/ns0:initialQuantity)))}</totalConsSms>
	        <totalVigPromoDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia != ('SOC','WSP') and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigPromoDatos>
	        <totalVigPromoVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:promo = 'S' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigPromoVoz>
	        <totalVigPromoSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:promo = 'S' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigPromoSms>
	        <totalConsPromoDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia != ('SOC','WSP') and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsPromoDatos>
	        <totalConsPromoVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:promo = 'S']/ns0:initialQuantity)))}</totalConsPromoVoz>
	        <totalConsPromoSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:promo = 'S']/ns0:initialQuantity)))}</totalConsPromoSms>
	        <totalVigVentaDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVentaDatos>
	        <totalVigVentaVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:promo = 'N' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVentaVoz>
	        <totalVigVentaSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:promo = 'N' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVentaSms>
	        <totalConsVentaDatos>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsVentaDatos>
	        <totalConsVentaVoz>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:promo = 'N']/ns0:initialQuantity)))}</totalConsVentaVoz>
	        <totalConsVentaSms>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:promo = 'N']/ns0:initialQuantity)))}</totalConsVentaSms>
	       	<totalConsVentaDatos4G>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tecnologia = '4G' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsVentaDatos4G>
	        <totalVigVentaDatos4G>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tecnologia = '4G' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVentaDatos4G>
	       	<totalConsPromoDatos4G>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia = '4G' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsPromoDatos4G>
	        <totalVigPromoDatos4G>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia = '4G' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigPromoDatos4G>
	       	<totalConsVentaDatosRoaming>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS_ROAMING' and ns0:promo = 'N']/ns0:initialQuantity)))}</totalConsVentaDatosRoaming>
	        <totalVigVentaDatosRoaming>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS_ROAMING' and ns0:promo = 'N']/ns0:remainingUnits)))}</totalVigVentaDatosRoaming>
	       	<totalConsPromoDatosRoaming>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS_ROAMING' and ns0:promo = 'S']/ns0:initialQuantity)))}</totalConsPromoDatosRoaming>
	        <totalVigPromoDatosRoaming>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS_ROAMING' and ns0:promo = 'S']/ns0:remainingUnits)))}</totalVigPromoDatosRoaming>
	       	<totalConsVentaDatosSocial>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tecnologia = 'SOC' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsVentaDatosSocial>
	        <totalVigVentaDatosSocial>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'N' and ns0:tecnologia = 'SOC' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigVentaDatosSocial>
	       	<totalConsPromoDatosSocial>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia = 'SOC' and ns0:tematica = ('N','ILI')]/ns0:initialQuantity)))}</totalConsPromoDatosSocial>
	        <totalVigPromoDatosSocial>{xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:promo = 'S' and ns0:tecnologia = 'SOC' and ns0:tematica = 'N']/ns0:remainingUnits)))}</totalVigPromoDatosSocial>
            <errorCode>0</errorCode>
            <errorDescription>
                {
                    if ((count($searchBalancesICC_response1/ns0:buckets[ns0:promo = ('S','N')]) <= 0 or empty($searchBalancesICC_response1/ns0:buckets[ns0:promo = ('S','N')]))) then
                        ('No se encuentran bucket para el cliente.')
                    else 
                        'Consulta Exitosa.'
                }
</errorDescription>
        </ns1:unitTotalExtendidaFullResponse>
};

declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:OUT_XQ_QueryUnitTotalExtendidaFull($searchBalancesICC_response1)