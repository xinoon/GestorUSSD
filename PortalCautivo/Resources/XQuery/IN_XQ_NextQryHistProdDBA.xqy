xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getNextQryHistProd1" element="ns0:getNextQryHistProd" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXT_QRY_HIST_PROD_PRC.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXT_QRY_HIST_PROD_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_NextQryHistProdDBA/";

declare function xf:IN_XQ_NextQryHistProdDBA($getNextQryHistProd1 as element(ns0:getNextQryHistProd))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_PHONE_NUMBER>{ data($getNextQryHistProd1/phone_number) }</ns1:P_PHONE_NUMBER>
            <ns1:P_QTY_PERIOD>{ data($getNextQryHistProd1/qty_period) }</ns1:P_QTY_PERIOD>
        </ns1:InputParameters>
};

declare variable $getNextQryHistProd1 as element(ns0:getNextQryHistProd) external;

xf:IN_XQ_NextQryHistProdDBA($getNextQryHistProd1)