xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$traficoDatos1" element="ns0:traficoDatos" location="../WSDL/TrafficDataService.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getTrafficDataDbaInput" location="../WSDL/getTrafficDataDba.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getTrafficDataDba";
declare namespace ns0 = "http://traficoDatos.wave.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/ConsultaTrafico/TrafficData/Resources/XQuery/IN_XQ_TrafficData/";

declare function xf:IN_XQ_TrafficData($traficoDatos1 as element(ns0:traficoDatos))
    as element(ns1:getTrafficDataDbaInput) {
        <ns1:getTrafficDataDbaInput>
            <ns1:NROCELULAR>{ data($traficoDatos1/nroCelular) }</ns1:NROCELULAR>
            <ns1:STARDATE>{ xs:date(xs:dateTime(data($traficoDatos1/fechaInicio))) }</ns1:STARDATE>
            <ns1:ENDDATE>{ xs:date(xs:dateTime(data($traficoDatos1/fechaFin))) }</ns1:ENDDATE>
        </ns1:getTrafficDataDbaInput>
};

declare variable $traficoDatos1 as element(ns0:traficoDatos) external;

xf:IN_XQ_TrafficData($traficoDatos1)