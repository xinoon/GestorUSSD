xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getNextelProductCatalog1" element="ns0:getNextelProductCatalog" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXTEL_PRODUCT_CATALOG_PRC.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXTEL_PRODUCT_CATALOG_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ProductoCatalog/";

declare function xf:IN_XQ_ProductoCatalog($getNextelProductCatalog1 as element(ns0:getNextelProductCatalog))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CLIENT_NAME>{ data($getNextelProductCatalog1/client_name) }</ns1:P_CLIENT_NAME>
            {
                for $all_product in $getNextelProductCatalog1/all_product
                return
                    <ns1:P_ALL_PRODUCT>{ data($all_product) }</ns1:P_ALL_PRODUCT>
            }
        </ns1:InputParameters>
};

declare variable $getNextelProductCatalog1 as element(ns0:getNextelProductCatalog) external;

xf:IN_XQ_ProductoCatalog($getNextelProductCatalog1)