xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXTEL_CUSTOMER_INFO_PRC.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXTEL_CUSTOMER_INFO_PRC/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ConsultaCustomerInfoXsegmento/";

declare function xf:IN_XQ_ConsultaCustomerInfoXsegmento($p_PHONE_NUMBER1 as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_PHONE_NUMBER>{ $p_PHONE_NUMBER1 }</ns0:P_PHONE_NUMBER>
        </ns0:InputParameters>
};

declare variable $p_PHONE_NUMBER1 as xs:string external;

xf:IN_XQ_ConsultaCustomerInfoXsegmento($p_PHONE_NUMBER1)