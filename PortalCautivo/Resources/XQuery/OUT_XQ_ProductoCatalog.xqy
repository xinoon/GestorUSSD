xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXTEL_PRODUCT_CATALOG_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getNextelProductCatalogResponse" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXTEL_PRODUCT_CATALOG_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_ProductoCatalog/";

declare function xf:OUT_XQ_ProductoCatalog($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:getNextelProductCatalogResponse) {
        <ns0:getNextelProductCatalogResponse>
            <prod_number>{ data($outputParameters1/ns1:SV_PROD_NUMBER) }</prod_number>
            {
                let $SV_PRODUCT_QT_LIST := $outputParameters1/ns1:SV_PRODUCT_QT_LIST
                return
                    <listProduct>
                        {
                            for $SV_PRODUCT_QT_LIST_ITEM in $SV_PRODUCT_QT_LIST/ns1:SV_PRODUCT_QT_LIST_ITEM
                            return
                                <itm_product>
                                    <name_product>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:NAME_PRODUCT) }</name_product>
                                    <desc_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:DESC_PROD) }</desc_prod>
                                    <id_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:ID_PROD) }</id_prod>
                                    <id_pcrf_product>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:ID_PCRF_PROD) }</id_pcrf_product>
                                    <id_bscs_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:ID_BSCS_PROD) }</id_bscs_prod>
                                    {
                                        for $LEVEL_PCRF_PROD in $SV_PRODUCT_QT_LIST_ITEM/ns1:LEVEL_PCRF_PROD
                                        return
                                            <level_pcrf_prod>{ data($LEVEL_PCRF_PROD) }</level_pcrf_prod>
                                    }
                                    <type_prod_bscs>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:TYPE_PROD_BSCS) }</type_prod_bscs>
                                    <tariff_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:TARIFF_PROD) }</tariff_prod>
                                    <unit_free>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:UNIT_FREE) }</unit_free>
                                    <promo>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:PROMO) }</promo>
                                    <category_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:CATEGORY_PROD) }</category_prod>
                                    <recurrence>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:RECURRENCE) }</recurrence>
                                    <segment_prod>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:SEGMENT_PROD) }</segment_prod>
                                    <family_plan>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:FAMILY_PLAN) }</family_plan>
                                    <status>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:STATUS) }</status>
                                    <vigencia>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:VIGENCIA) }</vigencia>
                                    <trafficType>{ data($SV_PRODUCT_QT_LIST_ITEM/ns1:TRAFFIC_TYPE) }</trafficType>
                                </itm_product>
                        }
                    </listProduct>
            }
            <error_code>{ data($outputParameters1/ns1:SN_COD_RETORNO) }</error_code>
            <err_description>{ data($outputParameters1/ns1:SV_MENS_RETORNO) }</err_description>
        </ns0:getNextelProductCatalogResponse>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:OUT_XQ_ProductoCatalog($outputParameters1)