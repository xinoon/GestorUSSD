xquery version "2004-draft" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/XQ_OrdTotalesDatosSmsVoz/";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";

declare function xf:XQ_OrdTotalesDatosSmsVoz($searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(*) {
    <lista>
	   <total>
	   	  (: totalDatos= megas de todas las bolsas que sobran luego de RRSS y 4G :)
	   	  (: totalDatosSocial= megas de bolsas datos catalogadas como redes sociales "ya sea regaladas o promocionales" :)
	   	  (: totalDatos4G= megas de bolsas de datos catalogadas como 4G "ya sea regaladas o promocionales" :)
	      <saldoTotal>{ $searchBalancesICC_response1/ns0:totalBalance/text() }</saldoTotal>
	      <totalDatos>{
	      if(empty($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = '3G' and ns0:tematica = 'ILI']/ns0:usageLabelRef/text())) then (
	      	xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = '3G' and ns0:tematica != 'ILI']/ns0:remainingUnits))) 
		     )else('Ilimitado')
	      }</totalDatos>
	      <totalDatos4G>{ 
	      if(empty($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = '4G' and ns0:tematica = 'ILI']/ns0:usageLabelRef/text())) then (
	      	xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = '4G' and ns0:tematica != 'ILI']/ns0:remainingUnits)))
	      	)else('Ilimitado')
	      }</totalDatos4G>
	      <totalDatosSocial>{ 
	      if(empty($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = 'SOC' and ns0:tematica = 'ILI']/ns0:remainingUnits/text())) then(
	      	xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = 'SOC' and ns0:tematica != 'ILI']/ns0:remainingUnits))) 
	      )else('Ilimitado')
	      }</totalDatosSocial>
	      <DatosWhatSapp>{ if(empty(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = 'WSP' and ns0:promo = 'S' and ns0:tematica != 'ILI']/ns0:tecnologia))) then ('NO') else ('SI') }</DatosWhatSapp>
	      <totalVoz>{
	      if(empty($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:tematica = 'ILI']/ns0:remainingUnits/text())) then (
	      	xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:tematica != 'ILI']/ns0:remainingUnits)))
	      )else('Ilimitado')
	      }</totalVoz>
	      
	      (:
	      	se deja de utilizar totalSms. 
	      	Por ahora en este campo va a ser reutilizado y en lugar de mandar sms se va a mandar video. (solucion sucia y rapida a un cambio urgente)
	      	normalizar esto a penas se pueda agregando el campo totalVideo
	      	<totalSms>{ xs:int(sum(data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'SMS' and ns0:tematica != 'ILI']/ns0:remainingUnits))) }</totalSms>
	      :)
	      
			<totalSms>{
				if(
					empty($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = 'VID' and ns0:tematica = 'ILI']/ns0:remainingUnits/text())
				) then (
					xs:int(
						sum(
							data($searchBalancesICC_response1/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tecnologia = 'VID']/ns0:remainingUnits)
						)
					)
				)else('Ilimitado')
			}</totalSms>
	      
	      
	   </total>
	</lista>
};

declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:XQ_OrdTotalesDatosSmsVoz($searchBalancesICC_response1)