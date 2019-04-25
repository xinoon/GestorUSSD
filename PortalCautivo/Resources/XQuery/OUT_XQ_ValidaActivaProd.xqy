xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setNextelActiveProductResponse1" element="ns0:setNextelActiveProductResponse" location="../WSDLs/ValidaCautivoPortal.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setNextelActiveProduct" location="../WSDLs/TraficTypePortal.xsd" ::)

declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_ValidaActivaProd/";

declare function xf:OUT_XQ_ValidaActivaProd($setNextelActiveProductResponse1 as element(ns0:setNextelActiveProductResponse),
    $phone_number as xs:string,
    $customer_id as xs:string,
    $client_type as xs:string,
    $rate_plan as xs:string,
    $date as xs:string,
    $metodo_pago as xs:string,
    $pago_aplicado as xs:string,
    $transaction_code as xs:string)
    as element(ns0:setNextelActiveProduct) {
        <ns0:setNextelActiveProduct>
            <phone_number>{ $phone_number }</phone_number>
            <customer_id>{ $customer_id }</customer_id>
            <client_type>{ $client_type }</client_type>
            <segment_prod>{ data($setNextelActiveProductResponse1/segment_prod) }</segment_prod>
            <rate_plan>{ data($setNextelActiveProductResponse1/tmcode_shdes) }</rate_plan>
            <category_prod>{ data($setNextelActiveProductResponse1/category_prod) }</category_prod>
            <type_prod_bscs>{ data($setNextelActiveProductResponse1/type_prod_bscs) }</type_prod_bscs>
            <date>{ $date }</date>
            <metodo_pago>{ $metodo_pago }</metodo_pago>
            <pago_aplicado>{ $pago_aplicado }</pago_aplicado>
            <transaction_code>{ $transaction_code }</transaction_code>
            <id_prod>{ data($setNextelActiveProductResponse1/id_prod) }</id_prod>
            <id_pcrf_prod>{ data($setNextelActiveProductResponse1/id_pcrf_prod) }</id_pcrf_prod>
            <name_prod>{ data($setNextelActiveProductResponse1/name_prod) }</name_prod>
            <id_bscs_prod>{ data($setNextelActiveProductResponse1/id_bscs_prod) }</id_bscs_prod>
            <desc_prod>{ data($setNextelActiveProductResponse1/desc_prod) }</desc_prod>
            <promo>{ data($setNextelActiveProductResponse1/promo) }</promo>
            <tariff_prod>{ data($setNextelActiveProductResponse1/tariff_prod) }</tariff_prod>
            <unit_free>{ data($setNextelActiveProductResponse1/unit_free) }</unit_free>
            <traffic_type>{ data($setNextelActiveProductResponse1/traffic_type) }</traffic_type>
            <unit_type>{ data($setNextelActiveProductResponse1/unit_type) }</unit_type>
            <recurrence>{ data($setNextelActiveProductResponse1/recurrence) }</recurrence>
            <status>{ data($setNextelActiveProductResponse1/status) }</status>
            <level_pcrf_prod>{ data($setNextelActiveProductResponse1/level_pcrf_prod) }</level_pcrf_prod>
            <channel_act>{ data($setNextelActiveProductResponse1/channel_act) }</channel_act>
            <platform_act>{ data($setNextelActiveProductResponse1/platform_act) }</platform_act>
            <family_plan>{ data($setNextelActiveProductResponse1/family_plan) }</family_plan>
            <bundle_type_flag>{ data($setNextelActiveProductResponse1/bundle_type_flag) }</bundle_type_flag>
            <cod_bundle_type>{ data($setNextelActiveProductResponse1/cod_bundle_type) }</cod_bundle_type>
            <des_bundle_type>{ data($setNextelActiveProductResponse1/des_bundle_type) }</des_bundle_type>
            <cod_tipo_trafico>{ data($setNextelActiveProductResponse1/cod_tipo_trafico) }</cod_tipo_trafico>
            <template_id>{ data($setNextelActiveProductResponse1/template_id) }</template_id>
            <spcode>{ data($setNextelActiveProductResponse1/spcode) }</spcode>
            <vigencia>{ data($setNextelActiveProductResponse1/vigencia) }</vigencia>
            <lc_customer>{ data($setNextelActiveProductResponse1/lc_customer) }</lc_customer>
            <lc_custCode>{ data($setNextelActiveProductResponse1/lc_custCode) }</lc_custCode>
            <lc_imsi>{ data($setNextelActiveProductResponse1/lc_imsi) }</lc_imsi>
            <lc_contractId>{ data($setNextelActiveProductResponse1/lc_contractId) }</lc_contractId>
            <file1>{ data($setNextelActiveProductResponse1/file1) }</file1>
            <file2>{ data($setNextelActiveProductResponse1/file2) }</file2>
            <file3>{ data($setNextelActiveProductResponse1/file3) }</file3>
            <codPlan>{ $rate_plan }</codPlan>
            <servicioKidPcrf>{ data($setNextelActiveProductResponse1/servicioKidPcrf) }</servicioKidPcrf>
            <tecnologia>{ data($setNextelActiveProductResponse1/tecnologia) }</tecnologia>
        </ns0:setNextelActiveProduct>
};

declare variable $setNextelActiveProductResponse1 as element(ns0:setNextelActiveProductResponse) external;
declare variable $phone_number as xs:string external;
declare variable $customer_id as xs:string external;
declare variable $client_type as xs:string external;
declare variable $rate_plan as xs:string external;
declare variable $date as xs:string external;
declare variable $metodo_pago as xs:string external;
declare variable $pago_aplicado as xs:string external;
declare variable $transaction_code as xs:string external;

xf:OUT_XQ_ValidaActivaProd($setNextelActiveProductResponse1,
    $phone_number,
    $customer_id,
    $client_type,
    $rate_plan,
    $date,
    $metodo_pago,
    $pago_aplicado,
    $transaction_code)