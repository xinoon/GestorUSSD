xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDL/PROVI_BOLS_NII_QUERY_PREPAID_WAVE_PKG_GET_OFERTA_BUCKET.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getAllInformationResponse1" element="ns0:getAllInformationResponse" location="../../../Alcatel-HighLevelApiWS/SubscriberLineManager/Resources/WSDL/subscriberLineManager.xsd" ::)
(:: pragma bea:schema-type-parameter parameter="$sReturnVO1" type="ns3:SReturnVO" location="../../../PCRF/WSDL/UPCCProvisioning.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)

declare namespace ns2 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_QUERY_PREPAID_WAVE_PKG/GET_OFERTA_BUCKET/";
declare namespace ns4 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns3 = "rm:type";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService/";


declare function xf:ZonaHorariaLocal($fechaZonaHoraria as xs:string ) as xs:dateTime
{
    if (empty($fechaZonaHoraria))then (
		let $time := ''
		return $time
	)
	else(
		 let $time := adjust-dateTime-to-timezone(xs:dateTime($fechaZonaHoraria),timezone-from-dateTime(xs:dateTime(current-dateTime())))
		 return $time
	)
    
};

declare function xf:cambioFormtDat($fecha as xs:string ) as xs:dateTime
{
    if (empty($fecha))then (
		let $StartTime := ''
		return $StartTime
	)
	else(
		 let $StartTime := xf:ZonaHorariaLocal(replace($fecha,"^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$","$1-$2-$3T$4:$5:$6"))
		 return $StartTime
	)
    
};

declare function xf:calculoMGVOZ($totalMegaVoz as xs:int, $tipoTrafico as xs:string) as xs:decimal
{

	if (not(empty($totalMegaVoz)))then (
	
		if (xs:decimal($totalMegaVoz) > 0)then (
		
			if (upper-case($tipoTrafico) = 'DATOS')then (

			let $returnSalida := xs:decimal($totalMegaVoz) * 1024
			return $returnSalida
			)
			else(
				if (upper-case($tipoTrafico) = 'VOZ')then (
	
				let $returnSalida := xs:decimal($totalMegaVoz) * 60
				return $returnSalida
				)
				else(
					if (upper-case($tipoTrafico) = 'SMS')then (
		
					let $returnSalida := $totalMegaVoz
					return $returnSalida
					)
					else(
						 let $returnEntrada := $totalMegaVoz
						 return $returnEntrada  
					)
				)
			)
			
		)
		else(
			 let $returnEntrada := $totalMegaVoz
			 return $returnEntrada  
		) 
	)
	else(
		 let $returnEntrada := 0
		 return $returnEntrada  
	) 

    
};



declare function xf:OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService($outputParameters1 as element(ns1:OutputParameters),
    $getAllInformationResponse1 as element(ns0:getAllInformationResponse),
    $sReturnVO1 as element(),
    $viewBucket as xs:string,
    $tipBucket as xs:string,
    $shDesPlan as xs:string)
    as element(ns2:searchBalancesICC-response) {
      <ns2:searchBalancesICC-response>
			<ns2:totalBalance>{ 
			 let $bucketDinero := $outputParameters1/ns1:ST_BUCKET_PROD_QT_LIST/ns1:IT_BUCKET_PROD_QT_LIST_ITEM[upper-case(ns1:DESC_BUCKET/text()) eq 'DINERO']/ns1:ID_PROD_BUCKET/text()
          	 let $balance1 := $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:balance
          	 let $balance := if (string-length($balance1) <= 2) then '0' else $balance1
          	 let $selBuckets1 :=$getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier = ($bucketDinero) and not(empty(ns4:remainingUnits/text()))]/ns4:remainingUnits
             let $remainingUnits:=sum($selBuckets1)
          	 let $totalSaldo:=xs:string(xs:integer($remainingUnits)+xs:integer($balance))  
          	 let $totalSaldoCalc:= if ($totalSaldo = '0' or $totalSaldo = '') then '0' else ( concat(substring($totalSaldo, 1,string-length($totalSaldo)-2),'.',
          	            substring($totalSaldo, string-length($totalSaldo)-1)) ) 
          	
          	 return xs:long(xs:double($totalSaldoCalc))

          }</ns2:totalBalance>
       
            <ns2:descPlan>{ $shDesPlan }</ns2:descPlan>
            
          	<ns2:balance>{ 
	          	 let $balances1 := $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:balance
	          	 let $balances := if (string-length($balances1) <= 2) then '0' else $balances1
	          	 let $balancesTotal := if ( $balances = '' or $balances = '0' ) then '0' else( substring($balances, 1,string-length($balances)-2) )
	          	 return xs:long(xs:double($balancesTotal))
          	}</ns2:balance>
            {
                for $activityEndDate in $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:activityBeginDate
                return
                    <ns2:dateBalance>{ data($activityEndDate) }</ns2:dateBalance>
            } 
			{
                for $SV_MENS_RETORNO in $outputParameters1/ns1:SV_MENS_RETORNO
                return
                    <ns2:err_description>{ data($SV_MENS_RETORNO) }</ns2:err_description>
            }
            {
                for $SN_COD_RETORNO in $outputParameters1/ns1:SN_COD_RETORNO
                return
                    <ns2:error_code>{ data($SN_COD_RETORNO) }</ns2:error_code>
            }
            {
            if(upper-case($viewBucket) = 'Y') then (
            	if (upper-case($tipBucket) = 'BALANCE') then (
                    for $IT_BUCKET_PROD_QT_LIST_ITEM in $outputParameters1/ns1:ST_BUCKET_PROD_QT_LIST/ns1:IT_BUCKET_PROD_QT_LIST_ITEM
	                let $ID_PROD_BUCKET := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:ID_PROD_BUCKET
	                let $ID_TIPO_TRAFICO := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TIPO_TRAFICO
	                let $ID_PROMO := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:PROMO
	                let $ID_TECNOLOGIA := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TECNOLOGIA
	                let $ID_PLATFORM_ACT := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:PLATFORM_ACT
	                let $ID_DESC_BUCKET := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:DESC_BUCKET
	                let $ID_BASAL := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:BASAL
	                let $ID_TEMATICA := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TEMATICA
	                return
	                    if(upper-case($ID_DESC_BUCKET/text()) = 'DINERO' and $ID_PROD_BUCKET/text() = $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets/ns4:rowIdentifier/text())then (
		                    <ns2:buckets>
		                        <ns2:creationDate>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:creationDate/text()  }</ns2:creationDate>
		                        <ns2:glCode>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:glCode/text()  }</ns2:glCode>
		                        <ns2:initialCost>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:initialCost/text()  }</ns2:initialCost>
		                        <ns2:initialQuantity>{  if ($ID_TEMATICA = 'S' or $ID_TEMATICA = '') then
			                        
			                        (0)
			                        
			                        else 
			                        
			                       ( $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:initialQuantity/text())  }</ns2:initialQuantity>
		                        <ns2:limitDate>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:limitDate/text()}</ns2:limitDate>
		                        <ns2:remainingUnits>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:remainingUnits/text()  }</ns2:remainingUnits>
		                        <ns2:rowIdentifier>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:rowIdentifier/text()  }</ns2:rowIdentifier>
		                		<ns2:startDate>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:startDate/text() }</ns2:startDate>
		                        <ns2:usageLabelRef>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:usageLabelRef/text()}</ns2:usageLabelRef>
		                        <ns2:validity>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:validity/text()  }</ns2:validity>
		                        <ns2:tipoTrafico>{ $ID_TIPO_TRAFICO/text()}</ns2:tipoTrafico>
		                        <ns2:promo>{ $ID_PROMO/text()}</ns2:promo>
		                        <ns2:tecnologia>{ $ID_TECNOLOGIA/text()}</ns2:tecnologia>
		                        <ns2:plataforma>{ $ID_PLATFORM_ACT/text()}</ns2:plataforma>
		                        <ns2:basal>{ $ID_BASAL/text()}</ns2:basal>
		                        <ns2:tematica>{ $ID_TEMATICA/text()}</ns2:tematica>
		                    </ns2:buckets>
	                    )else(
	                    )
                    )else(
		                for $IT_BUCKET_PROD_QT_LIST_ITEM in $outputParameters1/ns1:ST_BUCKET_PROD_QT_LIST/ns1:IT_BUCKET_PROD_QT_LIST_ITEM
		                let $ID_PROD_BUCKET := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:ID_PROD_BUCKET
		                let $ID_TIPO_TRAFICO := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TIPO_TRAFICO
		                let $ID_PROMO := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:PROMO
		                let $ID_TECNOLOGIA := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TECNOLOGIA
		                let $ID_PLATFORM_ACT := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:PLATFORM_ACT
	                	let $ID_DESC_BUCKET := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:DESC_BUCKET
	                	let $ID_BASAL := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:BASAL
	                	let $ID_PROPIE1 := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:PROPIE1
	                	let $ID_TEMATICA := $IT_BUCKET_PROD_QT_LIST_ITEM/ns1:TEMATICA
		                return
		                    if(upper-case($ID_DESC_BUCKET/text()) != 'DINERO' and $ID_PROD_BUCKET/text() = $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets/ns4:rowIdentifier/text())then (
			                    <ns2:buckets>
			                        <ns2:creationDate>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:creationDate/text()  }</ns2:creationDate>
			                        <ns2:glCode>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:glCode/text()  }</ns2:glCode>
			                        <ns2:initialCost>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:initialCost/text()  }</ns2:initialCost>
			                        <ns2:initialQuantity>{
			                        
			                        if ($ID_TEMATICA = 'S' or $ID_TEMATICA = '') then
			                        
			                        (0)
			                        
			                        else 
			                        
			                        (let $valor := if (upper-case($ID_BASAL/text()) = 'S') then 
			                                             (xf:calculoMGVOZ($ID_PROPIE1/text(), $ID_TIPO_TRAFICO/text()))
			                                      else
			                                      		 ($getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:initialQuantity/text())
			                        
			                                      return xs:decimal( fn:replace(xs:string($valor),'','0')) - xs:decimal(replace($getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:remainingUnits/text(),'','0'))  
			                        )
			                                              }
			                        </ns2:initialQuantity>
			                        <ns2:limitDate>{ 
			                        let $limitDate := $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:limitDate/text()
			                        return if(not(empty($limitDate))) then xf:ZonaHorariaLocal($limitDate) else ()
			                        }</ns2:limitDate>
			                        <ns2:remainingUnits>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:remainingUnits/text()  }</ns2:remainingUnits>
			                        <ns2:rowIdentifier>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:rowIdentifier/text()  }</ns2:rowIdentifier>
			                		<ns2:startDate>{ 
			                		let $startDate := $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:startDate/text() 
			                		return if(not(empty($startDate))) then (xf:ZonaHorariaLocal($startDate)) else ()
			                		}</ns2:startDate>
			                        <ns2:usageLabelRef>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:usageLabelRef/text()}</ns2:usageLabelRef>
			                        <ns2:validity>{ $getAllInformationResponse1/ns0:return/ns4:defaultAccount/ns4:buckets[ns4:rowIdentifier eq $ID_PROD_BUCKET/text()]/ns4:validity/text()  }</ns2:validity>
			                        <ns2:tipoTrafico>{ $ID_TIPO_TRAFICO/text()}</ns2:tipoTrafico>
			                        <ns2:promo>{ $ID_PROMO/text()}</ns2:promo>
			                        <ns2:tecnologia>{ $ID_TECNOLOGIA/text()}</ns2:tecnologia>
			                        <ns2:plataforma>{ $ID_PLATFORM_ACT/text()}</ns2:plataforma>
			                        <ns2:basal>{ $ID_BASAL/text()}</ns2:basal>
			                        <ns2:tematica>{ $ID_TEMATICA/text()}</ns2:tematica>
			                    </ns2:buckets>
		                    )elseif($ID_PROD_BUCKET/text() = $sReturnVO1/subscriberQuota/attribute[key eq 'SRVNAME']/value/text()) then
		                    (           
			                	for $subscriberQuota in $sReturnVO1/subscriberQuota
			                	let $qtaBalance := $subscriberQuota/attribute[key eq 'QTABALANCE']/value/text()
			                	let $cuotaInicial:= $subscriberQuota/attribute[key eq 'QTAVALUE']/value/text()
			                	let $cuotaConsumida:= $subscriberQuota/attribute[key eq 'QTACONSUMPTION']/value/text()
			                	
			                	let $accumulationValue:= $subscriberQuota/attribute[key eq 'ACCUMULATIONVALUE']/value/text()
			                	let $accumulationBalance:= $subscriberQuota/attribute[key eq 'ACCUMULATIONBALANCE']/value/text()
			                	let $accumulationConsumption:= $subscriberQuota/attribute[key eq 'ACCUMULATIONCONSUMPTION']/value/text()
			                	let $accumulationStartTime:= $subscriberQuota/attribute[key eq 'ACCUMULATIONSTARTTIME']/value/text()
			                	let $accumulationEndTime:= $subscriberQuota/attribute[key eq 'ACCUMULATIONENDTIME']/value/text()			                			              	
			                	let $accumulationLabelGap := concat($ID_PROD_BUCKET/text(),"_roll")
			                	let $accumulationNoBasal := "NOBASAL"
			                	let $accumulationTotal:=xs:string(xs:integer($accumulationBalance)+xs:integer($accumulationConsumption))			                			                	
			                	return
			                		if($ID_PROD_BUCKET/text() = $subscriberQuota/attribute[key eq 'SRVNAME']/value/text()) then (
					                    <ns2:buckets>
					                        {
							                	for $subscribedService in $sReturnVO1/subscribedService
							                	let $startDate := $subscribedService/attribute[key eq 'SRVSTARTDATETIME']/value/text()
							                	return
							                	    if($ID_PROD_BUCKET/text() = $subscribedService/attribute[key eq 'SRVNAME']/value/text())then (
							                	    	<ns2:creationDate>{if($startDate != '-1'and not(empty($startDate))) then (xf:cambioFormtDat($startDate))else()}</ns2:creationDate>
							                	    )
							                	    else(
							                	    )                    
							                }
					                        <ns2:glCode></ns2:glCode>
					                        <ns2:initialCost>{$cuotaInicial}</ns2:initialCost>
					                        <ns2:initialQuantity>{$cuotaConsumida}</ns2:initialQuantity>
					                        {
							                	for $subscribedService in $sReturnVO1/subscribedService
							                	let $qtaFecha := $subscribedService/attribute[key eq 'SRVENDDATETIME']/value/text()
							                	return
							                	    if($ID_PROD_BUCKET/text() = $subscribedService/attribute[key eq 'SRVNAME']/value/text())then (
							                	    	<ns2:limitDate>{if($qtaFecha != '-1' and not(empty($qtaFecha))) then (xf:cambioFormtDat($qtaFecha))else()}</ns2:limitDate>
							                	    )
							                	    else(
							                	    )                    
							                }						                   	    					                        
					                        
					                        <ns2:remainingUnits>{ $qtaBalance }</ns2:remainingUnits>
					                        <ns2:rowIdentifier></ns2:rowIdentifier>
					                		{
							                	for $subscribedService in $sReturnVO1/subscribedService
							                	let $startDate := $subscribedService/attribute[key eq 'SRVSTARTDATETIME']/value/text()
							                	return
							                	    if($ID_PROD_BUCKET/text() = $subscribedService/attribute[key eq 'SRVNAME']/value/text())then (
							                	    	<ns2:startDate>{if($startDate != '-1') then (xf:cambioFormtDat($startDate))else()}</ns2:startDate>
							                	    )
							                	    else(
							                	    )                    
							                }
					                        <ns2:usageLabelRef>{ $ID_PROD_BUCKET/text()}</ns2:usageLabelRef>
					                        <ns2:validity></ns2:validity>
					                        <ns2:tipoTrafico>{ $ID_TIPO_TRAFICO/text()}</ns2:tipoTrafico>
					                        <ns2:promo>{ $ID_PROMO/text()}</ns2:promo>
				                        	<ns2:tecnologia>{ $ID_TECNOLOGIA/text()}</ns2:tecnologia>
			                        		<ns2:plataforma>{ $ID_PLATFORM_ACT/text()}</ns2:plataforma>
			                        		<ns2:basal>{ $ID_BASAL/text()}</ns2:basal>
			                        		<ns2:tematica>{ $ID_TEMATICA/text()}</ns2:tematica>
					                    </ns2:buckets>
										,if($accumulationValue != '0') then (       
										   <ns2:buckets>
										   <ns2:creationDate></ns2:creationDate>                                    
										   <ns2:glCode></ns2:glCode>
										   <ns2:initialCost>{ $accumulationTotal }</ns2:initialCost>
										   <ns2:initialQuantity>{ $accumulationConsumption }</ns2:initialQuantity>
										   <ns2:limitDate>{if($accumulationEndTime != '-1'and not(empty($accumulationEndTime))) then (xf:cambioFormtDat($accumulationEndTime))else()}</ns2:limitDate>                                        
										   <ns2:remainingUnits>{ $accumulationBalance }</ns2:remainingUnits>
										   <ns2:rowIdentifier></ns2:rowIdentifier>
										   <ns2:startDate>{if($accumulationStartTime != '-1'and not(empty($accumulationStartTime))) then (xf:cambioFormtDat($accumulationStartTime))else()}</ns2:startDate>
										   <ns2:usageLabelRef>{ $accumulationLabelGap }</ns2:usageLabelRef>
										   <ns2:validity></ns2:validity>
										   <ns2:tipoTrafico>{ $ID_TIPO_TRAFICO/text()}</ns2:tipoTrafico>
										   <ns2:promo>{ $ID_PROMO/text()}</ns2:promo>
										   <ns2:tecnologia>{ $ID_TECNOLOGIA/text()}</ns2:tecnologia>
										   <ns2:plataforma>{ $ID_PLATFORM_ACT/text()}</ns2:plataforma>
										   <ns2:basal>{ $accumulationNoBasal }</ns2:basal>
										   <ns2:tematica>{ $ID_TEMATICA/text()}</ns2:tematica>
										   </ns2:buckets>  
										   )else()				                    	  
				                    )else(
				                    )
	                    )else(
	                    )
                    )
                )else(
                )    
            }
        </ns2:searchBalancesICC-response>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $getAllInformationResponse1 as element(ns0:getAllInformationResponse) external;
declare variable $sReturnVO1 as element() external;
declare variable $viewBucket as xs:string external;
declare variable $tipBucket as xs:string external;
declare variable $shDesPlan as xs:string external;

xf:OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService($outputParameters1,
    $getAllInformationResponse1,
    $sReturnVO1,
    $viewBucket,
    $tipBucket,
    $shDesPlan)