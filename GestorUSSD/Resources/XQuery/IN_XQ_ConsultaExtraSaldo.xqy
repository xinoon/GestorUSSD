xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:consultaExtraCreditoRequest" location="../WSDL/ConsultaExtraSaldo.xsd" ::)

declare namespace ns0 = "http://operaciones.extracredito.wom.ws.ncl.com/ConsultaExtraSaldo";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_ConsultaExctraSaldo/";

declare function xf:IN_XQ_ConsultaExctraSaldo($nroCelular as xs:string)
    as element(ns0:consultaExtraCreditoRequest) {
        <ns0:consultaExtraCreditoRequest>
            <ns0:nroCelular>{ $nroCelular }</ns0:nroCelular>
        </ns0:consultaExtraCreditoRequest>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_ConsultaExctraSaldo($nroCelular)