xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setNextelActiveProduct1" element="ns0:setNextelActiveProduct" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setNextelActiveProduct" location="../WSDLs/ValidaCautivoPortal.xsd" ::)

declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ValidaActivaProd/";

declare function xf:IN_XQ_ValidaActivaProd($setNextelActiveProduct1 as element(ns0:setNextelActiveProduct))
    as element(ns0:setNextelActiveProduct) {
        <ns0:setNextelActiveProduct>
            <client_name>{ data($setNextelActiveProduct1/client_name) }</client_name>
            <phone_number>{ data($setNextelActiveProduct1/phone_number) }</phone_number>
            {
                for $customer_id in $setNextelActiveProduct1/customer_id
                return
                    <customer_id>{ data($customer_id) }</customer_id>
            }
            {    
                for $client_type in $setNextelActiveProduct1/client_type
                return
                    <client_type>{ data($client_type) }</client_type>
            }
            <segment_prod>{ data($setNextelActiveProduct1/segment_prod) }</segment_prod>
            <rate_plan>{ data($setNextelActiveProduct1/rate_plan) }</rate_plan>
            <category_prod>{ data($setNextelActiveProduct1/category_prod) }</category_prod>
            <id_prod>{ data($setNextelActiveProduct1/id_prod) }</id_prod>
            <id_pcrf_prod>{ data($setNextelActiveProduct1/id_pcrf_prod) }</id_pcrf_prod>
            <id_bscs_prod>{ data($setNextelActiveProduct1/id_bscs_prod) }</id_bscs_prod>
            {
                for $type_prod_bscs in $setNextelActiveProduct1/type_prod_bscs
                return
                    <type_prod_bscs>{ data($type_prod_bscs) }</type_prod_bscs>
            }
            <date>{ data($setNextelActiveProduct1/date) }</date>
            <metodo_pago>{ data($setNextelActiveProduct1/metodo_pago) }</metodo_pago>
            <pago_aplicado>{ data($setNextelActiveProduct1/pago_aplicado) }</pago_aplicado>
            <transaction_code>{ data($setNextelActiveProduct1/transaction_code) }</transaction_code>
        </ns0:setNextelActiveProduct>
};

declare variable $setNextelActiveProduct1 as element(ns0:setNextelActiveProduct) external;

xf:IN_XQ_ValidaActivaProd($setNextelActiveProduct1)