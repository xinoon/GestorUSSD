xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getDatosAbonadoDbaInput" location="../WSDL/getDatosAbonadoDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getDatosAbonadoDba";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_GetDatosPlan/";

declare function xf:IN_XQ_GetDatosPlan($nroCelular as xs:string)
    as element(ns0:getDatosAbonadoDbaInput) {
        <ns0:getDatosAbonadoDbaInput>
            <ns0:NROCELULAR>{ $nroCelular }</ns0:NROCELULAR>
        </ns0:getDatosAbonadoDbaInput>
};

declare variable $nroCelular as xs:string external;


xf:IN_XQ_GetDatosPlan($nroCelular)