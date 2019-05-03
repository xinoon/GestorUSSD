xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getPromosAplicadas" location="../../../BenePro/Resources/WSDLs/BSCuentaContrato.xsd" ::)

declare namespace ns0 = "http://ccontrato.ws.srv.promo.wom.smartdici/";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_PrepaidAplicaPromo/";

declare function xf:IN_XQ_PrepaidAplicaPromo($estado as xs:string,
    $nroCelular as xs:string)
    as element(ns0:getPromosAplicadas) {
        <ns0:getPromosAplicadas>
            <contrato>{ $nroCelular }</contrato>
            <estado>{ $estado }</estado>
        </ns0:getPromosAplicadas>
};

declare variable $estado as xs:string external;
declare variable $nroCelular as xs:string external;

xf:IN_XQ_PrepaidAplicaPromo($estado,
    $nroCelular)