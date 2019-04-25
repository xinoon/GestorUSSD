xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXTEL_CUSTOMER_INFO_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getNextelCustomerInfoResponse" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXTEL_CUSTOMER_INFO_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_NextelCustomerInfo/";
declare function xf:formatDate($strDate as xs:string ) as xs:string
{
    if (empty($strDate) or fn-bea:trim($strDate) = '')then (
		let $strDate := ''
		return $strDate
	)
	else(
		let $shortStrDate :=  if(string-length($strDate) > 19) then (fn:substring($strDate,0,fn:string-length($strDate)-9)) else ($strDate)
		let $format:= fn:concat(fn-bea:dateTime-to-string-with-format('dd-MM-yyyy',xs:dateTime($shortStrDate)),' ',fn-bea:time-to-string-with-format("HH:mm:ss",xs:time(fn:substring($shortStrDate,12,11))))
		return $format
	)
    
};
declare function xf:OUT_XQ_NextelCustomerInfo($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:getNextelCustomerInfoResponse) {
        let $OutputParameters := $outputParameters1
        return
            <ns0:getNextelCustomerInfoResponse>
                <firstName>{ data($OutputParameters/ns1:SV_FIRST_NAME) }</firstName>
                <lastName>{ data($OutputParameters/ns1:SV_LAST_NAME) }</lastName>
                <technology>{ data($OutputParameters/ns1:SV_TECHNOLOGY) }</technology>
                <segment_client>{ data($OutputParameters/ns1:SV_SEGMENT_CLIENT) }</segment_client>
                <billingCustomerCode>{ data($OutputParameters/ns1:SV_BILLINGCUSTOMERCODE) }</billingCustomerCode>
                <billCycle>{ data($OutputParameters/ns1:SV_BILLCYCLE) }</billCycle>
                <iDPlan>{ data($OutputParameters/ns1:SV_IDPLAN) }</iDPlan>
                <Desc_IDPlan>{ data($OutputParameters/ns1:SV_DESC_IDPLAN) }</Desc_IDPlan>
                <status>{ data($OutputParameters/ns1:SV_STATUS) }</status>
                <begin_cycle>{ xf:formatDate(data($OutputParameters/ns1:SD_INICIO_CICLO)) }</begin_cycle>
                <end_cycle>{ xf:formatDate(data($OutputParameters/ns1:SD_FIN_CICLO))}</end_cycle>
                <iDFormPago>{ data($OutputParameters/ns1:SV_FORMA_PAGO) }</iDFormPago>
                <error_code>{ data($OutputParameters/ns1:SN_COD_RETORNO) }</error_code>
                <err_description>{ data($OutputParameters/ns1:SV_MENS_RETORNO) }</err_description>
            </ns0:getNextelCustomerInfoResponse>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:OUT_XQ_NextelCustomerInfo($outputParameters1)