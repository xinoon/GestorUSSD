xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns2:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_GET_CATALOGO_PRODUCTOS_INT_PRC.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters2" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_GET_CUSTOMER_PRC.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters3" element="ns3:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_GETIMSI_BYMSISDN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setNextelActiveProductResponse" location="../WSDLs/ValidaCautivoPortal.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_CATALOGO_PRODUCTOS_INT_PRC/";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_CUSTOMER_PRC/";
declare namespace ns3 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GETIMSI_BYMSISDN/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_GET_ALL_INFO/";

declare function xf:OUT_XQ_GET_ALL_INFO($outputParameters1 as element(ns2:OutputParameters),
    $outputParameters2 as element(ns1:OutputParameters),
    $outputParameters3 as element(ns3:OutputParameters))
    as element(ns0:setNextelActiveProductResponse) {
        <ns0:setNextelActiveProductResponse>
            <id_prod>{ data($outputParameters1/ns2:SN_ID_PROD) }</id_prod>
            <id_pcrf_prod>{ data($outputParameters1/ns2:SN_ID_PCRF_PROD) }</id_pcrf_prod>
            <name_prod>{ data($outputParameters1/ns2:SV_NAME_PROD) }</name_prod>
            <id_bscs_prod>{ data($outputParameters1/ns2:SN_ID_BSCS_PROD) }</id_bscs_prod>
            <desc_prod>{ data($outputParameters1/ns2:SV_DESC_PROD) }</desc_prod>
            <category_prod>{ data($outputParameters1/ns2:SV_CATEGORY_PROD) }</category_prod>
            <promo>{ data($outputParameters1/ns2:SV_PROMO) }</promo>
            <tariff_prod>{ xs:string(data($outputParameters1/ns2:SN_TARIFF_PROD)) }</tariff_prod>
            <unit_free>{ xs:string(data($outputParameters1/ns2:SN_UNIT_FREE)) }</unit_free>
            <type_prod_bscs>{ data($outputParameters1/ns2:SV_TYPE_PROD_BSCS) }</type_prod_bscs>
            <traffic_type>{ data($outputParameters1/ns2:SV_TRAFFIC_TYPE) }</traffic_type>
            <unit_type>{ data($outputParameters1/ns2:SV_UNIT_TYPE) }</unit_type>
            <recurrence>{ data($outputParameters1/ns2:SV_RECURRENCE) }</recurrence>
            <status>{ data($outputParameters1/ns2:SV_STATUS) }</status>
            <level_pcrf_prod>{ data($outputParameters1/ns2:SV_LEVEL_PCRF_PROD) }</level_pcrf_prod>
            <segment_prod>{ data($outputParameters1/ns2:SV_SEGMENT_PROD) }</segment_prod>
            <channel_act>{ data($outputParameters1/ns2:SV_CHANNEL_ACT) }</channel_act>
            <platform_act>{ data($outputParameters1/ns2:SV_PLATFORM_ACT) }</platform_act>
            <family_plan>{ data($outputParameters1/ns2:SV_FAMILY_PLAN) }</family_plan>
            <bundle_type_flag>{ data($outputParameters1/ns2:SV_BUNDLE_TYPE_FLAG) }</bundle_type_flag>
            <cod_bundle_type>{ xs:string(data($outputParameters1/ns2:SN_COD_BUNDLE_TYPE)) }</cod_bundle_type>
            <des_bundle_type>{ data($outputParameters1/ns2:SV_DES_BUNDLE_TYPE) }</des_bundle_type>
            <cod_tipo_trafico>{ xs:string(data($outputParameters1/ns2:SN_COD_TIPO_TRAFICO)) }</cod_tipo_trafico>
            <template_id>{ xs:string(data($outputParameters1/ns2:SN_TEMPLATE_ID)) }</template_id>
            <spcode>{ xs:string(data($outputParameters1/ns2:SN_SPCODE)) }</spcode>
            <vigencia>{ xs:string(data($outputParameters1/ns2:SN_VIGENCIA)) }</vigencia>
            <lc_customer>{ xs:string(data($outputParameters2/ns1:SN_CUSTOMER_ID)) }</lc_customer>
            <lc_custCode>{ data($outputParameters2/ns1:SV_CUSTCODE) }</lc_custCode>
            <lc_imsi>{ data($outputParameters3/ns3:V_IMSI) }</lc_imsi>
            <lc_contractId>{ data($outputParameters2/ns1:SV_CONTRACT_ID) }</lc_contractId>
            <file1>{ data($outputParameters1/ns2:SV_FILE1) }</file1>
            <file2>{ data($outputParameters1/ns2:SV_FILE2) }</file2>
            <file3>{ data($outputParameters1/ns2:SV_FILE3) }</file3>
            <tmcode_shdes>{ data($outputParameters2/ns1:SV_TMCODE_SHDES) }</tmcode_shdes>
            <servicioKidPcrf>{ data($outputParameters1/ns2:SV_DATOS_KID_PCRF) }</servicioKidPcrf>
            <tecnologia>{ data($outputParameters1/ns2:SV_TECNOLOGIA) }</tecnologia>
            <error_code>{ xs:string(data($outputParameters1/ns2:SN_COD_RETORNO)) }</error_code>
            <err_description>{ data($outputParameters1/ns2:SV_MENS_RETORNO) }</err_description>
        </ns0:setNextelActiveProductResponse>
};

declare variable $outputParameters1 as element(ns2:OutputParameters) external;
declare variable $outputParameters2 as element(ns1:OutputParameters) external;
declare variable $outputParameters3 as element(ns3:OutputParameters) external;

xf:OUT_XQ_GET_ALL_INFO($outputParameters1,
    $outputParameters2,
    $outputParameters3)