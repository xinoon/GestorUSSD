xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getMensajeSmsProductoInput" location="../WSDLs/getMensajeSmsProducto.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getMensajeSmsProducto";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_getMensajeSmsProduct/";

declare function xf:IN_XQ_getMensajeSmsProduct($id_prod as xs:string,
    $id_prod_pcrf as xs:string)
    as element(ns0:getMensajeSmsProductoInput) {
        <ns0:getMensajeSmsProductoInput>
            <ns0:id_pcrf_prod>{ $id_prod_pcrf }</ns0:id_pcrf_prod>
            <ns0:id_prod>{ $id_prod }</ns0:id_prod>
        </ns0:getMensajeSmsProductoInput>
};

declare variable $id_prod as xs:string external;
declare variable $id_prod_pcrf as xs:string external;

xf:IN_XQ_getMensajeSmsProduct($id_prod,
    $id_prod_pcrf)