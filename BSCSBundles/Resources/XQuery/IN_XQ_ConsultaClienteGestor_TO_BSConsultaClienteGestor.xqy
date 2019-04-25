xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getSearchBSCSBundles1" element="ns1:getSearchBSCSBundles" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ConsultaClienteGestorDBInput" location="../WSDLs/ConsultaClienteGestorDB.xsd" ::)

declare namespace ns1 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ConsultaClienteGestorDB";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_ConsultaClienteGestor_TO_BSConsultaClienteGestor/";

declare function xf:IN_XQ_ConsultaClienteGestor_TO_BSConsultaClienteGestor($getSearchBSCSBundles1 as element(ns1:getSearchBSCSBundles))
    as element(ns0:ConsultaClienteGestorDBInput) {
        <ns0:ConsultaClienteGestorDBInput>
            <ns0:client_name>{ data($getSearchBSCSBundles1/client_name) }</ns0:client_name>
        </ns0:ConsultaClienteGestorDBInput>
};

declare variable $getSearchBSCSBundles1 as element(ns1:getSearchBSCSBundles) external;

xf:IN_XQ_ConsultaClienteGestor_TO_BSConsultaClienteGestor($getSearchBSCSBundles1)