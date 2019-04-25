xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getSearchBSCSBundles1" element="ns0:getSearchBSCSBundles" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ConsultaClienteGestorADDBInput" location="../WSDLs/ConsultaClienteGestorADDB.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ConsultaClienteGestorADDB";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_ConsultaClienteGestorAD_TO_BSConsultaClienteGestorAD/";

declare function xf:IN_XQ_ConsultaClienteGestorAD_TO_BSConsultaClienteGestorAD($getSearchBSCSBundles1 as element(ns0:getSearchBSCSBundles))
    as element(ns1:ConsultaClienteGestorADDBInput) {
        <ns1:ConsultaClienteGestorADDBInput>
            <ns1:client_name>{ data($getSearchBSCSBundles1/client_name) }</ns1:client_name>
        </ns1:ConsultaClienteGestorADDBInput>
};

declare variable $getSearchBSCSBundles1 as element(ns0:getSearchBSCSBundles) external;

xf:IN_XQ_ConsultaClienteGestorAD_TO_BSConsultaClienteGestorAD($getSearchBSCSBundles1)