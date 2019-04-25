xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$ussdOperacion1" element="ns1:ussdOperacion" location="../WSDL/USSDOperaciones.xsd" ::)
(:: pragma bea:global-element-return element="ns0:bundleProvisioningReq" location="../WSDL/bundleProvisioningReq_1.0.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://ws.wom.cl/WOM/NEG/ServiceOrderManagement/bundleProvisioning/v/1.0";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_GetBundleProvisioning/";

declare function xf:IN_XQ_GetBundleProvisioning($ussdOperacion1 as element(ns1:ussdOperacion))
    as element(ns0:bundleProvisioningReq) {
        <ns0:bundleProvisioningReq>
            <ns0:msisdn>{ data($ussdOperacion1/nroCelular) }</ns0:msisdn>
            <ns0:idProducto>{ data($ussdOperacion1/idProd) }</ns0:idProducto>
            <ns0:channel>USSD</ns0:channel>
        </ns0:bundleProvisioningReq>
};

declare variable $ussdOperacion1 as element(ns1:ussdOperacion) external;

xf:IN_XQ_GetBundleProvisioning($ussdOperacion1)