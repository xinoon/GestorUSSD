xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getNextelCustomerInfoResponse1" element="ns0:getNextelCustomerInfoResponse" location="../../../PortalCautivo/Resources/WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setNextelActiveProduct" location="../../../PortalCautivo/Resources/WSDLs/CaptivePortalService_schema1.xsd" ::)

declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_NextelActiveProduct_OutInfoCliente/";

declare function xf:IN_XQ_NextelActiveProduct_OutInfoCliente($nroCelular as xs:string, $canal as xs:string,
    $id_prod as xs:string,
    $id_prod_service as xs:string,
    $getNextelCustomerInfoResponse1 as element(ns0:getNextelCustomerInfoResponse))
    as element(ns0:setNextelActiveProduct) {
        <ns0:setNextelActiveProduct>
            <client_name>{ $canal }</client_name>
            <phone_number>{ $nroCelular }</phone_number>
            <customer_id/>
            <client_type>PERSONA</client_type>
            <segment_prod>{ upper-case($getNextelCustomerInfoResponse1/segment_client/text()) }</segment_prod>
            <rate_plan>{ $getNextelCustomerInfoResponse1/iDPlan/text() }</rate_plan>
			<category_prod/>
            <id_prod>{ $id_prod }</id_prod>
            <id_pcrf_prod>{ $id_prod_service }</id_pcrf_prod>
            <id_bscs_prod/>
            <type_prod_bscs/>
            <date/>
            <metodo_pago>{ if($getNextelCustomerInfoResponse1/iDFormPago/text() = 'FACTURA') then ('CONTRA_FACTURA')
            else ('SALDO_PREPAGO') }</metodo_pago>
            <pago_aplicado>N</pago_aplicado>
            <transaction_code/>
        </ns0:setNextelActiveProduct> 
};

declare variable $nroCelular as xs:string external;
declare variable $canal as xs:string external;
declare variable $id_prod as xs:string external;
declare variable $id_prod_service as xs:string external;
declare variable $getNextelCustomerInfoResponse1 as element(ns0:getNextelCustomerInfoResponse) external;

xf:IN_XQ_NextelActiveProduct_OutInfoCliente($nroCelular, $canal,
    $id_prod,
    $id_prod_service,
    $getNextelCustomerInfoResponse1)