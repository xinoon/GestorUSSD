xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getNextelCustomerInfoResponse1" element="ns0:getNextelCustomerInfoResponse" location="../../../PortalCautivo/Resources/WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_setCustomerInfo/";

declare function xf:OUT_XQ_setCustomerInfo($getNextelCustomerInfoResponse1 as element(ns0:getNextelCustomerInfoResponse),$plataforma as xs:string,$clasificaOferta as xs:string)
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            <segmento>{ 
				if(not(empty($getNextelCustomerInfoResponse1/segment_client/text()))) then (
					if(upper-case($getNextelCustomerInfoResponse1/segment_client/text()) = 'PREPAID') then (
						if($clasificaOferta = 'NaN') then (
							$plataforma
						)else(
							concat($plataforma,'-', $clasificaOferta)
						)	
					)else(
						if($clasificaOferta = 'NaN') then (
							upper-case($getNextelCustomerInfoResponse1/segment_client/text())
						)else(
							concat(upper-case($getNextelCustomerInfoResponse1/segment_client/text()),'-', $clasificaOferta)
						)					
					)
				)else()             
			}</segmento>
            <errorCode>{ $getNextelCustomerInfoResponse1/error_code/text() }</errorCode>
            <errorDescription>{ $getNextelCustomerInfoResponse1/err_description/text() }</errorDescription>
        </ns1:ussdOperacionResponse>
};

declare variable $clasificaOferta as xs:string external;
declare variable $plataforma as xs:string external;
declare variable $getNextelCustomerInfoResponse1 as element(ns0:getNextelCustomerInfoResponse) external;

xf:OUT_XQ_setCustomerInfo($getNextelCustomerInfoResponse1,$plataforma,$clasificaOferta)